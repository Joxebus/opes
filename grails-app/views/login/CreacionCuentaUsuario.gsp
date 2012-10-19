<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>CREACION DE CUENTA DE USUARIO OPES</title>
</head>

<body>
<h2>Creaci&oacute;n de usuario</h2>

<p id="page-intro"><g:message code="opes.springSecurity.login.recuperar.descripcion"
                              default="En esta pantalla se genera automaticamente la contrase&ntilde;a que sera enviada al correo del usuario."/></p>

<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>Generaci&oacute;n de contrase&ntilde;a</h3>


        <div class="clear"></div>

    </div> <!-- End .content-box-header -->

    <div class="content-box-content">
        <g:form name="Name" autocomplete='off' controller="solicitudCuenta">
            <g:hiddenField name="id" value="${idUsuario}"/>
            <g:hiddenField name="email" value="${email}"/>


            <label><g:message code="opes.springSecurity.login.usuario.email"
                              default="Correo electr&oacute;nico"/>:</label>
            <g:textField class="text-input" id='email' name="email" value="${email}" disabled="true"/>
            <br/>
            <br/>
            <label><g:message code="opes.springSecurity.login.usuario.email" default="Contrase&ntilde;a"/>:</label>
            <g:textField id='contrasenia' name="contrasenia" value="${contrasenia}" />
            <br/>
            <br/>
            <g:actionSubmit class="button" value="Aceptar" action="activaUsuario"/>
            <a class="button" href="${createLink(uri: '/')}">Cancelar</a>

        </g:form>
    </div>
</div>
</body>
</html>
