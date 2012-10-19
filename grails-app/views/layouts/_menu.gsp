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
    <sec:ifAnyGranted roles="ROLE_DOCENTE,ROLE_ALUMNO">
    <li>

        <a href="#" class="nav-top-item">
            Cursos
        </a>
        <ul>
            <sec:ifAnyGranted roles="ROLE_DOCENTE">
            <li><g:link controller="docente" action="createCurso">Crear curso</g:link></li>
            <li><g:link controller="docente" action="listCursosImpartidos">Cursos impartidos</g:link></li>
            <li><a href="#">Subir material</a></li><!-- agregar class=current para que sea por default o submenu actual-->
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_ALUMNO">
            <li><a href="#">Cursos disponibles</a></li>
            <li><a href="#">Cursos enrolados</a></li>
            <li><a href="#">Subir una tarea</a></li>
            </sec:ifAnyGranted>
        </ul>
    </li>
    </sec:ifAnyGranted>


    <li>
        <a href="#" class="nav-top-item">
            Configuraci&oacute;n
        </a>
        <ul>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
            <li><g:link controller="solicitudCuenta">Administrar usuarios</g:link></li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_DOCENTE,ROLE_ALUMNO">
            <li><a href="#">Mi perfil</a></li>
            <li><a href="#">Usuarios y Permisos</a></li>
            </sec:ifAnyGranted>
        </ul>
    </li>

</ul> <!-- End #main-nav -->