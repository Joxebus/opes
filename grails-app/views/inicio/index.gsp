<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Bienvenido al sistema OPES</title>

</head>

<body>

<!-- Page Head -->
<h2>Bienvenido ${session.usuario}</h2>

<p id="page-intro">¿Qu&eacute; deseas hacer?</p>

<g:if test="${flash.success}">
    <div class="notification success png_bg">
        <a href="#" class="close"><img src="${resource(dir: 'images/icons', file: 'cross_grey_small.png')}"
                                       title="Cerrar notificaci&oacute;n" alt="cerrar"/></a>

        <div>
            ${flash.success}
        </div>
    </div>
</g:if>

<ul class="shortcut-buttons-set">

    <li><a class="shortcut-button" href="#"><span>
        <img src="images/icons/pencil_48.png" alt="icon"/><br/>
        Escribir un art&iacute;culo
    </span></a></li>

    <li><a class="shortcut-button" href="#"><span>
        <img src="images/icons/paper_content_pencil_48.png" alt="icon"/><br/>
        Crear una nueva p&aacute;gina
    </span></a></li>

    <li><a class="shortcut-button" href="#"><span>
        <img src="images/icons/image_add_48.png" alt="icon"/><br/>
        Cargar una imagen
    </span></a></li>

    <li><a class="shortcut-button" href="#"><span>
        <img src="images/icons/clock_48.png" alt="icon"/><br/>
        Agregar un evento
    </span></a></li>

    <li><a class="shortcut-button" href="#messages" rel="modal"><span>
        <img src="images/icons/comment_48.png" alt="icon"/><br/>
        Revisar mensajes
    </span></a></li>

</ul><!-- End .shortcut-buttons-set -->
<div class="clear"></div> <!-- End .clear -->

<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>Bienvenido al sistema OPES</h3>


        <div class="clear"></div>

    </div> <!-- End .content-box-header -->

    <div class="content-box-content">

    <h2>Descripci&oacute;n del sistema:</h2>
    <p>El sistema OPES  es una aplicación web de tipo Ambiente Educativo Virtual, un sistema de gestión de cursos,
     que ayuda a los educadores a crear comunidades de aprendizaje en línea.
    Este tipo de plataformas tecnológicas también se conoce como LMS (Learning Management System).
    </p>
    <p>
        Un profesor que opera desde este punto de vista crea un ambiente centrado en el estudiante que le ayuda a
        construir ese conocimiento con base en sus habilidades y conocimientos propios en lugar de simplemente
        publicar y transmitir la información que se considera que los estudiantes deben conocer.
    </p>


</div>
</div>
</body>
</html>
