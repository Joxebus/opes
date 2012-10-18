<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>RECUPERAR CONTRASE&Ntilde;A OPES</title>
    </head>
    <body>
		 <div class="titulo">
            <h1>Recuperaci&oacute;n de contrase&ntilde;a</h1>
        </div>
        <br><br><br><br><br>
		<div id='login' class="inicioContenido" align="center">
			<g:form id='loginForm' name="Name" autocomplete='off' controller="login">
			<fieldset id="datosLogin" class="grupoCatalogo">
					<legend></legend>
					<label><g:message code="opes.springSecurity.login.recuperar.descripcion" default="Por favor, proporcione el correo electr&oacute;nico con el que se di&oacute; de alta, ya que a &eacute;ste le ser&aacute;n enviados sus datos de inicio de sesi&oacute;n." /></label><%--
					<g:if test="${flash.message}">
						<div class="message" role="status">${flash.message}</div>
					</g:if>
					--%>
					<table>
						<tr>
					        <td>&nbsp;</td>
					    </tr>
					    <g:if test="${flash.messageError}">
					    	<tr>
					    		<td colspan="2">
					 				<div class="errors" align="left" width="10px">
										<ul><li>${flash.messageError}</li></ul>
									</div>
					    		</td>
					    	</tr>
					    </g:if>
						<tr>
					        <td><label><g:message code="opes.springSecurity.login.usuario.email" default="Correo electr&oacute;nico" />:</label></td>
					        <td class="value ${hasErrors(bean: miembroInstance, field: 'nombre', 'errors')}"><g:textField id='email' name="email" value="" required=""/></td>
				        </tr>
						<tr>
					        <td>&nbsp;</td>
					    </tr>
						<tr>
					        <td>
						        <g:actionSubmitImage value="Aceptar" action="recover" src="${resource(dir:'images',file:'Icono_ok1.png')}" id="btnAceptar" style="border: 0; background:transparent;"/>
					        </td>
					        
					        <td>
					        	<a href="${createLink(uri: '/')}">
					        		<img id="btnCancelar" src="${resource(dir:'images',file:'error1.png')}" alt="Cancelar" border="0" />
					        	</a>
					        </td>
				        </tr>
					</table>
				</fieldset>		
			</g:form>
		</div>
		<script type='text/javascript'>
			<!--
			(function() {
				document.forms['loginForm'].elements['j_username'].focus();
			})();
			// -->
		</script>
    </body>
</html>
