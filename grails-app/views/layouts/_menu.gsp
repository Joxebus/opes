<%--
  Created by IntelliJ IDEA.
  User: Jorge Omar Bautista Valenzuela
  emai: joxebus@gmail.com
  Date: 3/10/12
  Time: 18:23

--%>

<!-- Sidebar Profile links -->
<div id="profile-links">
    Hola <a href="#editar_usuario" rel="modal" title="Editar perfil">${session.usuario}</a>,<br/>tienes <a href="#messages" rel="modal"
                                                                                    title="3 mensajes">3 mensajes</a><br/>
    <g:link controller="logout">Cerrar sesi&oacute;n</g:link><br/>
    <g:if test="${session.alumnoDocente?.foto}">
            <div>
                 <a href="#modal_foto_perfil" rel="modal" alt="Ver foto">
                    <img src="${createLink(controller: 'inicio', action: 'mostrarFotografia', id: session.usuario)}"
                         alt="${session.alumnoDocente}" class="foto_perfil">
                 </a>
                <div id="modal_foto_perfil" style="display: none;">
                    <center>
                     <img src="${createLink(controller: 'inicio', action: 'mostrarFotografia', id: session.usuario)}"
                         alt="${session.alumnoDocente}">
                     </center>
                </div>

            </div>
        </g:if>
</div>

<ul id="main-nav"><!-- Accordion Menu -->

    <li>
        <a href="${createLink(uri: '/')}" class="nav-top-item no-submenu current"> <!-- Add the class "no-submenu" to menu items with no sub menu -->
        Inicio
        </a>
    </li>

    <li>
        <a href="#" class="nav-top-item">
            P&aacute;ginas
        </a>
        <ul>
            <li><a href="#">Crear p&aacute;gina</a>
            </li> <!-- agregar class=current para que sea por default o submenu actual-->
            <li><a href="#">Administras p&aacute;ginas</a></li>
        </ul>
    </li>


    <li>
        <a href="#" class="nav-top-item">
            Eventos
        </a>
        <ul>
            <li><a href="#">Revisi&oacute;n de Calendario</a></li>
            <li><a href="#">Agregar un evento</a></li>
            <li><a href="#">Configuraci&oacute;n de calendario</a></li>
        </ul>
    </li>

    <li>
        <a href="#" class="nav-top-item">
            Configuraci&oacute;n
        </a>
        <ul>
            <li><a href="#">General</a></li>
            <li><a href="#">Dise&ntilde;o</a></li>
            <li><a href="#">Mi perfil</a></li>
            <li><a href="#">Usuarios y Permisos</a></li>
        </ul>
    </li>

</ul> <!-- End #main-nav -->