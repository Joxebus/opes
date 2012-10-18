
<%@ page import="opes.institucion.Alumno" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}"/>
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
        <ol class="property-list alumno">
            
            <g:if test="${alumnoInstance?.ipModifica}">
                <li class="fieldcontain">
                    <span id="ipModifica-label" class="property-label"><g:message
                            code="alumno.ipModifica.label" default="Ip Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="ipModifica-label"><g:fieldValue
                            bean="${alumnoInstance}" field="ipModifica"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.usuarioModifica}">
                <li class="fieldcontain">
                    <span id="usuarioModifica-label" class="property-label"><g:message
                            code="alumno.usuarioModifica.label" default="Usuario Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioModifica-label"><g:fieldValue
                            bean="${alumnoInstance}" field="usuarioModifica"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.fechaModifica}">
                <li class="fieldcontain">
                    <span id="fechaModifica-label" class="property-label"><g:message
                            code="alumno.fechaModifica.label" default="Fecha Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaModifica-label"><g:formatDate
                            date="${alumnoInstance?.fechaModifica}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.usuarioSistema}">
                <li class="fieldcontain">
                    <span id="usuarioSistema-label" class="property-label"><g:message
                            code="alumno.usuarioSistema.label" default="Usuario Sistema"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioSistema-label"><g:link
                            controller="usuarioSistema" action="show"
                            id="${alumnoInstance?.usuarioSistema?.id}">${alumnoInstance?.usuarioSistema?.encodeAsHTML()}</g:link></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.foto}">
                <li class="fieldcontain">
                    <span id="foto-label" class="property-label"><g:message
                            code="alumno.foto.label" default="Foto"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.estadoLogico}">
                <li class="fieldcontain">
                    <span id="estadoLogico-label" class="property-label"><g:message
                            code="alumno.estadoLogico.label" default="Estado Logico"/></span>
                    
                    <span class="property-value" aria-labelledby="estadoLogico-label"><g:fieldValue
                            bean="${alumnoInstance}" field="estadoLogico"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.fechaAlta}">
                <li class="fieldcontain">
                    <span id="fechaAlta-label" class="property-label"><g:message
                            code="alumno.fechaAlta.label" default="Fecha Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate
                            date="${alumnoInstance?.fechaAlta}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.ipAlta}">
                <li class="fieldcontain">
                    <span id="ipAlta-label" class="property-label"><g:message
                            code="alumno.ipAlta.label" default="Ip Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="ipAlta-label"><g:fieldValue
                            bean="${alumnoInstance}" field="ipAlta"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${alumnoInstance?.usuarioAlta}">
                <li class="fieldcontain">
                    <span id="usuarioAlta-label" class="property-label"><g:message
                            code="alumno.usuarioAlta.label" default="Usuario Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioAlta-label"><g:fieldValue
                            bean="${alumnoInstance}" field="usuarioAlta"/></span>
                    
                </li>
            </g:if>
            
        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${alumnoInstance?.id}"/>

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
