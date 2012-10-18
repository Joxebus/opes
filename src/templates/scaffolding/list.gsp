<% import grails.persistence.Event %>
<%=packageName%>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<h3><g:message code="default.list.label" args="[entityName]"/></h3>
<p id="page-intro">En &eacute;sta secci&oacute;n puede ver el listado de \${entityName}</p>


<div class="content-box"><!-- Start Content Box -->
    <div class="content-box-header">
        <h3>Listado</h3>

    </div>

    <div class="content-box-content">

        <g:if test="\${flash.success}">
        <div class="notification success png_bg">
				<a href="#" class="close"><img src="\${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
				<div>
					\${flash.success}
				</div>
		</div>
        </g:if>
        <g:if test="\${flash.warning}">
        <div class="notification attention png_bg">
				<a href="#" class="close"><img src="\${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
				<div>
					\${flash.warning}
				</div>
		</div>
        </g:if>

        <g:if test="\${flash.message}">
            <div class="notification information png_bg">
                <a href="#" class="close"><img src="\${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
                <div>
                     \${flash.message}
                </div>
            </div>
        </g:if>
        <fieldset class="column-left">
        <g:form>
            <g:actionSubmit class="button" value="Crear" action="create"/>
        </g:form>
        </fieldset>
        <div class="clear"></div>
        <table>
            <thead>
            <tr>
                <% excludedProps = Event.allEvents.toList() << 'version' << 'usuarioAlta' << 'usuarioModifica' << 'estadoLogico' << 'fechaAlta' << 'fechaModifica'
                allowedNames = domainClass.persistentProperties*.name << 'id' << 'dateCreated' << 'lastUpdated'
                props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) }
                Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
                props.eachWithIndex { p, i ->
                    if (i < 6) {
                        if (p.isAssociation()) { %>
                <th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}"/></th>
                <% } else { %>
                <g:sortableColumn property="${p.name}"
                                  title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}"/>
                <% }
                }
                } %>
                <th class="sortable">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="\${${propertyName}List}" status="i" var="${propertyName}">
                <tr>
                    <% props.eachWithIndex { p, i ->
                        if (i == 0) { %>
                    <td><g:link action="show"
                                id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
                    <% } else if (i < 6) {
                        if (p.type == Boolean || p.type == boolean) { %>
                    <td><g:formatBoolean boolean="\${${propertyName}.${p.name}}"/></td>
                    <% } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
                    <td><g:formatDate date="\${${propertyName}.${p.name}}"/></td>
                    <% } else { %>
                    <td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
                    <% }
                    }
                    } %>
                    <td><!-- Icons -->
                    <g:form>
                        <g:hiddenField name="id" value="\${${propertyName}.id}"/>
                        <g:actionSubmitImage value="Editar" src="\${resource(dir: 'images/icons', file: 'pencil.png')}" action="edit"/>
                        <g:actionSubmitImage value="Eliminar" src="\${resource(dir: 'images/icons', file: 'cross.png')}" action="delete" formnovalidate="" onclick="return confirm('\${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                    </g:form>
                    </td>
                </tr>
            </g:each>

            <tfoot>
            <tr>
                <td colspan="6">
                    <div class="bulk-actions align-left">
                        Some action
                    </div>

                    <div class="pagination">
                        <g:paginate total="\${${propertyName}Total}"/>
                    </div>

                    <div class="clear"></div>
                </td>
            </tr>
            </tfoot>
            </tbody>
        </table>

    </div>

</div>

</body>
</html>
