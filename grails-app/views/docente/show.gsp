
<%@ page import="opes.institucion.Docente" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}"/>
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
        <ol class="property-list docente">
            
            <g:if test="${docenteInstance?.usuarioSistema}">
                <li class="fieldcontain">
                    <span id="usuarioSistema-label" class="property-label"><g:message
                            code="docente.usuarioSistema.label" default="Usuario Sistema"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioSistema-label"><g:link
                            controller="usuarioSistema" action="show"
                            id="${docenteInstance?.usuarioSistema?.id}">${docenteInstance?.usuarioSistema?.encodeAsHTML()}</g:link></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.ipModifica}">
                <li class="fieldcontain">
                    <span id="ipModifica-label" class="property-label"><g:message
                            code="docente.ipModifica.label" default="Ip Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="ipModifica-label"><g:fieldValue
                            bean="${docenteInstance}" field="ipModifica"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.usuarioModifica}">
                <li class="fieldcontain">
                    <span id="usuarioModifica-label" class="property-label"><g:message
                            code="docente.usuarioModifica.label" default="Usuario Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioModifica-label"><g:fieldValue
                            bean="${docenteInstance}" field="usuarioModifica"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.fechaModifica}">
                <li class="fieldcontain">
                    <span id="fechaModifica-label" class="property-label"><g:message
                            code="docente.fechaModifica.label" default="Fecha Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaModifica-label"><g:formatDate
                            date="${docenteInstance?.fechaModifica}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.foto}">
                <li class="fieldcontain">
                    <span id="foto-label" class="property-label"><g:message
                            code="docente.foto.label" default="Foto"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.cursosImpartidos}">
                <li class="fieldcontain">
                    <span id="cursosImpartidos-label" class="property-label"><g:message
                            code="docente.cursosImpartidos.label" default="Cursos Impartidos"/></span>
                    
                    <g:each in="${docenteInstance.cursosImpartidos}" var="c">
                        <span class="property-value" aria-labelledby="cursosImpartidos-label"><g:link
                                controller="curso" action="show"
                                id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
                    </g:each>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.estadoLogico}">
                <li class="fieldcontain">
                    <span id="estadoLogico-label" class="property-label"><g:message
                            code="docente.estadoLogico.label" default="Estado Logico"/></span>
                    
                    <span class="property-value" aria-labelledby="estadoLogico-label"><g:fieldValue
                            bean="${docenteInstance}" field="estadoLogico"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.fechaAlta}">
                <li class="fieldcontain">
                    <span id="fechaAlta-label" class="property-label"><g:message
                            code="docente.fechaAlta.label" default="Fecha Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate
                            date="${docenteInstance?.fechaAlta}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.ipAlta}">
                <li class="fieldcontain">
                    <span id="ipAlta-label" class="property-label"><g:message
                            code="docente.ipAlta.label" default="Ip Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="ipAlta-label"><g:fieldValue
                            bean="${docenteInstance}" field="ipAlta"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${docenteInstance?.usuarioAlta}">
                <li class="fieldcontain">
                    <span id="usuarioAlta-label" class="property-label"><g:message
                            code="docente.usuarioAlta.label" default="Usuario Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioAlta-label"><g:fieldValue
                            bean="${docenteInstance}" field="usuarioAlta"/></span>
                    
                </li>
            </g:if>
            
        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${docenteInstance?.id}"/>

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
