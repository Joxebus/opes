<%@ page import="opes.login.UsuarioSistemaPermiso;" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="solicitudes.title" default="Solicitudes de cuentas MVS"/></title>
</head>


<body>
<h2>Solicitud de Cuenta Existente</h2>

<p id="page-intro">En &eacute;sta secci&oacute;n puede tener el control sobre las cuentas de los usuarios del sistema</p>


<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>Listado de cuentas registradas</h3>


        <div class="clear"></div>

    </div> <!-- End .content-box-header -->





    <div class="content-box-content">

        <g:if test="${flash.messageError}">
            <div class="notification error png_bg">
                <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}"
                                               title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>

                <div>
                    ${flash.messageError}
                </div>
            </div>
        </g:if>

        <g:if test="${flash.message}">
            <div class="notification information png_bg">
                <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}"
                                               title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>

                <div>
                    ${flash.message}
                </div>
            </div>
        </g:if>


        <table>
            <thead>
            <tr>
                <th width="50px"><g:message code="solicitud.table.head.noControlEmpleado"
                                            default="No Control / Empleado"/></th>
                <th width="90px"><g:message code="solicitud.table.head.nombre" default="Nombre"/></th>

                <th width="90px"><g:message code="solicitud.table.head.email"
                                            default="Correo Electr&oacute;nico"/></th>
                <th width="90px"><g:message code="solicitud.table.head.tipoUsuario"
                                            default="Tipo de usuario"/></th>
                <th width="35px"><g:message code="solicitud.table.head.rol" default="Rol"/></th>
                <th width="35px"><g:message code="solicitud.table.head.verificacion"
                                            default="Verificaci&oacute;n"/></th>
                <th width="35px"><g:message code="solicitud.table.head.cuenta" default="Cuenta"/></th>
                <th width="35px"><g:message code="solicitud.table.head.cuentad" default="Eliminar"/></th>

            </tr>
            </thead>
            <tbody>
            <g:each in="${usuariosList}" status="i" var="usuarioInstance">
                <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${fieldValue(bean: usuarioInstance, field: "noControlEmpleado")}</td>
                <td>${fieldValue(bean: usuarioInstance, field: "nombre")}  ${fieldValue(bean: usuarioInstance, field: "segundoNombre")} ${fieldValue(bean: usuarioInstance, field: "apellidoPaterno")} ${fieldValue(bean: usuarioInstance, field: "apellidoMaterno")}</td>

                <td>${fieldValue(bean: usuarioInstance, field: "username")}</td>
                <td>${fieldValue(bean: usuarioInstance, field: "tipoUsuario")}</td>
                <td>
                    <g:if test="${UsuarioSistemaPermiso.getByID(usuarioInstance.id) != null}">
                        <g:if test="${UsuarioSistemaPermiso.getByID(usuarioInstance.id).permiso.authority == 'ROLE_ADMIN'}">
                            ADMINISTRADOR
                        </g:if>
                        <g:elseif
                                test="${UsuarioSistemaPermiso.getByID(usuarioInstance.id).permiso.authority == 'ROLE_ALUMNO'}">
                            ALUMNO
                        </g:elseif>
                        <g:elseif
                                test="${UsuarioSistemaPermiso.getByID(usuarioInstance.id).permiso.authority == 'ROLE_DOCENTE'}">
                            DOCENTE
                        </g:elseif>
                    </g:if>
                    <g:else>
                        <g:select name="rol"
                                  from="${['ROLE_ADMIN':'ADMINISTRADOR','ROLE_ALUMNO':'ALUMNO','ROLE_DOCENTE':'DOCENTE']}"
                                  value="${rol}"
                                  optionValue="value"
                                  optionKey="key"
                                  noSelection="['':'-Seleccione un rol-']"
                                  onchange="${remoteFunction(controller:'solicitudCuenta', update:'superBody',id:usuarioInstance?.id, action:'asignarRol',params:'\'role=\' + escape(this.value)')}"/>
                    </g:else>
                </td>
                <td>
                    <g:if test="${!usuarioInstance.enabled}">
                        <form>
                            <g:hiddenField name="id" value="${usuarioInstance.id}"/>
                            <center>

                                <g:actionSubmitImage action="resumenActivaUsuario" value="AceptarSolicitud"
                                                     src="${resource(dir:'images/style',file:'palomita.png')}"
                                                     style="border:none;background:transparent;"/>
                            </center>
                        </form>
                    </g:if>

                <td>

                    <g:if test="${usuarioInstance.enabled == false && UsuarioSistemaPermiso.getByID(usuarioInstance.id.toLong()) == null && usuarioInstance.observaciones.length() == 0}">
                        PENDIENTE
                    </g:if>
                    <g:elseif
                            test="${usuarioInstance.enabled == true && UsuarioSistemaPermiso.getByID(usuarioInstance.id.toLong()) != null  && UsuarioSistemaPermiso.getByID(usuarioInstance.id).permiso != null}">
                        ACEPTADO
                    </g:elseif>
                </td>


                <td>
                    <g:form>
                        <g:hiddenField name="id" value="${usuarioInstance.id}"/>
                        <g:actionSubmitImage src="${resource(dir:'images/style', file:'delete.png')}"
                                             action="delete"
                                             value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                             onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                    </g:form>

                </td>

                </td>


                </tr>

            </g:each>
            </tbody>

        </table>


        <div class="pagination">
            <g:paginate total="${usuariosTotal}" action="filtroCuenta"/>
        </div>
        <br/>

        <fieldset>
            <g:form>
                <g:message code="Filtrar por:"/>
                <g:select name="parametroBuscar"
                          from="${['Nombre']}"
                          value="${value}"
                          keys="['1']"
                          required=""
                          noSelection="['':'Seleccione una opci\u00f3n']"/>
                <g:textField name="buscar" class="text-input" required=""/>
                <g:actionSubmit class="button" action="buscar" value="Buscar"/>
            </g:form>
        </fieldset>
    </div>
</div>

</body>
</html>