

<div class="campoBuscar5">
<!-- <richui:autoComplete name="buscar" />	-->
	
<%--<INPUT type="text"  name="buscar" SIZE=20 id="cantidad" onChange="validarSiNumero(this.value);">--%>

<g:select name="buscar" from="${['Administrador del sistema','MVS','Proveedor']}"
		value="${value}" keys="['1','2','3']" 
		noSelection="['':'-Seleccione un rol-']" />

</div>
<div class="botonBuscar3"><g:actionSubmitImage style="border:none; background:transparent;"
											 action="buscar" 
						  					  value="buscador"
												src="${resource(dir: 'images/style', file: 'buscar.png')}" />				
</div>	