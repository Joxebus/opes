<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="inicio"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css" media="screen"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css" media="screen"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'invalid.css')}" type="text/css" media="screen"/>






    <!-- Colour Schemes
			Default colour scheme is green. Uncomment prefered stylesheet to use it.
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'blue.css')}" type="text/css" media="screen" />
		        <link rel="stylesheet" href="${resource(dir: 'css', file: 'red.css')}" type="text/css" media="screen" />
		-->

    <!--[if lte IE 7]>
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'ie.css')}" type="text/css" media="screen" />
		<![endif]-->

    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.3.2.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'simpla.jquery.configuration.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'facebox.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.wysiwyg.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.date.js')}"></script>

    <!--[if IE]>
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.bgiframe.js')}"></script>
		<!-- Internet Explorer .png-fix -->

    <!--[if IE 6]>
			<script type="text/javascript" src="${resource(dir: 'js', file: 'DD_belatedPNG_0.0.7a.js')}"></script>
			<script type="text/javascript">
				DD_belatedPNG.fix('.png_bg, img, li');
			</script>
		<![endif]-->
    <%--        <title><g:message code="mx.com.sintelti.mvs.springSecurity.login.header" default="INICIO DE SESI&Oacute;N" /></title>--%>
    <title>INICIO DE SESI&Oacute;N</title>

</head>

<body id="login">

<div id="login-wrapper" class="png_bg">
    <div id="login-top">

        <h1>OPES</h1>
        <!-- Logo (221px width) -->
        <img id="logo" src="${resource(dir: 'images', file: 'logo.png')}" alt="Simpla Admin"/>
    </div> <!-- End #logn-top -->

    <div id="login-content">

        <form id="frmLogin" action='${postUrl}' method='POST' autocomplete='off'>

            <g:if test="${flash.message}">
                <div class="notification information png_bg">
                    <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}"
                                                   title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>
                    <div>
                        ${flash.message}
                    </div>
                </div>
            </g:if>

            <p>
                <label>Usuario</label>
                <g:textField class="text-input" id='username' name="j_username" value=""/>
            </p>

            <div class="clear"></div>

            <p>
                <label>Contrase&ntilde;a</label>
                <g:passwordField class="text-input" id='password' name="j_password" value=""/>
            </p>

            <div class="clear"></div>

            <p id="remember-password">
                <g:link class="login" controller="login" action="errorAcceso"><g:message
                        code="opes.springSecurity.login.error.acceso.cuenta"
                        default="&iquest;No puede entrar a su cuenta?"/></g:link><br/>
                <g:link class="login" controller="login" action="registro"><g:message
                        code="opes.springSecurity.login.registrar"
                        default="Reg&iacute;strese aqu&iacute; si no tiene una cuenta"/></g:link>
            </p>

            <div class="clear"></div>

            <p>
                <input class="button" value="Aceptar" type="submit">
            </p>

        </form>
        <script type='text/javascript'>
            <!--
            (function() {
                document.forms['loginForm'].elements['j_username'].focus();
            })();
            // -->
        </script>
    </div> <!-- End #login-content -->

</div> <!-- End #login-wrapper -->






</body>

</html>
