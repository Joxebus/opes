
<%@ page import="opes.institucion.Docente" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}"/>
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
                                  title="${message(code: 'docente.id.label', default: 'Id')}"/>
                
                <th><g:message code="docente.usuarioSistema.label" default="Usuario Sistema"/></th>
                
                <g:sortableColumn property="ipModifica"
                                  title="${message(code: 'docente.ipModifica.label', default: 'Ip Modifica')}"/>
                
                <g:sortableColumn property="foto"
                                  title="${message(code: 'docente.foto.label', default: 'Foto')}"/>
                
                <g:sortableColumn property="ipAlta"
                                  title="${message(code: 'docente.ipAlta.label', default: 'Ip Alta')}"/>
                
                <th class="sortable">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${docenteInstanceList}" status="i" var="docenteInstance">
                <tr>
                    
                    <td><g:link action="show"
                                id="${docenteInstance.id}">${fieldValue(bean: docenteInstance, field: "id")}</g:link></td>
                    
                    <td>${fieldValue(bean: docenteInstance, field: "usuarioSistema")}</td>
                    
                    <td>${fieldValue(bean: docenteInstance, field: "ipModifica")}</td>
                    
                    <td>${fieldValue(bean: docenteInstance, field: "foto")}</td>
                    
                    <td>${fieldValue(bean: docenteInstance, field: "ipAlta")}</td>
                    
                    <td><!-- Icons -->
                    <g:form>
                        <g:hiddenField name="id" value="${docenteInstance.id}"/>
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
                        <g:paginate total="${docenteInstanceTotal}"/>
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
