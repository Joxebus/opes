<%@ page import="opes.institucion.Alumno" %>



<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'ipModifica', 'error')} ">
	<label for="ipModifica">
		<g:message code="alumno.ipModifica.label" default="Ip Modifica" />
		
	</label>
	<g:textField name="ipModifica" value="${alumnoInstance?.ipModifica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'usuarioSistema', 'error')} required">
	<label for="usuarioSistema">
		<g:message code="alumno.usuarioSistema.label" default="Usuario Sistema" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuarioSistema" name="usuarioSistema.id" from="${opes.login.UsuarioSistema.list()}" optionKey="id" required="" value="${alumnoInstance?.usuarioSistema?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'foto', 'error')} required">
	<label for="foto">
		<g:message code="alumno.foto.label" default="Foto" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="foto" name="foto" />
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'ipAlta', 'error')} ">
	<label for="ipAlta">
		<g:message code="alumno.ipAlta.label" default="Ip Alta" />
		
	</label>
	<g:textField name="ipAlta" value="${alumnoInstance?.ipAlta}"/>
</div>

