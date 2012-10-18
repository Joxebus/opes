<%@ page import="opes.login.UsuarioSistema" %>



<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="usuarioSistema.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="username" maxlength="60" required="" value="${usuarioSistemaInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="usuarioSistema.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" maxlength="50" required="" value="${usuarioSistemaInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="usuarioSistema.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" maxlength="150" required="" value="${usuarioSistemaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'segundoNombre', 'error')} ">
	<label for="segundoNombre">
		<g:message code="usuarioSistema.segundoNombre.label" default="Segundo Nombre" />
		
	</label>
	<g:textField name="segundoNombre" maxlength="50" value="${usuarioSistemaInstance?.segundoNombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'apellidoPaterno', 'error')} required">
	<label for="apellidoPaterno">
		<g:message code="usuarioSistema.apellidoPaterno.label" default="Apellido Paterno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoPaterno" maxlength="50" required="" value="${usuarioSistemaInstance?.apellidoPaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'apellidoMaterno', 'error')} required">
	<label for="apellidoMaterno">
		<g:message code="usuarioSistema.apellidoMaterno.label" default="Apellido Materno" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apellidoMaterno" maxlength="50" required="" value="${usuarioSistemaInstance?.apellidoMaterno}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'tipoUsuario', 'error')} ">
	<label for="tipoUsuario">
		<g:message code="usuarioSistema.tipoUsuario.label" default="Tipo Usuario" />
		
	</label>
	<g:select name="tipoUsuario" from="${usuarioSistemaInstance.constraints.tipoUsuario.inList}" value="${usuarioSistemaInstance?.tipoUsuario}" valueMessagePrefix="usuarioSistema.tipoUsuario" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'telefono', 'error')} required">
	<label for="telefono">
		<g:message code="usuarioSistema.telefono.label" default="Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telefono" maxlength="25" pattern="${usuarioSistemaInstance.constraints.telefono.matches}" required="" value="${usuarioSistemaInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones">
		<g:message code="usuarioSistema.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" maxlength="250" value="${usuarioSistemaInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="usuarioSistema.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${usuarioSistemaInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="usuarioSistema.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${usuarioSistemaInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="usuarioSistema.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${usuarioSistemaInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'captcha', 'error')} ">
	<label for="captcha">
		<g:message code="usuarioSistema.captcha.label" default="Captcha" />
		
	</label>
	<g:textField name="captcha" value="${usuarioSistemaInstance?.captcha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioSistemaInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="usuarioSistema.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${usuarioSistemaInstance?.passwordExpired}" />
</div>

