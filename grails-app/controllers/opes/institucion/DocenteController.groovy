package opes.institucion

import org.springframework.dao.DataIntegrityViolationException
import opes.login.UsuarioSistema
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class DocenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "listCursosImpartidos", params: params)
    }

    def listCursosImpartidos() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def usuario = UsuarioSistema.get(session.usuario?.id)
        def docente = Docente.findByUsuarioSistemaAndEstadoLogicoNotEqual(usuario,3)
        def cursosImpartidos = Curso.findAllByDocenteAndEstadoLogicoNotEqual(docente,3, params)
        def totalCursosImpartidos = Curso.countByDocenteAndEstadoLogicoNotEqual(docente,3)
        [cursoInstanceList: cursosImpartidos, cursoInstanceTotal: totalCursosImpartidos]
    }



    def createCurso(){
        if(session.usuario && session.usuario?.tipoUsuario.equals("DOCENTE")){
           def usuario = UsuarioSistema.get(session.usuario.id)
           def docente = Docente.findByUsuarioSistema(usuario)
           [cursoInstance: new Curso(params), docente:docente]
        }else{
           redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
        }
    }

    def saveCurso(){
        def cursoInstance = new Curso(params)
        cursoInstance.beforeInsert()
        if (!cursoInstance.save(flush: true)) {
            redirect(action:"createCurso")
            return
        }
        flash.success = message(code: 'default.created.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.titulo])
        redirect action:"listCursosImpartidos"
    }

    def editCurso(){
        if(session.usuario && session.usuario?.tipoUsuario.equals("DOCENTE")){
           def usuario = UsuarioSistema.get(session.usuario.id)
           def docente = Docente.findByUsuarioSistema(usuario)
           [cursoInstance: Curso.get(params.id), docente:docente]
        }else{
           redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
        }
    }

    def updateCurso(){
        def cursoInstance = Curso.get(params.id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (cursoInstance.version > version) {
                cursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'curso.label', default: 'Curso')] as Object[],
                          "Another user has updated this Curso while you were editing")
                render(view: "edit", model: [cursoInstance: cursoInstance])
                return
            }
        }

        cursoInstance.properties = params
        cursoInstance.beforeUpdate()
        cursoInstance.estadoLogico = 2

        if (!cursoInstance.save(flush: true)) {
            render(view: "edit", model: [cursoInstance: cursoInstance])
            return
        }

		flash.success = message(code: 'default.updated.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
        redirect(action: "listCursosImpartidos")
    }

    def deleteCurso(){
        def cursoInstance = Curso.get(params.id)
        if (!cursoInstance) {
			flash.warning = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])
            redirect(action: "listCursosImpartidos")
            return
        }

        try {
            cursoInstance.beforeUpdate()
            cursoInstance.estadoLogico = 3
            cursoInstance.save(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.titulo])
            redirect(action: "listCursosImpartidos")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.titulo])
            redirect(action: "listCursosImpartidos")
        }
    }

}
