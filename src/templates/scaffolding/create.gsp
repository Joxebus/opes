<%=packageName%>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
    <h2><g:message code="default.create.label" args="[entityName]" /></h2>
    <p id="page-intro">En &eacute;sta secci&oacute;n puedes crear \${entityName}</p>

		<div class="clear"></div> <!-- End .clear -->
    <div class="content-box"><!-- Start Content Box -->
        <div class="content-box-header">
			<h3>Formulario de creaci&oacute;n</h3>
        </div>
        <div class="content-box-content">
			<g:if test="\${flash.message}">
            <div class="notification information png_bg">
                <a href="#" class="close"><img src="\${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
                <div>
                     \${flash.message}
                </div>
            </div>
        </g:if>
			<g:hasErrors bean="\${${propertyName}}">
			<div class="notification error png_bg">
				<a href="#" class="close"><img src="\${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Close this notification" alt="close" /></a>
				<div>
					<ul>
				        <g:eachError bean="\${${propertyName}}" var="error">
				            <li <g:if test="\${error in org.springframework.validation.FieldError}">data-field-id="\${error.field}"</g:if>><g:message error="\${error}"/></li>
				        </g:eachError>
                    </ul>
				</div>
			</div>
			</g:hasErrors>

			<g:form action="save" <%= multiPart ? ' enctype="multipart/form-data"' : '' %>>
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="\${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
            </div>
		</div>
	</body>
</html>
