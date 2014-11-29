<%@ include file="../fragments/headerRegistro.jspf" %>

<script type="text/javascript">

$(document).ready(function(){

	$(function() {
		
			$.ajax({
				dataType: "json",
				url: "dameServicios",
				type: "POST",
				success: function(data) {
					obtenerServicios(data);
				}
			});		
			
	});

});
            
function obtenerServicios(serv) {
          	
     console.log(serv);
     
	 var cats = $("#catsel");
	 
	 $("#catsel").empty();
	 $("#catsel").append("<option value='0'>--Selecciona--</option>");
	 
	 $.each(serv, function(i,o) {
		 
		 var v = $("<option value='" + o.id + "'>" + o.nombre + "</option>");
		 cats.append(v);	
	 });
	 	 	 	 
	 cats.change(function() {
		 actualiza($(this),serv);		 
	 });
	 
	 var list = $("<ol id='listaServsRegistro' name='listaServsRegistro'>");
	 
	 var servs = $("#sersel");
	 
	 
	 servs.change(function() {
		 
		 var li = $("<li>");
		 
		 var posicion=document.getElementById("sersel").options.selectedIndex; //posicion
		 
		 li.append("<strong>Seleccionado: </strong>" + document.getElementById("sersel").options[posicion].text + " <span onclick='eliminar(this)'>X</span>");
		 
		 list.append(li);
		 		 	 
	 });
		 
	 var servsSelec = $("#servicios-selec");	 
	 
	 servsSelec.append(list);
	 	 
 }
            
 function actualiza(que,serv) {
	 
	 var bueno;
	 var buscado = que.val();
	 var servs;
	 
	 $.each(que.children(), function (i, o){
		 
		var selec = parseInt($(o).val());
		
		selec = selec + 1;
		
		if (selec == buscado){
			
			bueno = i;
			
			servs = document.getElementById("sersel");
			
			if ( servs.hasChildNodes() ){
				while ( servs.childNodes.length >= 1 )
				{
					servs.removeChild( servs.firstChild );
				}
			}
			
			servs = $("#sersel");
			
			$("#sersel").empty();
			$("#sersel").append("<option value='0'>--Selecciona--</option>");
			
			console.log(serv[bueno].valores);
								
			$.each(serv[bueno].valores, function(a,u) {
			 	var s = $("<option value='" + u.id + "'>" + u.nombre + "</option>");
			 	servs.append(s);
			 });
			 
		} 
		
	 });
	 	 	 	 
 }
 
 /**
  * Funcion para eliminar los elementos
  * Tiene que recibir el elemento pulsado
  */
  
  /*
 function eliminar(elemento)
 {
     var id=elemento.parentNode.getAttribute("id");
     node=document.getElementById(id);
     node.parentNode.removeChild(node);
 }
 */
</script>


