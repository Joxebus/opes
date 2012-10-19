<%--
  Created by IntelliJ IDEA.
  User: Jorge Omar Bautista Valenzuela
  Date: 10/10/12
  Time: 21:51
  email: joxebus@gmail.com
--%>
<div id="editar_usuario"
     style="display: none;"><!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->
    <g:form name="Name" autocomplete='off' enctype="multipart/form-data" controller="inicio">
        Tipo de usuario:<pre>&#09;</pre> <b>${session.usuario?.tipoUsuario}</b>
        <br/>
        <sec:ifLoggedIn>
            <sec:ifAnyGranted roles="ROLE_DOCENTE,ROLE_ALUMNO">
            No <g:if test="${session.usuario?.tipoUsuario=='ALUMNO'}">Control</g:if><g:else>Empleado</g:else>:<pre>&#09;</pre><b>${session.usuario?.noControlEmpleado}</b>
            <br/><br/>

                Fotograf&iacute;a:<input type="file" id="foto" name="fotografia"/>
                <br/>
                <pre>&#09;</pre>
                <small><b>La imagen debe ser en formato jpg, png o gif y <br/>
                <pre>&#09;</pre>el tamaño se reajustar&aacute; si es muy grande</b></small>
                <br/><br/>
            </sec:ifAnyGranted>
        </sec:ifLoggedIn>

        <a class="requerido">*</a>Nombre:<g:textField class="text-input" name="nombre" required=""
                                                      value="${session.usuario?.nombre}"
                                                      onChange="return conMayusculas(this)"/>
        <pre>&#09;</pre>
        <pre>&#09;</pre>
        Segundo nombre:<g:textField class="text-input" name="segundoNombre"
                                    value="${session.usuario?.segundoNombre}"
                                    onChange="return conMayusculas(this)"/>
        <br/>
        <a class="requerido">*</a>Apellido paterno:<g:textField class="text-input" name="apellidoPaterno" required=""
                                                                value="${session.usuario?.apellidoPaterno}"
                                                                onChange="return conMayusculas(this)"/>
        <br/>
        <a class="requerido">*</a>Apellido materno:<g:textField class="text-input" name="apellidoMaterno" required=""
                                                                value="${session.usuario?.apellidoMaterno}"
                                                                onChange="return conMayusculas(this)"/>
        <br/>

        <a class="requerido">*</a>Correo electr&oacute;nico:<g:field class="text-input" name="username" type="email"
                                                                     required=""
                                                                     value="${session.usuario?.username}"/>
        <br/>
        <pre>&#09;</pre>
        <pre>&#09;</pre>
        <small><b>Ej. alguien@ejemplo.com</b></small>
        <br/>
        <a class="requerido">*</a>Tel&eacute;fono:<g:textField class="text-input" name="telefono" required=""
                                                               value="${session.usuario?.telefono}"
                                                               onkeypress="return isNumerico(event)"/>
        <br/>
        <pre>&#09;</pre><small><b>Ej. 4422222222</b></small>
        <br/>



        <g:actionSubmit class="button" value="Aceptar" action="actualizarUsuario"/>
        <a class="button" href="${createLink(uri: '/')}">Cancelar</a>

    </g:form>
</div>