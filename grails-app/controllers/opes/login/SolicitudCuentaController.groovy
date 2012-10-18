package opes.login

import opes.utils.*


import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.servlet.ModelAndView
import opes.institucion.Alumno
import opes.institucion.Docente

class SolicitudCuentaController {
    def springSecurityService
    def loginService
    def solicitudCuentaService
    def defaultViewSolicitudCuenta = "/login/SolicitudCuenta"

    static defaultAction = "list"

    static valorDelParametro
    static valorFiltro = 1

    private EmailUtils emailUtils = new EmailUtils()
    private CriptoUtils criptoUtils = new CriptoUtils()

    def list = {

        flash.clear()

        valorFiltro = 1

        params.max = Math.min(params.max ? params.int('max') : 10, 1000)
        if (!params.sort)
            params.sort = "id"
        if (!params.order)
            params.order = "desc"

        def usuariosList = UsuarioSistema.findAllByEstadoLogicoNotEqual(3, params)
        def usuariosTotal = UsuarioSistema.countByEstadoLogicoNotEqual(3, params)

        render(view: '/login/SolicitudCuenta', model: [usuariosList: usuariosList, usuariosTotal: usuariosTotal])

    }


    def resumenActivaUsuario = {
        def model = [:]
        String password = this.criptoUtils.getNuevaContrasenia()
        def usuario = UsuarioSistema.get(params.id)
        model += [idUsuario: params.id]
        model += [contrasenia: password]
        model += [email: usuario.username]
        return new ModelAndView("/login/CreacionCuentaUsuario", model)
    }

    def activaUsuario = {
        log.info('ACTIVACION USUARIO')
        log.info('UsuarioAc:' + params.id)
        def model = [:]
        def usuario = UsuarioSistema.get(params.id)

        def rol = session.rolesPendientes.get("${params.id}")

        log.info("Enviando notificacion a el usuario: ${params.email}")
        // TODO: Descomentar y checar el correo correcto que deberia de ponerse
        this.emailUtils.subject = "Activaci\u00F3n de cuenta del sistema OPES"
        this.emailUtils.from = "no-reply@opes.com"
        this.emailUtils.contentHtml = this.getHtmlActivar(usuario, params.contrasenia)
        this.emailUtils.recipients = ["${params.email}".trim()]
        this.emailUtils.sendEmail();

        //Hasta aqu�

        if (rol == null) {
            usuario.password = params.contrasenia
            usuario.enabled = true
            usuario.save(flush: true)
            log.info "El usuario ${usuario.nombre} fue re-activado completamente"
        } else {
            def role = Permiso.findByAuthority(rol)
            usuario.password = params.contrasenia
            usuario.enabled = true
            usuario.save(flush: true)
            switch(role.authority){
                case "ROLE_ALUMNO":
                    def alumno = new Alumno([usuarioSistema:usuario])
                    alumno.beforeInsert()
                    alumno.save(flush:true)
                    break;
                case "ROLE_DOCENTE":
                    def docente = new Docente([usuarioSistema:usuario])
                    docente.beforeInsert()
                    docente.save(flush:true)
                    break;
            }
            UsuarioSistemaPermiso.create usuario, role, true
            log.info "El usuario ${usuario.nombre} fue activado completamente con el rol ${role.authority}"
        }
        return new ModelAndView("/login/ActivacionExitosa", model)
    }



    def instruccionesToolTip = {
        render """
		Es la observaci\u00F3n que se requiere<br>
		poner, por ejemplo: El puesto:<br>
		Director General
		"""
    }

    def asignarRol = {
        if (!session.rolesPendientes) {
            session.rolesPendientes = [:]
        }
        session.rolesPendientes += [("${params.id}"): params.role]

        def model = solicitudCuentaService.getPaginaUsuarios(params.max, params.offset)
        model += [criterio: "-Seleccione un criterio-"]
        model += [valorCriterio: ""]
        model += [rol: params.role]
        log.info "Almacenando en memoria el rol asignado al idUsuario: ${params.id} - rol: ${params.role}"
        return new ModelAndView(this.defaultViewSolicitudCuenta, model)
    }


