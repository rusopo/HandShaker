 <%@ include file="../fragments/header.jspf" %>
 
<script>

$(document).ready(function(){
	
	$("input[class=checkUsuario]").change(function(){crearCajaOfrecerServicio(this)});
		
});

function crearCajaOfrecerServicio(t){
	
	console.log(t);
	
	var elem = $('.elementoListaOfrecerServicio');		
	var x = $(t).parent().find('a').text();
	$(elem).find("#nombre").text(x);
	
	console.log($(elem));
	
	if($("input[class=checkUsuario]").is(':checked')) {  
		$('#lista-usuarios-servicio').append($(elem));
    } else {  
    	$(elem).remove();
    }
	
	
}


</script>  

<div id="cuerpo" class="container">
					
				<div class="col-md-12">	
				
					<div id="cabecera-servicio" class="col-md-12">
					
						<div class="panel panel-primary">
						  <div class="panel-heading">
						    <h3 class="panel-title">${servicio.nombre}</h3>
						  </div>
						  <div class="panel-body">
						    ${servicio.descripcion}
						  </div>
					   </div>
											
					</div>
					
					<form role="form">
					
						<div id="cuerpo-servicio" class="col-md-12">
						
							<div id="cuerpo-servicio-top" class="col-md-12">
							
							 	<h3 align="center"><strong>USUARIOS</strong></h3>
							 	
								  <div class="panel panel-success">
								    <div class="panel-heading">
								      <h4 class="panel-title">					
								          Lista de usuarios que ofrecen el servicio						        
								      </h4>
								    </div>
								      <div class="panel-body">
								      
								      <c:choose>
										<c:when test="${empty listaUsuariosServicio}">
										
											<h4>Solo tu realizas este servicio.</h4>
										</c:when>
										
										<c:otherwise>
											<div class="checkbox">								      
									      	 <c:forEach items="${listaUsuariosServicio}" var="u">								      	 									      												    
												    <label>													  												  											     
												      <input class="checkUsuario" type="checkbox" value="${u.id}"><a href="mi_perfil?usuario=${u.id}">${u.alias}</a>												      												      
												    </label>											     											     
											  </c:forEach> 										  
										  	</div>
										
										</c:otherwise>
										
									</c:choose>
								      
								      	
								      </div>
								   
								  </div>	
								  					  					
							</div>
							
							<div id="cuerpo-servicio-bottom" class="col-md-12">
															
								<ol id="lista-usuarios-servicio">
								
								<!-- <li class="elementoListaOfrecerServicio">
								
								  <div class="col-md-6">
								  									  																		  
											<h4 id="nombre"></h4>
											<div>
											      <input class="checkOfrecerServicio" type="checkbox"> Ofrecer Servicio
											</div>
										
										
										<p>Seleccione servicio a ofrecer:</p>
										
										<div class="form-group">
										    <label for="inputCategoria3" class="col-sm-2 control-label">Categor&iacute;a</label>
										    <div class="col-sm-10">
      											<select name="categoriaServOfrecido" class="form-control">
									       		  <c:forEach items="${listaServiciosDeUsuario}" var="s">
													  <option>${s.categoria.nombreCategoria}</option>									
												   </c:forEach>
												</select>
									       
										    </div>
										</div>
										
										<div class="form-group">
										    <label for="inputCategoria3" class="col-sm-2 control-label">Servicio</label>
										    <div class="col-sm-10">
      											<select name="nombreServOfrecido" class="form-control">
									       		  <c:forEach items="${listaServiciosDeUsuario}" var="s">
													  <option>${s.nombre}</option>									
												   </c:forEach>
												</select>
									       
										    </div>
										</div>
									 
								  </div> 
							</li> -->
								
								
							<!--  
							<li>
								<div class="col-md-6">
								
									  
										<h4>Pepe</h4>
										
										<label>
										      <input type="checkbox">Ofrecer Servicio
										</label>
										
										<p>Seleccione servicio a ofrecer:</p>
										
										<div class="form-group">
										    <label for="inputCategoria3" class="col-sm-2 control-label">Categor�a</label>
										    <div class="col-sm-10">
										       <select class="form-control">
												  <option>Inform�tica</option>
												  <option>Cocina</option>
												  <option>Limpieza</option>
												  <option>Mudanzas</option>
												  <option>Coches</option>
												</select>
										    </div>
										</div>
										
										<div class="col-sm-12">
											<select class="form-control">
											  <option>Programacion Java</option>
											  <option>Programacion C++</option>
											  <option>Programacion Android</option>
											  <option>Programacion C</option>
											  <option>Programacion Web</option>
											</select>
										</div>
										
									  
									  </div>
									</li>-->
								 
								</ol>
							
							</div>
							
						</div>	
				
				
					<div id="botones-servicio" class="col-md-12" align="center">
						
						<button type="submit" class="btn btn-success">Realizar Peticion</button>
						<button type="reset" class="btn btn-danger">Cancelar Peticion</button>
						
					</div>
					
				</form>
				
			</div>			
						
			
		 </div>
		 
		 <%@ include file="../fragments/footer.jspf" %>