<%@ page import="opes.utils.Captcha" %>
<%@ page import="opes.login.UsuarioSistema" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title><g:message code="opes.springSecurity.registro.header" default="REGISTRO DE USUARIO MVS"/></title>
</head>

<body>
<h2>Registro de cuenta</h2>

<p id="page-intro">Rellene la siguiente informaci&oacute;n para solicitar el alta en el sistema.</p>


<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>Formulario de registro</h3>

    </div> <!-- End .content-box-header -->


    <div class="content-box-content">

        <g:if test="${request.messageError}">
            <div class="notification error png_bg">
                <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}"
                                               title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>

                <div>
                    ${request.messageError}
                </div>
            </div>
        </g:if>
        <g:if test="${request.messageErrorCaptcha}">
            <div class="notification error png_bg">
                <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}"
                                               title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>

                <div>
                    ${request.messageErrorCaptcha}
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

        <g:hasErrors bean="${usuarioSistemaInstance}">
			<div class="notification error png_bg">
				<a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}" title="Close this notification" alt="close" /></a>
				<div>
					<ul>
				        <g:eachError bean="${usuarioSistemaInstance}" var="error">
				            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				        </g:eachError>
                    </ul>
				</div>
			</div>
			</g:hasErrors>



            <g:form name="Name" autocomplete='off' controller="login">
                <a class="requerido">*</a>Tipo de usuario:<g:select name="tipoUsuario" required="" from="${new UsuarioSistema().constraints.tipoUsuario.inList.findAll { it != 'ADMINISTRADOR'}}" value="${usuarioSistemaInstance?.tipoUsuario}" valueMessagePrefix="usuarioSistema.tipoUsuario" noSelection="['': '']"/>
                <pre>&#09;</pre>
                <pre>&#09;</pre>
                <a class="requerido">*</a>No Control / No Empleado:<g:textField class="text-input" name="noControlEmpleado" required="" value="${usuarioSistemaInstance?.nombre}"
                                         onChange="return conMayusculas(this)"/>
                <br/>
                <a class="requerido">*</a>Nombre:<g:textField class="text-input" name="nombre" required="" value="${usuarioSistemaInstance?.nombre}"
                                         onChange="return conMayusculas(this)"/>
                <pre>&#09;</pre>
                <pre>&#09;</pre>
                Segundo nombre:<g:textField class="text-input" name="segundoNombre"
                                         value="${usuarioSistemaInstance?.segundoNombre}"
                                         onChange="return conMayusculas(this)"/>
                <br/>
                <a class="requerido">*</a>Apellido paterno:<g:textField class="text-input" name="apellidoPaterno" required=""
                                         value="${usuarioSistemaInstance?.apellidoPaterno}"
                                         onChange="return conMayusculas(this)"/>
                <pre style='display:inline'>&#09;</pre>
                <a class="requerido">*</a>Apellido materno:<g:textField class="text-input" name="apellidoMaterno" required=""
                                         value="${usuarioSistemaInstance?.apellidoMaterno}"
                                         onChange="return conMayusculas(this)"/>
                <br/>

                <a class="requerido">*</a>Correo electr&oacute;nico:<g:field class="text-input" name="username" type="email" required=""
                                     value="${usuarioSistemaInstance?.username}"/> <b>Ej. alguien@ejemplo.com</b>
                <br/>
                <a class="requerido">*</a>Tel&eacute;fono:<g:textField class="text-input" name="telefono" required=""
                                         value="${usuarioSistemaInstance?.telefono}"
                                         onkeypress="return isNumerico(event)"/><b>Ej. 4422222222</b>
                <br/>
                <a class="requerido">*</a>Introduzca los datos de la imagen:<g:textField class="text-input" name="captcha" required="" value=""/></td>


                <p style="font-size: 50px; font-family:serif;">
                    <%=session.captcha%>
                </p>


                <g:actionSubmit class="button" value="Aceptar" action="save"/>
                <a class="button" href="${createLink(uri: '/')}">Cancelar</a>

            </g:form>


    </div>
</div>

</body>
</html>
