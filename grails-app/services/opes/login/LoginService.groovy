package opes.login

class LoginService {

    static transactional = false

	def springSecurityService
    String sessionIp

    public Integer getSessionIdUsuario() {
		def principal = springSecurityService.principal
		log.info("Obteniendo el usuario [${principal.username}] con id [${principal.id}]")
		return principal.id
    }

	def getSessionUsername() {
		def principal = springSecurityService.principal
		log.info("Obteniendo el usuario [${principal.username}] con id [${principal.id}]")
		return principal.username
	}

	def getSessionUsuario() {
		def principal = springSecurityService.principal
		log.info("Obteniendo el usuario [${principal.username}] con id [${principal.id}]")
		return principal
	}

    def setSessionIp(String sessionIp){
        this.sessionIp = sessionIp
        log.info ("Obteniendo IP del host" + this.sessionIp)
    }

    public String getSessionIp(){
        return sessionIp
    }
}
