<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="opes.springSecurity.registro.header" default="REGISTRO DE USUARIO MVS" /></title>
    </head>
    <body>
		<div id='loginRegistro' align="center">
		<div class="titulo">
            <h1>Registro Exitoso</h1>
        </div>
        <br><br><br><br><br>
			<br>
			<table  style="width: 500px;">	
				<tr>	
					<td>Su registro ha sido exitoso, Se ha enviado un correo con la contrase&ntilde;a al usuario.</td>
		        </tr>
			</table>
			<br>
			<a href="${createLink(uri: '/')}">
		        		<img id="btnRegresar" src="${resource(dir:'images',file:'Icono_ok1.png')}" alt="Regresar" border="0" />
		    </a>
		</div>
    </body>
</html>
