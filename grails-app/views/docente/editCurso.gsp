<%@ page import="opes.institucion.Curso" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
    <h2><g:message code="default.edit.label" args="[entityName]" /></h2>
    <p id="page-intro">En &eacute;sta secci&oacute;n puedes editar ${entityName}</p>
    <div class="clear"></div> <!-- End .clear -->
    <div class="content-box"><!-- Start Content Box -->
        <div class="content-box-header">

			<h3>Formulario de edici&oacute;n</h3>

        </div>
        <div class="content-box-content">
            <g:hasErrors bean="${cursoInstance}">
            <div class="notification error png_bg">
				<a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Close this notification" alt="close" /></a>
				<div>
					<ul>
				        <g:eachError bean="${cursoInstance}" var="error">
				            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				        </g:eachError>
                    </ul>
				</div>
			</div>
        </g:hasErrors>
        <g:if test="${flash.message}">
            <div class="notification information png_bg">
                <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
                <div>
                     ${flash.message}
                </div>
            </div>
        </g:if>

		    <g:form method="post" >
				<g:hiddenField name="id" value="${cursoInstance?.id}" />
				<g:hiddenField name="version" value="${cursoInstance?.version}" />
				<fieldset class="form">
					<g:render template="formCurso"/>
				</fieldset>

                <fieldset class="buttons">
                    <g:actionSubmit class="button" action="updateCurso" value="${message(code: 'default.button.update.label', default: 'Update')}" />
					<g:actionSubmit class="button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>

			</g:form>
		</div>

        </div>

	</body>
</html>
