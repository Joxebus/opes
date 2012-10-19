package opes.institucion

import opes.login.UsuarioSistema



class AlumnoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "listCursosEnrolados", params: params)
    }

    def listCursosEnrolados() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        def usuario = UsuarioSistema.get(session.usuario?.id)
        def alumno = Alumno.findByUsuarioSistemaAndEstadoLogicoNotEqual(usuario,3)
        def cursosEnrolados = AlumnosCursos.findAllByAlumno(alumno,params)
        def cursosEnroladosTotal = AlumnosCursos.countByAlumno(alumno)
        [cursosEnrolados: cursosEnrolados, cursosEnroladosTotal: cursosEnroladosTotal, alumno:alumno]
    }

    def inscripcionCurso(){
        def alumnosCurso = new AlumnosCursos(params)
        alumnosCurso.save()
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

}
