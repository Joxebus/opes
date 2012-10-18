package opes.institucion

import opes.login.UsuarioSistema
import opes.utils.FileProperties

class Docente {

    byte[] foto
    String typo
    UsuarioSistema usuarioSistema
    static hasMany = [cursosImpartidos:Curso]
	static mappedBy = [cursosImpartidos:"docente"]

    def loginService

    String ipAlta
    String ipModifica
    Integer usuarioAlta
    Integer usuarioModifica
    Integer estadoLogico
    Date fechaAlta
    Date fechaModifica

    static constraints = {
        usuarioSistema  unique:true
        ipModifica      nullable: true
        usuarioModifica nullable: true
        fechaModifica   nullable: true
        foto            nullable: true, maxSize:FileProperties.MB*3 // 3MB
        typo            nullable: true

    }

    List getCursos(){
        return Curso.findAllByDocente(this)
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

    String toString(){
        usuarioSistema
    }
}
