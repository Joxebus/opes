<%@ page import="opes.institucion.Curso" %>

<g:hiddenField name="docente.id" value="${session.usuario?.id}" class="many-to-one"/>


<g:message code="curso.fechaInicio.label" default="Fecha Inicio"/>
<span class="required-indicator">*</span>
<g:datePicker name="fechaInicio" precision="day" value="${cursoInstance?.fechaInicio}"/>
<pre>&#09;</pre>
<g:message code="curso.fechaFin.label" default="Fecha Fin"/>
<span class="required-indicator">*</span>
<g:datePicker name="fechaFin" precision="day" value="${cursoInstance?.fechaFin}"/>
<br/>
<br/>
<g:message code="curso.horas.label" default="Duraci&oacute;n en Horas"/>
<span class="required-indicator">*</span>
<pre>&#09;</pre>
<g:field class="text-input" type="number" name="horas" required="" value="${fieldValue(bean: cursoInstance, field: 'horas')}"/>
<br/>
<br/>

<g:message code="curso.titulo.label" default="Titulo"/>
<span class="required-indicator">*</span>
<g:textField class="text-input medium-input" required="" name="titulo" value="${cursoInstance?.titulo}"/>
<br/>
<br/>

<g:message code="curso.descripcion.label" default="Descripcion"/>
<pre>&#09;</pre><g:textArea class="text-input textarea wysiwyg" required="" name="descripcion" cols="40" rows="5" maxlength="999999"
                            value="${cursoInstance?.descripcion}"/>
<br/>









