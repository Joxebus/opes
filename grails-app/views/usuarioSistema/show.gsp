
<%@ page import="opes.login.UsuarioSistema" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'usuarioSistema.label', default: 'UsuarioSistema')}"/>
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
        <ol class="property-list usuarioSistema">
            
            <g:if test="${usuarioSistemaInstance?.username}">
                <li class="fieldcontain">
                    <span id="username-label" class="property-label"><g:message
                            code="usuarioSistema.username.label" default="Username"/></span>
                    
                    <span class="property-value" aria-labelledby="username-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="username"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.password}">
                <li class="fieldcontain">
                    <span id="password-label" class="property-label"><g:message
                            code="usuarioSistema.password.label" default="Password"/></span>
                    
                    <span class="property-value" aria-labelledby="password-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="password"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.nombre}">
                <li class="fieldcontain">
                    <span id="nombre-label" class="property-label"><g:message
                            code="usuarioSistema.nombre.label" default="Nombre"/></span>
                    
                    <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="nombre"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.segundoNombre}">
                <li class="fieldcontain">
                    <span id="segundoNombre-label" class="property-label"><g:message
                            code="usuarioSistema.segundoNombre.label" default="Segundo Nombre"/></span>
                    
                    <span class="property-value" aria-labelledby="segundoNombre-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="segundoNombre"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.apellidoPaterno}">
                <li class="fieldcontain">
                    <span id="apellidoPaterno-label" class="property-label"><g:message
                            code="usuarioSistema.apellidoPaterno.label" default="Apellido Paterno"/></span>
                    
                    <span class="property-value" aria-labelledby="apellidoPaterno-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="apellidoPaterno"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.apellidoMaterno}">
                <li class="fieldcontain">
                    <span id="apellidoMaterno-label" class="property-label"><g:message
                            code="usuarioSistema.apellidoMaterno.label" default="Apellido Materno"/></span>
                    
                    <span class="property-value" aria-labelledby="apellidoMaterno-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="apellidoMaterno"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.tipoUsuario}">
                <li class="fieldcontain">
                    <span id="tipoUsuario-label" class="property-label"><g:message
                            code="usuarioSistema.tipoUsuario.label" default="Tipo Usuario"/></span>
                    
                    <span class="property-value" aria-labelledby="tipoUsuario-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="tipoUsuario"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.telefono}">
                <li class="fieldcontain">
                    <span id="telefono-label" class="property-label"><g:message
                            code="usuarioSistema.telefono.label" default="Telefono"/></span>
                    
                    <span class="property-value" aria-labelledby="telefono-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="telefono"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.observaciones}">
                <li class="fieldcontain">
                    <span id="observaciones-label" class="property-label"><g:message
                            code="usuarioSistema.observaciones.label" default="Observaciones"/></span>
                    
                    <span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="observaciones"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.enabled}">
                <li class="fieldcontain">
                    <span id="enabled-label" class="property-label"><g:message
                            code="usuarioSistema.enabled.label" default="Enabled"/></span>
                    
                    <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
                            boolean="${usuarioSistemaInstance?.enabled}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.usuarioAlta}">
                <li class="fieldcontain">
                    <span id="usuarioAlta-label" class="property-label"><g:message
                            code="usuarioSistema.usuarioAlta.label" default="Usuario Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioAlta-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="usuarioAlta"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.usuarioModifica}">
                <li class="fieldcontain">
                    <span id="usuarioModifica-label" class="property-label"><g:message
                            code="usuarioSistema.usuarioModifica.label" default="Usuario Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="usuarioModifica-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="usuarioModifica"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.fechaAlta}">
                <li class="fieldcontain">
                    <span id="fechaAlta-label" class="property-label"><g:message
                            code="usuarioSistema.fechaAlta.label" default="Fecha Alta"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaAlta-label"><g:formatDate
                            date="${usuarioSistemaInstance?.fechaAlta}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.fechaModifica}">
                <li class="fieldcontain">
                    <span id="fechaModifica-label" class="property-label"><g:message
                            code="usuarioSistema.fechaModifica.label" default="Fecha Modifica"/></span>
                    
                    <span class="property-value" aria-labelledby="fechaModifica-label"><g:formatDate
                            date="${usuarioSistemaInstance?.fechaModifica}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.estadoLogico}">
                <li class="fieldcontain">
                    <span id="estadoLogico-label" class="property-label"><g:message
                            code="usuarioSistema.estadoLogico.label" default="Estado Logico"/></span>
                    
                    <span class="property-value" aria-labelledby="estadoLogico-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="estadoLogico"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.accountExpired}">
                <li class="fieldcontain">
                    <span id="accountExpired-label" class="property-label"><g:message
                            code="usuarioSistema.accountExpired.label" default="Account Expired"/></span>
                    
                    <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                            boolean="${usuarioSistemaInstance?.accountExpired}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.accountLocked}">
                <li class="fieldcontain">
                    <span id="accountLocked-label" class="property-label"><g:message
                            code="usuarioSistema.accountLocked.label" default="Account Locked"/></span>
                    
                    <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                            boolean="${usuarioSistemaInstance?.accountLocked}"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.captcha}">
                <li class="fieldcontain">
                    <span id="captcha-label" class="property-label"><g:message
                            code="usuarioSistema.captcha.label" default="Captcha"/></span>
                    
                    <span class="property-value" aria-labelledby="captcha-label"><g:fieldValue
                            bean="${usuarioSistemaInstance}" field="captcha"/></span>
                    
                </li>
            </g:if>
            
            <g:if test="${usuarioSistemaInstance?.passwordExpired}">
                <li class="fieldcontain">
                    <span id="passwordExpired-label" class="property-label"><g:message
                            code="usuarioSistema.passwordExpired.label" default="Password Expired"/></span>
                    
                    <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                            boolean="${usuarioSistemaInstance?.passwordExpired}"/></span>
                    
                </li>
            </g:if>
            
        </ol>
        <g:form>
            <fieldset class="buttons">
                <g:hiddenField name="id" value="${usuarioSistemaInstance?.id}"/>

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
