<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>CREACION DE CUENTA DE USUARIO MVS</title>
        </head>
    <body>
		<div id='login' class="inicioContenido" align="center">
			<g:if test="${request.messageError}">
				<div class="errors">
					<ul><li>${request.messageError}</li></ul>
				</div>
			</g:if>
		<g:form name="Name" autocomplete='off' controller="solicitudCuenta">
				<fieldset id="datosLogin" class="grupoCatalogo">
					<legend></legend>
					<label><g:message code="opes.springSecurity.login.recuperar.descripcion" default="En esta pantalla se genera automaticamente la contrase&ntilde;a que sera enviada al correo del usuario." /></label>
					<g:hiddenField name="id" value="${idUsuario}"/>
					<table>
						<tr>
					        <td>&nbsp;</td>
					    </tr>
						<tr>
					        <td><label><g:message code="opes.springSecurity.login.usuario.email" default="Correo electr&oacute;nico" />:</label></td>
					        <td>
					        	<g:textField id='email' name="email" value="${email}" disabled="true"/>
					        	<g:hiddenField name="email" value="${email}"/>
					        </td>
				        </tr>
						<tr>
					        <td><label><g:message code="opes.springSecurity.login.usuario.email" default="Contrase&ntilde;a" />:</label></td>
					        <td>
					        	<g:textField id='contrasenia' name="contrasenia" value="${contrasenia}" disabled="true"/>
					        	<g:hiddenField name="contrasenia" value="${contrasenia}"/>
					        </td>
				        </tr>
					</table>
					<g:actionSubmit class="button" value="Aceptar" action="activaUsuario"/>
                    <a class="button" href="${createLink(uri: '/')}">
					Cancelar	</a>

</fieldset>
		</g:form>
		</div>
    </body>
</html>
