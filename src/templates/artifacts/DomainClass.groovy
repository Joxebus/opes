@artifact.package@class @artifact.name@ {

    def loginService

    String ipAlta
    String ipModifica
    Integer usuarioAlta
	Integer usuarioModifica
	Integer estadoLogico
	Date fechaAlta
	Date fechaModifica

	static constraints = {
        ipModifica       nullable:true
		usuarioModifica  nullable:true
		fechaModifica    nullable:true
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
}
