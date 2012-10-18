package opes.institucion

class Curso {

    Docente docente
	static belongsTo = Docente
    Date fechaInicio
    Date fechaFin
    String descripcion
    String titulo

    def loginService

    String ipAlta
    String ipModifica
    Integer usuarioAlta
    Integer usuarioModifica
    Integer estadoLogico
    Date fechaAlta
    Date fechaModifica
    Integer horas

    static constraints = {
        ipModifica nullable: true
        usuarioModifica nullable: true
        fechaModifica nullable: true
        descripcion maxSize:999999
    }

    def beforeInsert() {
        ipAlta = loginService.getSessionIp()
        usuarioAlta = loginService.getSessionIdUsuario()
        fechaAlta = new Date()
        estadoLogico = 1
    }

    def beforeUpdate() {
        ipModifica = loginService.getSessionIp()
        usuarioModifica = loginService.getSessionIdUsuario()
        fechaModifica = new Date()
    }

    List getAlumnos() {
		return AlumnosCursos.findAllByCurso(this).collect{it.alumno}
	}

    List addToAlumnos(Alumno alumno) {
        AlumnosCursos.link(alumno, this)
        return alumnos()
    }

    List removeFromAlumnos(Alumno alumno) {
        AlumnosCursos.unlink(alumno, this)
        return alumnos()
    }

}
