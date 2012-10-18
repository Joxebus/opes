package opes.institucion

import org.springframework.dao.DataIntegrityViolationException

class AlumnoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [alumnoInstanceList: Alumno.list(params), alumnoInstanceTotal: Alumno.count()]
    }

    def create() {
        [alumnoInstance: new Alumno(params)]
    }

    def save() {
        def alumnoInstance = new Alumno(params)
        if (!alumnoInstance.save(flush: true)) {
            render(view: "create", model: [alumnoInstance: alumnoInstance])
            return
        }

		flash.success = message(code: 'default.created.message', args: [message(code: 'alumno.label', default: 'Alumno'), alumnoInstance.id])
        redirect(action: "show", id: alumnoInstance.id)
    }

    def show() {
        def alumnoInstance = Alumno.get(params.id)
        if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'alumno.label', default: 'Alumno'), params.id])
            redirect(action: "list")
            return
        }

        [alumnoInstance: alumnoInstance]
    }

    def edit() {
        def alumnoInstance = Alumno.get(params.id)
        if (!alumnoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alumno.label', default: 'Alumno'), params.id])
            redirect(action: "list")
            return
        }

        [alumnoInstance: alumnoInstance]
    }

    def update() {
        def alumnoInstance = Alumno.get(params.id)
        if (!alumnoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'alumno.label', default: 'Alumno'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (alumnoInstance.version > version) {
                alumnoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'alumno.label', default: 'Alumno')] as Object[],
                          "Another user has updated this Alumno while you were editing")
                render(view: "edit", model: [alumnoInstance: alumnoInstance])
                return
            }
        }

        alumnoInstance.properties = params

        if (!alumnoInstance.save(flush: true)) {
            render(view: "edit", model: [alumnoInstance: alumnoInstance])
            return
        }

		flash.success = message(code: 'default.updated.message', args: [message(code: 'alumno.label', default: 'Alumno'), alumnoInstance.id])
        redirect(action: "show", id: alumnoInstance.id)
    }

    def delete() {
        def alumnoInstance = Alumno.get(params.id)
        if (!alumnoInstance) {
			flash.warning = message(code: 'default.not.found.message', args: [message(code: 'alumno.label', default: 'Alumno'), params.id])
            redirect(action: "list")
            return
        }

        try {
            alumnoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'alumno.label', default: 'Alumno'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'alumno.label', default: 'Alumno'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
