
<%@ page import="opes.institucion.Curso" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>

<div class="clear"></div> <!-- End .clear -->
<div class="content-box"><!-- Start Content Box -->
    <div class="content-box-header">
        <h3><g:message code="default.show.label" args="[entityName]"/></h3>
    </div>
    <div class="content-box-content">
        <g:if test="${flash.message}">
            <div class="notification information png_bg">
                <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}"
                                               title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>

                <div>
                    ${flash.message}
                </div>
            </div>
        </g:if>
        <ol class="property-list curso">
            
            <g:if test="${cursoInstance?.ipModifica}">
                <li class="fieldcontain">
                    <span id="ipModifica-label" class="property-label"><g:message
                            code="curso.ipModifica.label" default="Ip Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="ipModifica-label"><g:fieldValue
                            bean="${cursoInstance}" field="ipModifica"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.usuarioModifica}">
                <li class="fieldcontain">
                    <span id="usuarioModifica-label" class="property-label"><g:message
                            code="curso.usuarioModifica.label" default="Usuario Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioModifica-label"><g:fieldValue
                            bean="${cursoInstance}" field="usuarioModifica"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.fechaModifica}">
                <li class="fieldcontain">
                    <span id="fechaModifica-label" class="property-label"><g:message
                            code="curso.fechaModifica.label" default="Fecha Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaModifica-label"><g:formatDate
                            date="${cursoInstance?.fechaModifica}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.descripcion}">
                <li class="fieldcontain">
                    <span id="descripcion-label" class="property-label"><g:message
                            code="curso.descripcion.label" default="Descripcion"/></span>
                    
                    <span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue
                            bean="${cursoInstance}" field="descripcion"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.docente}">
                <li class="fieldcontain">
                    <span id="docente-label" class="property-label"><g:message
                            code="curso.docente.label" default="Docente"/></span>
                    
                    <span class="property-value" aria-labelledby="docente-label"><g:link
                            controller="docente" action="show"
                            id="${cursoInstance?.docente?.id}">${cursoInstance?.docente?.encodeAsHTML()}</g:link></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.estadoLogico}">
                <li class="fieldcontain">
                    <span id="estadoLogico-label" class="property-label"><g:message
                            code="curso.estadoLogico.label" default="Estado Logico"/></span>
                    
                    <span class="property-value" aria-labelledby="estadoLogico-label"><g:fieldValue
                            bean="${cursoInstance}" field="estadoLogico"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.fechaAlta}">
                <li class="fieldcontain">
                    <span id="fechaAlta-label" class="property-label"><g:message
                            code="curso.fechaAlta.label" default="Fecha Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate
                            date="${cursoInstance?.fechaAlta}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.fechaFin}">
                <li class="fieldcontain">
                    <span id="fechaFin-label" class="property-label"><g:message
                            code="curso.fechaFin.label" default="Fecha Fin"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaFin-label"><g:formatDate
                            date="${cursoInstance?.fechaFin}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.fechaInicio}">
                <li class="fieldcontain">
                    <span id="fechaInicio-label" class="property-label"><g:message
                            code="curso.fechaInicio.label" default="Fecha Inicio"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaInicio-label"><g:formatDate
                            date="${cursoInstance?.fechaInicio}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.horas}">
                <li class="fieldcontain">
                    <span id="horas-label" class="property-label"><g:message
                            code="curso.horas.label" default="Horas"/></span>
                    
                    <span class="property-value" aria-labelledby="horas-label"><g:fieldValue
                            bean="${cursoInstance}" field="horas"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.ipAlta}">
                <li class="fieldcontain">
                    <span id="ipAlta-label" class="property-label"><g:message
                            code="curso.ipAlta.label" default="Ip Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="ipAlta-label"><g:fieldValue
                            bean="${cursoInstance}" field="ipAlta"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.titulo}">
                <li class="fieldcontain">
                    <span id="titulo-label" class="property-label"><g:message
                            code="curso.titulo.label" default="Titulo"/></span>
                    
                    <span class="property-value" aria-labelledby="titulo-label"><g:fieldValue
                            bean="${cursoInstance}" field="titulo"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${cursoInstance?.usuarioAlta}">
                <li class="fieldcontain">
                    <span id="usuarioAlta-label" class="property-label"><g:message
                            code="curso.usuarioAlta.label" default="Usuario Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioAlta-label"><g:fieldValue
                            bean="${cursoInstance}" field="usuarioAlta"/></span>
                    
                </li>
            </g:if>
            
        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${cursoInstance?.id}"/>

                <g:actionSubmit class="button" action="edit"
                                value="${message(code: 'default.button.edit.label', default: 'Edit')}"/>
                <g:actionSubmit class="button" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
        </div>
    </div>
</body>
</html>
