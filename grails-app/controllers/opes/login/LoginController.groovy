package opes.login

import opes.utils.*

import org.springframework.security.core.context.SecurityContextHolder as SCH

import grails.converters.JSON
import javax.servlet.http.HttpServletResponse
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter
import org.springframework.web.servlet.ModelAndView

class LoginController {

    def authenticationTrustResolver
    def springSecurityService
    def loginService

    // TODO: comentar esta cuando no sirva email
    private EmailUtils emailUtils = new EmailUtils()
    private CriptoUtils criptoUtils = new CriptoUtils()

    /**
     * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
     */
    def index = {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'auth', params: params
        }
    }

    /**
     * Show the login page.
     */
    def auth = {
        def config = SpringSecurityUtils.securityConfig
        String sessionIp = request.getRemoteAddr()
        if (springSecurityService.isLoggedIn()) {
            redirect uri: config.successHandler.defaultTargetUrl
            return
        }

        loginService.setSessionIp(sessionIp) // asignamos la ip de session
        String view = 'IniciarSesion'
        String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
        render view: view, model: [postUrl: postUrl,
                rememberMeParameter: config.rememberMe.parameter]
    }

    /**
     * The redirect action for Ajax requests.
     */
    def authAjax = {
        response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
        response.sendError HttpServletResponse.SC_UNAUTHORIZED
    }

    /**
     * Show denied page.
     */
    def denied = {
        if (springSecurityService.isLoggedIn() &&
                authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
            // have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
            redirect action: 'full', params: params
        }
    }

    /**
     * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
     */
    def full = {
        def config = SpringSecurityUtils.securityConfig
        render view: 'IniciarSesion', params: params,
                model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
                        postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
    }

    /**
     * Callback after a failed login. Redirects to the auth page with a warning message.
     */
    def authfail = {

        def correoElectronico = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
        String msg = ''
        def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
        if (exception) {
            if (exception instanceof AccountExpiredException) {
                msg = g.message(code: "opes.springSecurity.errors.login.expired")
            }
            else if (exception instanceof CredentialsExpiredException) {
                msg = g.message(code: "opes.springSecurity.errors.login.passwordExpired")
            }
            else if (exception instanceof DisabledException) {
                msg = g.message(code: "opes.springSecurity.errors.login.disabled")
            }
            else if (exception instanceof LockedException) {
                msg = g.message(code: "opes.springSecurity.errors.login.locked")
            }
            else {
                msg = g.message(code: "opes.springSecurity.errors.login.fail")
            }
        }

        if (springSecurityService.isAjax(request)) {
            render([error: msg] as JSON)
        }
        else {
            flash.message = msg
            redirect action: 'auth', params: params
        }
    }

    /**
     * The Ajax success redirect url.
     */
    def ajaxSuccess = {
        session.usuario = springSecurityService.currentUser
        render([success: true, username: springSecurityService.authentication.name] as JSON)
    }

    /**
     * The Ajax denied redirect url.
     */
    def ajaxDenied = {
        render([error: 'access denied'] as JSON)
    }

    def errorAcceso = {
        def model = [:]
        return new ModelAndView("/login/Recuperar", model)
    }

    def registro = {
        def model = [:]
        this.generateCaptcha()
        model += [captcha: session.captcha]
        return new ModelAndView("/login/Registro", model)
    }

    def instruccionesToolTip = {
        render """
		Por favor teclee un correo electr&oacute;nico valido tomando en cuenta las siguientes reglas:
		<br>--Debe ser un correo electr&oacute;nico valido(este correo sera utilizado para la funcionalidad de recuperaci&oacute;n de contrase&ntilde;a).
		<br>--Debe tener al menos 5 caracteres.
		<br>Los campos marcados con * son obligatorios.
		"""
    }

    def save = {

        def password = this.criptoUtils.getNuevaContrasenia()
        def usuarioSistema = new UsuarioSistema(params)
        usuarioSistema.observaciones = ""
        usuarioSistema.password = password
        usuarioSistema.usuarioAlta = 0
        usuarioSistema.fechaAlta = new Date()
        usuarioSistema.enabled = false
        usuarioSistema.accountExpired = false
        usuarioSistema.accountLocked = false
        usuarioSistema.passwordExpired = false
        def model = [:]

        // Validando errores generales
        def usuarioSistemaDuplicado = UsuarioSistema.findByUsernameAndEnabled(usuarioSistema?.username, true)
        usuarioSistema.validate()

        if (usuarioSistema.hasErrors()) {
            log.info ">>>>> Errores en el usuario <<<<<<"
            usuarioSistema.errors.each { error ->
                log.info error
            }
            model += [usuarioSistemaInstance: usuarioSistema]
        } else {
            if (usuarioSistemaDuplicado == null && params.captcha == session.captcha) {
                log.info("Enviando notificacion a el usuario: ${usuarioSistema.username}")
                // TODO: Descomentar  y checar el correo correcto que deberia de ponerse
                this.emailUtils.subject = "Registro de cuenta OPES"
                this.emailUtils.from = "no-reply@opes.com"
                this.emailUtils.contentHtml = this.getHtmlRegistro(usuarioSistema)
                this.emailUtils.recipients = ["${usuarioSistema.username}"]
                this.emailUtils.sendEmail();

                // Hasta aqu�
                log.info("Guardando el usuario: ${usuarioSistema.username}")
                usuarioSistema.save(flush: true)
                flash.message = "${message(code: 'directorio.miembro.save', default: '', args: [usuarioSistema.username])}"
                session.captcha == ""
                return new ModelAndView("/login/RegistroExitoso", model)
            } else {
                model += [usuarioSistemaInstance: usuarioSistema]
                if (params.captcha == session.captcha) {
                    request.messageError = "${message(code: 'directorio.error.email', default: 'Error', args: [usuarioSistema.username])}"
                } else {
                    request.messageErrorCaptcha = "${message(code: 'registgro.error.captcha', default: 'Codigo de verificaci&oacute;n invalido')}"
                    this.generateCaptcha()
                }
            }
        }

        return new ModelAndView("/login/Registro", model)
    }

    def recover = {
        if (params.email) {
            def model = [:]
            String password = this.criptoUtils.getNuevaContrasenia()
            def usuario = UsuarioSistema.findByUsername(params.email)
            if (usuario) {
                usuario.password = password
                usuario.save(flush: true)
                log.info("Enviando notificacion a el usuario: ${params.email}")
                this.emailUtils.subject = "Recuperaci\u00F3n de contrase\u00F1a OPES"
                this.emailUtils.from = "no-reply@opes.com"
                this.emailUtils.contentHtml = this.getHtmlRecovery(usuario, password)
                this.emailUtils.recipients = ["${params.email}"]
                this.emailUtils.sendEmail();
                flash.message = 'La Recuperaci\u00F3n de la contrase\u00F1a ha sido exitoso, y la informaci\u00F3n ha sido enviada a su correo electr\u00F3nico registrado dentro del sistema.'
                return new ModelAndView("/login/RecuperarExitoso", model)
            } else {
                request.messageError = "${message(code: 'recupera.error.contrasenia', default: 'Ingrese una direcci&oacute;n de correo electr&oacute;nico no valida')}"
                return new ModelAndView("/login/Recuperar", params)
            }
        } else {
            request.messageError = "${message(code: 'recupera.error.contrasenia', default: 'Ingrese una direcci&oacute;n de correo electr&oacute;nico no valida')}"
            return new ModelAndView("/login/Recuperar", params)
        }
    }

    def captcha = {
        render this.generateCaptcha()
    }

    def generateCaptcha() {
        session.captcha = new Captcha().CadenaAleatoria()
        session.captcha
    }

    private def getHtmlRecovery(usuario, password) {
        return """
			<!doctype html>
			<html>
			<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<title>Recuperar Contrase&ntilde;a</title>
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
			<td>
			<p><strong>Estimado usuario: ${usuario.nombre}</strong></p>
			</td>
			</tr>
			<tr>
			<td>
			<p align="justify">La cuenta de usuario con la que usted fue registrado en el sistema <strong>OPES (Online Professional Education System)</strong> hace referencia a los siguientes datos:</p>
			</td>
			</tr>
			<tr>
			<td>

			<strong>Usuario:</strong> ${usuario.username}<br/>
			<strong>Contrase&ntilde;a:</strong> ${password}<br/>

			</td>
			</tr>
			<tr>
			<td>
			<p align="justify">Le solicitamos que respalde en un lugar seguro su usuario y contrase&ntilde;a ya que en caso de olvido o p&eacute;rdida de contrase&ntilde;a, el sistema podr&aacute; otorgarle una nueva contrase&ntilde;a ingresando el usuario con el que se registro; dicha contrase&ntilde;a ser&aacute; enviada al correo electr&oacute;nico <strong>${usuario.username}</strong> que nos proporciono cuando realizo su registro.</p>
			</td>
			</tr>
			<tr>
			<td>
			<p>Gracias por su inter&eacute;s en utilizar nuestro sistema.</p>
			</td>
			</tr>
			<tr>
			<td>
			<p><strong>Atentamente</strong>
			<br/>Administraci&oacute;n del sistema <strong>OPES</strong></p>
			</td>
			</tr>
			</table>
			<br/><br/>

			</body>
			</html>
		"""
    }

    private def getHtmlRegistro(usuario) {
        return """
            <!doctype html>
            <html>
            <head>
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
            <title>Registro de Usuario</title>
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
            </div> <br/>

            <table align="center" width="75%">
            <tr>
            <td>
            <strong>Estimado usuario: ${usuario.nombre}</strong>
            </td>
            </tr>
            <tr>
            <td>
            <p align="justify">Bienvenido a la <strong>OPES</strong>, por el momento su registro est&aacute; siendo aprobado por el administrador del sistema.</p>
            </td>
            </tr>
            <tr>
            <td>
            <p align="justify">Una vez que se haya aprobado dicha solicitud usted recibir&aacute; un usuario y una contrase&ntilde;a con la cual podr&aacute; acceder al sistema la pr&oacute;xima vez. En caso de que su solicitud no haya sido aprobada tambi&eacute;n recibir&aacute; un correo con las causas del porque no fue aprobada dicha solicitud.</p>
            </td>
            </tr>
            <tr>
            <td>
            <p>Le agradecemos su inter&eacute;s de registrarse en nuestro sistema.</p>
            </td>
            </tr>
            <tr>
            <td>
            <p><strong>Atentamente</strong><br/>Administraci&oacute;n sistema <strong>OPES</strong></p>
            </td>
            </tr>
            </table>
            <br/></div>

            </body>
            </html>
	"""
    }
}