<div id="cuerpo" class="container">
		
				<div class="col-md-12" align="center">
					<h1><strong>REGISTRO</strong></h1>
				</div>
				
			<form action="nuevoRegistro" id="form-registro" name="form-registro" enctype="multipart/form-data" class="form-horizontal" role="form" method="post">	
				
				<div class="col-md-12">	
				
					<div id="col-iz-registro" class="col-md-6">
						  						  
						  <div class="form-group">
						    <label for="AliasRegistro" class="col-sm-2 control-label">Alias</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="AliasRegistro">
						    </div>
						  </div>									
						  <div class="form-group">
						    <label for="NombreRegistro" class="col-sm-2 control-label">Nombre</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="NombreRegistro">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="EdadRegistro" class="col-sm-2 control-label">Edad</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="EdadRegistro">
						    </div>
						  </div>
						 
						   <div class="form-group">
						    <label for="EmailRegistro" class="col-sm-2 control-label">E-mail</label>
						    <div class="col-sm-10">
						      <input type="text" class="form-control" name="EmailRegistro">
						    </div>
						  </div>
						  <div class="form-group">
						    <label for="ContraseniaRegistro" class="col-sm-2 control-label">Contraseña</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="ContraseniaRegistro" name="ContraseniaRegistro">
						    </div>
						  </div>
						  
						  <div class="form-group">
						    <label for="Contrasenia2Registro" class="col-sm-2 control-label">Verificar Contraseña</label>
						    <div class="col-sm-10">
						      <input type="password" class="form-control" id="Contrasenia2Registro" name="Contrasenia2Registro">
						    </div>
						  </div>
						  
												  
						  
					      <div id="servicios-registro" class="col-md-12">
						 		
						 		<h4><strong>Mis Servicios</strong></h4>
						
								<p style="margin-bottom: -5px;">Seleccione sus habilidades/capacidades:</p>
								
								<div>
								
									
									<div id="anadir-servicio" class="col-md-12">
									
											<div class="col-md-5">
											
												<div align="center" style="margin-bottom: 1%"><strong>Categorias</strong></div>
											
												 <select id="catsel" name="categoria" class="form-control">
												 												  
												</select>
												
											</div>
											
											<div class="col-md-7">
											
												<div align="center" style="margin-bottom: 1%"><strong>Servicios</strong></div>
											
												<select id="sersel" name="servicio" class="form-control">
																							  
												</select>
												
											</div>
											
											<div id="servicios-selec" class="col-md-12">
												<!--  <h5 id="serv-selec"><strong></strong></h5>-->
											</div>
									
									</div>									
																	
								</div>
								
								
							
							  <div class="col-md-12">	
							  	<h5>Si realiza otro servicio de los predeterminados, añada su/s servicio/s:</h5>
							  	
							  	<div class="form-group">
								    <label for="inputTitulo3" class="col-sm-2 control-label">Titulo</label>
								    <div class="col-sm-10">
								      <input type="text" class="form-control" id="inputTitulo3">
								    </div>
								</div>
								
								<div class="form-group">
								    <label for="inputCategoria3" class="col-sm-2 control-label">Categoría</label>
								    <div class="col-sm-10">
								       <select class="form-control">
										  <option>Informática</option>
										  <option>Cocina</option>
										  <option>Limpieza</option>
										  <option>Mudanzas</option>
										  <option>Coches</option>
										</select>
								    </div>
								</div>
								
								<label for="inputDescripcion3" class="col-sm-2 control-label">Descripción</label>
								<textarea class="form-control" rows="6"></textarea>
							  								  								  	
							  </div>
						
						  </div>  
						  										
					</div>
					
					<div class="col-md-6" id="col-dr-registro">
					
					  <div class="col-md-12" align="left">
					  
						  	<div class="form-group">
							    <label for="fotoPerfil">Foto Perfil</label>
							    
							    <input name="fotoRegistro" type="file" id="fotoPerfil">
						    </div>
					  </div>
					
					  <div align="center">
					  
						<h3><strong>Mi Localización</strong></h3>
							
							<div class="form-group">
								<label for="direccion" class="col-sm-2 control-label">Direcci&oacute;n</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="direccion" name="direccion" value=""/> 
								</div>
								<button class="btn btn-primary" id="boton-pasar-direccion-mapa">Insertar Dirección en Mapa</button>
							</div>	 
								<!-- div donde se dibuja el mapa-->
								<div id="mapa-registro" class="col-md-12"></div>
								 
								<!--campos ocultos donde guardamos los datos-->
								<input type="hidden" name="lat" id="lat"/>
								<input type="hidden" name="lng" id="long"/>
					   </div>
					   
					</div>
									
				</div>	
				
				<div id="botones-registro" class="col-sm-12" align="center">
			      <button type="submit" class="btn btn-lg btn-success">Aceptar</button>
			      <button type="reset" class="btn btn-lg btn-danger">Cancelar</button>
			    </div>
		    
		    </form>		
									
		 </div>
	 
<%@ include file="../fragments/footer.jspf" %>