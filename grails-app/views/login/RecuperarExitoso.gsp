<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>RECUPERACI&Oacute;N DE CONTRASEÑA DEL USUARIO OPES</title>
    </head>
    <body>
		<div id='login' align="center">
		<div class="titulo">
            <h1>Cambio de Contrase&ntilde;a Exitoso</h1>
        </div>
        <br><br><br><br><br>
			<table  style="width: 500px;">	
				<tr>	
					<g:if test="${flash.message}">			
						<td>${flash.message}</td>
					</g:if>
					<g:else>
     					<td>${flash.messageError}</td>
					</g:else>
			    </tr>
			</table>
			<a href="${createLink(uri: '/')}">
		        		<img id="btnRegresar" src="${resource(dir:'images',file:'Icono_ok1.png')}" alt="Regresar" border="0" />
		    </a>
		</div>
    </body>
</html>
