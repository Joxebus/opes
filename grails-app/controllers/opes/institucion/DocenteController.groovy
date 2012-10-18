package opes.institucion

import org.springframework.dao.DataIntegrityViolationException

class DocenteController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [docenteInstanceList: Docente.list(params), docenteInstanceTotal: Docente.count()]
    }

    def create() {
        [docenteInstance: new Docente(params)]
    }

    def createCurso(){
        [cursoInstance: new Curso(params)]
    }

    def saveCurso(){

    }

    def save() {
        def docenteInstance = new Docente(params)
        if (!docenteInstance.save(flush: true)) {
            render(view: "create", model: [docenteInstance: docenteInstance])
            return
        }

		flash.success = message(code: 'default.created.message', args: [message(code: 'docente.label', default: 'Docente'), docenteInstance.id])
        redirect(action: "show", id: docenteInstance.id)
    }

    def show() {
        def docenteInstance = Docente.get(params.id)
        if (!docenteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'docente.label', default: 'Docente'), params.id])
            redirect(action: "list")
            return
        }

        [docenteInstance: docenteInstance]
    }

    def edit() {
        def docenteInstance = Docente.get(params.id)
        if (!docenteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'docente.label', default: 'Docente'), params.id])
            redirect(action: "list")
            return
        }

        [docenteInstance: docenteInstance]
    }

    def update() {
        def docenteInstance = Docente.get(params.id)
        if (!docenteInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'docente.label', default: 'Docente'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (docenteInstance.version > version) {
                docenteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'docente.label', default: 'Docente')] as Object[],
                          "Another user has updated this Docente while you were editing")
                render(view: "edit", model: [docenteInstance: docenteInstance])
                return
            }
        }

        docenteInstance.properties = params

        if (!docenteInstance.save(flush: true)) {
            render(view: "edit", model: [docenteInstance: docenteInstance])
            return
        }

		flash.success = message(code: 'default.updated.message', args: [message(code: 'docente.label', default: 'Docente'), docenteInstance.id])
        redirect(action: "show", id: docenteInstance.id)
    }

    def delete() {
        def docenteInstance = Docente.get(params.id)
        if (!docenteInstance) {
			flash.warning = message(code: 'default.not.found.message', args: [message(code: 'docente.label', default: 'Docente'), params.id])
            redirect(action: "list")
            return
        }

        try {
            docenteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'docente.label', default: 'Docente'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'docente.label', default: 'Docente'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