    private def getHtmlActivar(usuario, password) {
        return """
			<!doctype html>
			<html>
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title>Activaci&oacute;n de Cuenta</title>
			<style type="text/css">
			<!--
			body {
			font: Arial, "Lucida Grande", "Lucida Sans Unicode", Helvetica, Verdana, sans-serif
				margin-left: 50px;
				margin-right: 50px;				
				background-attachment: fixed;
			}
			.style1 {font-size: 20}
			-->
			</style></head>
			<body>
			<div align="center">
			
			<table align="center" width="75%">
			<tr>
				<td><p align="justify"><strong>Estimado usuario: ${usuario.nombre}</strong></p></td>
			</tr>
			<tr>
				<td><p align="justify">Su cuenta de usuario ha sido activada en el sistema <strong>OPES (Online Professional Education System)</strong> . Los datos con los que usted podr&aacute; ingresar al sistema son los siguientes:</p></td>
			</tr>
			<tr>
				<td><p align="justify"><strong>Usuario:</strong> ${usuario.username}</strong></p><br/>
					<p align="justify"><strong>Contrase&ntilde;a:</strong> ${password}</strong></p><br/>
				</td>
			</tr>
			<tr>
					<td><p align="justify">Le solicitamos que respalde en un lugar seguro su usuario y contrase&ntilde;a ya que en caso de olvido o perdida de contrase&ntilde;a, el sistema podr&aacute; otorgarle una nueva contrase&ntilde;a ingresando el usuario con el que se registro; dicha contrase&ntilde;a ser&aacute; enviada al correo electr&oacute;nico <strong>${usuario.username}</strong> que nos proporcion&oacute; cuando realiz&oacute; su registro.</p></td>
			</tr>
			<tr>
				<td><p align="justify">Gracias por su interes en utilizar nuestro sistema.</p></td>
			</tr>
			<tr>
				<td><p align="justify"><strong>Atentamente</strong>
					<br/>Administraci&oacute;n del sistema <strong>OPES</strong></p>
				</td>
			</tr>
			</table>
			<br/><br/>

			</body>
			</html>
		"""
    }

    def tipoBusqueda = {
        flash.clear()
        log.info "parametros de busqueda " + params

        if (params.id == "1") {
            flash.nombre = true
            render(template: "/login/campoNombre")
        }
    }


    def buscar() {
        flash.clear()
        valorDelParametro = params.buscar
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        params.sort = "id"
        params.order = "desc"
        // ------------------inicia consulta por nombre--------------------------------
        if (params.parametroBuscar == '1') {
            def model = [:]
            flash.busquedaPorNombre = true
            if (params.buscar.equals('')) {
                log.info "entre al error"
                flash.clear()
                flash.message = "Has ingresado un campo vacio"
                render(view: '/login/SolicitudCuenta', model: [usuariosList: '', usuariosTotal: 0])

            } else {

                def usuariosList = opes.login.UsuarioSistema.findAllByNombreAndEstadoLogicoNotEqual(valorDelParametro, 3, params)
                def usuariosTotal = opes.login.UsuarioSistema.countByNombreAndEstadoLogicoNotEqual(valorDelParametro, 3)

                if (usuariosList) {
                    valorFiltro = 2
                    render(view: '/login/SolicitudCuenta', model: [usuariosList: usuariosList, usuariosTotal: usuariosTotal])

                } else {
                    flash.message = "No existe ningun registro  que coincida con el criterio de busqueda"
                    render(view: '/login/SolicitudCuenta', model: [usuariosList: '', usuariosTotal: 0])
                }

            }
        }
    }

    //********************** EL DE BORRAR **************************

    def delete() {
        def usuarioInstance = opes.login.UsuarioSistema.get(params.id)
        if (!usuarioInstance) {
            flash.erroMessage = 'No se encontr\u00F3 el usuario '
            redirect(action: "list")

        }//fin del if

        try {
            usuarioInstance.enabled = false
            usuarioInstance.estadoLogico = 3
            usuarioInstance.save(flus: true)
            redirect(action: 'list')
        }
        catch (DataIntegrityViolationException e) {
            flash.errorMessage = ' El usuario no se pudo eliminar'
            redirect(action: "list")
        }//fin del catch


    }//fin de delete

    //********************** FIN DE BORRAR *************************
    def searchAJAX = {
        def nombreList = opes.login.UsuarioSistema.findByNombreLikeAndEstadoLogicoNotEqual("%${params.query}%", 3, params)
        render(contentType: "text/xml") {
            results() {
                nombreList.each { usuarioSistema ->
                    result() {

                        name(usuarioSistema.nombre)


                    }
                }

            }
        }
    }


    def filtroCuenta = {
        if (valorFiltro == 1) {
            params.max = Math.min(params.max ? params.int('max') : 10, 1000)
            if (!params.sort)
                params.sort = "id"
            if (!params.order)
                params.order = "desc"

            def usuariosList = opes.login.UsuarioSistema.findAllByEstadoLogicoNotEqual(3, params)
            def usuariosTotal = opes.login.UsuarioSistema.countByEstadoLogicoNotEqual(3)
            render(view: '/login/SolicitudCuenta', model: [usuariosList: usuariosList, usuariosTotal: usuariosTotal])

        }


        if (valorFiltro == 2) {

            params.max = Math.min(params.max ? params.int('max') : 10, 1000)
            if (!params.sort)
                params.sort = "id"
            if (!params.order)
                params.order = "desc"

            def usuariosList = opes.login.UsuarioSistema.findAllByNombreAndEstadoLogicoNotEqual(valorDelParametro, 3, params)

            def usuariosTotal = opes.login.UsuarioSistema.countByNombreAndEstadoLogicoNotEqual(valorDelParametro, 3)

            render(view: '/login/SolicitudCuenta', model: [usuariosList: usuariosList, usuariosTotal: usuariosTotal])


        }//valor de filtro

    }//fin de filtro Cuenta


}//fin de la clase
