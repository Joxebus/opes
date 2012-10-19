
<%@ page import="opes.institucion.Curso" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}"/>
    <title>Lista de cursos impartidos</title>
</head>

<body>

<h3>Lista de cursos que impartes</h3>
<p id="page-intro">En &eacute;sta secci&oacute;n puede ver el listado de los cursos que son impartidos por usted</p>


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
            <g:actionSubmit class="button" value="Crear" action="createCurso"/>
        </g:form>
        </fieldset>
        <div class="clear"></div>
        <table>
            <thead>
            <tr>
                
                <g:sortableColumn property="id"
                                  title="${message(code: 'curso.titulo.label', default: 'Titulo')}"/>
                

                <g:sortableColumn property="descripcion"
                                  title="${message(code: 'curso.descripcion.label', default: 'Descripcion')}"/>
                
                <th><g:message code="curso.docente.label" default="Docente"/></th>

                <g:sortableColumn property="fechaInicio"
                                  title="${message(code: 'curso.fechaInicio.label', default: 'Fecha Inicio')}"/>
                
                <g:sortableColumn property="fechaFin"
                                  title="${message(code: 'curso.fechaFin.label', default: 'Fecha Fin')}"/>

                
                <th class="sortable">Acciones</th>
            </tr>
            </thead>
            <tbody>
            <g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
                <tr>
                    
                    <td>${fieldValue(bean: cursoInstance, field: "titulo")}</td>
                    
                    <td>${fieldValue(bean: cursoInstance, field: "descripcion")}</td>
                    
                    <td>${fieldValue(bean: cursoInstance, field: "docente")}</td>

                    <td><g:formatDate date="${cursoInstance.fechaInicio}" format="dd-MMMM-yyyy"/></td>

                    <td><g:formatDate date="${cursoInstance.fechaFin}" format="dd-MMMM-yyyy"/></td>
                    
                    <td><!-- Icons -->
                    <g:form>
                        <g:hiddenField name="id" value="${cursoInstance.id}"/>
                        <g:actionSubmitImage value="Editar" src="${resource(dir: 'images/icons', file: 'pencil.png')}" action="editCurso"/>
                        <g:actionSubmitImage value="Eliminar" src="${resource(dir: 'images/icons', file: 'cross.png')}" action="deleteCurso" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                    </g:form>
                    </td>
                </tr>
            </g:each>

            <tfoot>
            <tr>
                <td colspan="6">
                    <div class="bulk-actions align-left">

                    </div>



                    <div class="clear"></div>
                </td>
            </tr>
            </tfoot>
            </tbody>
        </table>

        <div class="pagination">
                        <g:paginate total="${cursoInstanceTotal}"/>
        </div>

    </div>

</div>

</body>
</html>
