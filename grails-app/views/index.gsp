<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

</head>

<body>

<!-- Page Head -->
<h2>Bienvenido <sec:loggedInUserInfo field="username"></sec:loggedInUserInfo></h2>
<p id="page-intro">¿Qu&eacute; deseas hacer?</p>

<ul class="shortcut-buttons-set">

				<li><a class="shortcut-button" href="#"><span>
					<img src="images/icons/pencil_48.png" alt="icon" /><br />
					Escribir un art&iacute;culo
				</span></a></li>

				<li><a class="shortcut-button" href="#"><span>
					<img src="images/icons/paper_content_pencil_48.png" alt="icon" /><br />
					Crear una nueva p&aacute;gina
				</span></a></li>

				<li><a class="shortcut-button" href="#"><span>
					<img src="images/icons/image_add_48.png" alt="icon" /><br />
					Cargar una imagen
				</span></a></li>

				<li><a class="shortcut-button" href="#"><span>
					<img src="images/icons/clock_48.png" alt="icon" /><br />
					Agregar un evento
				</span></a></li>

				<li><a class="shortcut-button" href="#messages" rel="modal"><span>
					<img src="images/icons/comment_48.png" alt="icon" /><br />
					Revisar mensajes
				</span></a></li>

			</ul><!-- End .shortcut-buttons-set -->
<div class="clear"></div> <!-- End .clear -->

<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>Welcome to Grails</h3>


        <div class="clear"></div>

    </div> <!-- End .content-box-header -->

    <div class="content-box-content">

        <p>Congratulations, you have successfully started your first Grails application! At the moment
        this is the default page, feel free to modify it to either redirect to a controller or display whatever
        content you may choose. Below is a list of controllers that are currently deployed in this application,
        click on each to execute its default action:</p>

        <div id="controller-list" role="navigation">
            <h2>Available Controllers:</h2>
            <ul>
                <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                    <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                </g:each>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
