package opes.institucion

import opes.login.UsuarioSistema
import opes.utils.FileProperties

class Alumno {

    byte[] foto
    String typo
    UsuarioSistema usuarioSistema

    def loginService

    String ipAlta
    String ipModifica
    Integer usuarioAlta
    Integer usuarioModifica
    Integer estadoLogico
    Date fechaAlta
    Date fechaModifica

    static constraints = {
        ipModifica      nullable: true
        usuarioModifica nullable: true
        fechaModifica   nullable: true
        usuarioSistema  unique:true
        foto            nullable:true, maxSize:FileProperties.MB*3 // 3MB
        typo            nullable:true
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

    List getCursos() {
		return AlumnosCursos.findAllByAlumno(this).collect{it.curso}
	}

    List addToCursos(Curso curso) {
        AlumnosCursos.link(this, curso)
        return cursos()
    }

    List removeFromCursos(Curso curso) {
        AlumnosCursos.unlink(this, curso)
        return cursos()
    }


}
