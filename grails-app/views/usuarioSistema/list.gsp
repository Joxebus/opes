
<%@ page import="opes.login.UsuarioSistema" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'usuarioSistema.label', default: 'UsuarioSistema')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>

<h3><g:message code="default.list.label" args="[entityName]"/></h3>
<p id="page-intro">En &eacute;sta secci&oacute;n puede ver el listado de ${entityName}</p>


<div class="content-box"><!-- Start Content Box -->
    <div class="content-box-header">
        <h3>Listado</h3>

    </div>

    <div class="content-box-content">

        <g:if test="${flash.success}">
        <div class="notification success png_bg">
				<a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
				<div>
					${flash.success}
				</div>
		</div>
        </g:if>
        <g:if test="${flash.warning}">
        <div class="notification attention png_bg">
				<a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
				<div>
					${flash.warning}
				</div>
		</div>
        </g:if>

        <g:if test="${flash.message}">
            <div class="notification information png_bg">
                <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
                <div>
                     ${flash.message}
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
                
                <g:sortableColumn property="id"
                                  title="${message(code: 'usuarioSistema.id.label', default: 'Id')}"/>
                
                <g:sortableColumn property="username"
                                  title="${message(code: 'usuarioSistema.username.label', default: 'Username')}"/>
                
                <g:sortableColumn property="password"
                                  title="${message(code: 'usuarioSistema.password.label', default: 'Password')}"/>
                
                <g:sortableColumn property="nombre"
                                  title="${message(code: 'usuarioSistema.nombre.label', default: 'Nombre')}"/>
                
                <g:sortableColumn property="segundoNombre"
                                  title="${message(code: 'usuarioSistema.segundoNombre.label', default: 'Segundo Nombre')}"/>
                
                <g:sortableColumn property="apellidoPaterno"
                                  title="${message(code: 'usuarioSistema.apellidoPaterno.label', default: 'Apellido Paterno')}"/>
                
                <th class="sortable">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${usuarioSistemaInstanceList}" status="i" var="usuarioSistemaInstance">
                <tr>
                    
                    <td><g:link action="show"
                                id="${usuarioSistemaInstance.id}">${fieldValue(bean: usuarioSistemaInstance, field: "id")}</g:link></td>
                    
                    <td>${fieldValue(bean: usuarioSistemaInstance, field: "username")}</td>
                    
                    <td>${fieldValue(bean: usuarioSistemaInstance, field: "password")}</td>
                    
                    <td>${fieldValue(bean: usuarioSistemaInstance, field: "nombre")}</td>
                    
                    <td>${fieldValue(bean: usuarioSistemaInstance, field: "segundoNombre")}</td>
                    
                    <td>${fieldValue(bean: usuarioSistemaInstance, field: "apellidoPaterno")}</td>
                    
                    <td><!-- Icons -->
                    <g:form>
                        <g:hiddenField name="id" value="${usuarioSistemaInstance.id}"/>
                        <g:actionSubmitImage value="Editar" src="${resource(dir: 'images/icons', file: 'pencil.png')}" action="edit"/>
                        <g:actionSubmitImage value="Eliminar" src="${resource(dir: 'images/icons', file: 'cross.png')}" action="delete" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
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
                        <g:paginate total="${usuarioSistemaInstanceTotal}"/>
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
