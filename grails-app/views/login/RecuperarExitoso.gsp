<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <title>RECUPERACI&Oacute;N DE CONTRASEÑA DEL USUARIO OPES</title>
</head>

<body>
<h2>Cambio de contrase&ntilde;a exitoso</h2>

<p id="page-intro">Se ha completado el cambio de contrase&ntilde;a</p>

<div class="content-box"><!-- Start Content Box -->

    <div class="content-box-header">

        <h3>Mensaje</h3>


        <div class="clear"></div>

    </div> <!-- End .content-box-header -->

    <div class="content-box-content">
    <p>
        <g:if test="${flash.message}">
            ${flash.message}
        </g:if>
        <g:else>
            ${flash.messageError}
        </g:else>
     </p>
        <a class="button" href="${createLink(uri: '/')}">Regresar</a>
    </div>
</div>


</body>
</html>
