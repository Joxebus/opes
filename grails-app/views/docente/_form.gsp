<%@ page import="opes.institucion.Docente" %>



<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'usuarioSistema', 'error')} required">
	<label for="usuarioSistema">
		<g:message code="docente.usuarioSistema.label" default="Usuario Sistema" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuarioSistema" name="usuarioSistema.id" from="${opes.login.UsuarioSistema.list()}" optionKey="id" required="" value="${docenteInstance?.usuarioSistema?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'ipModifica', 'error')} ">
	<label for="ipModifica">
		<g:message code="docente.ipModifica.label" default="Ip Modifica" />
		
	</label>
	<g:textField name="ipModifica" value="${docenteInstance?.ipModifica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'foto', 'error')} required">
	<label for="foto">
		<g:message code="docente.foto.label" default="Foto" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="foto" name="foto" />
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'cursosImpartidos', 'error')} ">
	<label for="cursosImpartidos">
		<g:message code="docente.cursosImpartidos.label" default="Cursos Impartidos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${docenteInstance?.cursosImpartidos?}" var="c">
    <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curso" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'ipAlta', 'error')} ">
	<label for="ipAlta">
		<g:message code="docente.ipAlta.label" default="Ip Alta" />
		
	</label>
	<g:textField name="ipAlta" value="${docenteInstance?.ipAlta}"/>
</div>

