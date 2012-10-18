<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">

    <link rel="stylesheet" href="${resource(dir: 'css', file: 'reset.css')}" type="text/css" media="screen"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css" media="screen"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'invalid.css')}" type="text/css" media="screen"/>



    <sec:ifLoggedIn>
        <sec:ifAnyGranted roles="ROLE_ADMIN">
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'red.css')}" type="text/css" media="screen"/>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ALUMNO">
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'blue.css')}" type="text/css" media="screen"/>

        </sec:ifAnyGranted>
    </sec:ifLoggedIn>



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
    <g:layoutHead/>
    <r:layoutResources/>
</head>

<body><div id="body-wrapper"><!-- Wrapper for the radial gradient background -->

    <div id="sidebar"><div id="sidebar-wrapper"><!-- Sidebar with logo and menu -->

        <h1 id="sidebar-title"><a href="#">OPES</a></h1>

        <!-- Logo (221px wide) -->
        <a href="#"><img id="logo" src="${resource(dir: 'images', file: 'logo.png')}" alt="Simpla Admin logo"/></a>
        <sec:ifLoggedIn>
        <g:render template="/layouts/menu"></g:render>
        </sec:ifLoggedIn>
        <g:render template="/layouts/mensajes"></g:render>

        <g:render template="/layouts/editarUsuario"></g:render>

    </div></div> <!-- End #sidebar -->

    <div id="main-content"><!-- Main Content Section with everything -->

        <noscript><!-- Show a notification if the user has disabled javascript -->
            <div class="notification error png_bg">
                <div>
                    Javascript est&aacute; desactivado o su explorador no lo soporta. Por favor <a
                        href="http://browsehappy.com/"
                        title="Upgrade to a better browser">upgrade</a> your browser or <a
                        href="http://www.google.com/support/bin/answer.py?answer=23852"
                        title="Active la funci&ocuate;n de Javascript">active</a> Javascript para navegar apropiadamente.
                </div>
            </div>
        </noscript>

        <g:layoutBody/>



        <div id="footer">
            <small><!-- Remove this notice or replace it with whatever you want -->
            &#169; Copyright 2009 OPES | Powered by <a href="http://www.sintelti.mx">Sintel TI</a> | <a href="#">Top</a>
            </small>
        </div><!-- End #footer -->

    </div> <!-- End #main-content -->

</div>
<g:javascript library="application"/>
<r:layoutResources/>
</body>

</html>