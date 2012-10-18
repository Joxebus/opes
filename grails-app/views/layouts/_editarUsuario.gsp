<%--
  Created by IntelliJ IDEA.
  User: Jorge Omar Bautista Valenzuela
  Date: 10/10/12
  Time: 21:51
  email: joxebus@gmail.com
--%>
<div id="editar_usuario"
     style="display: none;"><!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->
    <g:form name="Name" autocomplete='off' enctype="multipart/form-data">
        Tipo de usuario:<pre>&#09;</pre> <b>${session.usuario?.tipoUsuario}</b>
        <br/>

        No Control / No Empleado:<pre>&#09;</pre><b>${session.usuario?.noControlEmpleado}</b>
        <br/><br/>
        <sec:ifLoggedIn>
            <sec:ifAnyGranted roles="ROLE_DOCENTE,ROLE_ALUMNO">
                Fotograf&iacute;a:<input type="file" id="foto" name="fotografia"/>
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
        <pre style='display:inline'>&#09;</pre>
        <a class="requerido">*</a>Apellido materno:<g:textField class="text-input" name="apellidoMaterno" required=""
                                                                value="${session.usuario?.apellidoMaterno}"
                                                                onChange="return conMayusculas(this)"/>
        <br/>

        <a class="requerido">*</a>Correo electr&oacute;nico:<g:field class="text-input" name="username" type="email"
                                                                     required=""
                                                                     value="${session.usuario?.username}"/> <b>Ej. alguien@ejemplo.com</b>
        <br/>
        <a class="requerido">*</a>Tel&eacute;fono:<g:textField class="text-input" name="telefono" required=""
                                                               value="${session.usuario?.telefono}"
                                                               onkeypress="return isNumerico(event)"/><b>Ej. 4422222222</b>
        <br/>



        <g:actionSubmit class="button" value="Aceptar" action="actualizarUsuario" controller="inicio"
                        src="${resource(dir:'images',file:'Icono_ok1.png')}"
                        style="border: 0; background:transparent;"/>
        <a class="button" href="${createLink(uri: '/')}">Cancelar</a>

    </g:form>
</div>