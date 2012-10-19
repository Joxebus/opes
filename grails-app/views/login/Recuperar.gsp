<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>RECUPERAR CONTRASE&Ntilde;A OPES</title>
</head>

<body>
<h2>Recuperaci&oacute;n de contraseña</h2>

<p id="page-intro">Ingrese la cuenta de correo electronico que tiene registrada.</p>

<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>Mensaje</h3>


        <div class="clear"></div>

    </div> <!-- End .content-box-header -->

    <div class="content-box-content">

        <g:form id='loginForm' name="Name" autocomplete='off' controller="login">

            <p><g:message code="opes.springSecurity.login.recuperar.descripcion"
                          default="Por favor, proporcione el correo electr&oacute;nico con el que se di&oacute; de alta, ya que a &eacute;ste le ser&aacute;n enviados sus datos de inicio de sesi&oacute;n."/></p>

            <g:message code="opes.springSecurity.login.usuario.email" default="Correo electr&oacute;nico"/>:
            <g:textField id='email' name="email" value="" required=""/>
            <br/>
            <br/>
            <g:actionSubmit class="button" value="Aceptar" action="recover" id="btnAceptar"/>


            <a class="button" href="${createLink(uri: '/')}">
                Cancelar
            </a>
        </g:form>
    </div>
</div>

<script type='text/javascript'>
    <!--
    (function() {
        document.forms['loginForm'].elements['j_username'].focus();
    })();
    // -->
</script>
</body>
</html>
