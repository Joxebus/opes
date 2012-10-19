package opes.login

import opes.institucion.Docente
import opes.institucion.Alumno

class InicioController {

    def springSecurityService
    def validacionTipoArchivoService

    def beforeInterceptor = {
        if (!springSecurityService.isLoggedIn()) {
            redirect controller: "login", action: 'auth', params: params
            return false
        }
    }

    def index() {
        session.usuario = springSecurityService.currentUser
        switch (session.usuario.tipoUsuario) {
            case "ALUMNO":
                session.alumnoDocente = Alumno.findByUsuarioSistemaAndEstadoLogicoNotEqual(session.usuario, 3)
                break;
            case "DOCENTE":
                session.alumnoDocente = Docente.findByUsuarioSistemaAndEstadoLogicoNotEqual(session.usuario, 3)
                break;
        }
    }

    def actualizarUsuario() {
        def usuario = UsuarioSistema.get(session.usuario.id)
        usuario.properties = params
        if (params.fotografia) {
            def typo = validacionTipoArchivoService.isFoto(params.fotografia.toString().substring(params.fotografia.toString().lastIndexOf('.')+1))
            println "Tipo de la imagen que se va a guardar $typo"
            def imageTool = new org.grails.plugins.imagetools.ImageTool()
            imageTool.load(params.fotografia.bytes)
            imageTool.thumbnail(460)
            switch (usuario.tipoUsuario) {
                case "ALUMNO":
                    def alumno = Alumno.findByUsuarioSistemaAndEstadoLogicoNotEqual(usuario, 3)
                    alumno.foto = imageTool.getBytes("JPEG")
                    alumno.typo = typo
                    alumno.beforeUpdate()
                    if(!alumno.save(flush: true)){
                        println "no se pudo guardar la imagen"
                    }
                    break;
                case "DOCENTE":
                    def docente = Docente.findByUsuarioSistemaAndEstadoLogicoNotEqual(usuario, 3)
                    docente.foto = imageTool.getBytes("JPEG")
                    docente.typo = typo
                    docente.beforeUpdate()
                    if(!docente.save(flush: true)){
                       flash.error "No se pudo guardar la imagen"
                    }
                    break;
            }
        }
        usuario.beforeUpdate()
        usuario.save()
        if(!flash.error)
            flash.success = "El usuario ha sido actualizado correctamente"
        redirect action: 'index'
    }

    def mostrarFotografia = {
        def usuario = UsuarioSistema.get(session.usuario.id)
        def alumnoDocente
        switch (usuario.tipoUsuario) {
            case "ALUMNO":
                alumnoDocente = Alumno.findByUsuarioSistemaAndEstadoLogicoNotEqual(usuario, 3)
                response.contentType = alumnoDocente.typo
                response.outputStream << alumnoDocente.foto
                response.outputStream.flush()
                break;
            case "DOCENTE":
                alumnoDocente = Docente.findByUsuarioSistemaAndEstadoLogicoNotEqual(usuario, 3)
                response.contentType = alumnoDocente.typo
                response.outputStream << alumnoDocente.foto
                response.outputStream.flush()
                break;
            default:
                redirect action:"index"
                break;
        }


    }
}
