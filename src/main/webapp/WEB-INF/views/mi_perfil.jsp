<%@ taglib  uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" prefix="e" %>

<%@ include file="../fragments/headerMiPerfil.jspf" %> 

<div id="cuerpo" class="container">

	<c:choose>
	
      <c:when test="${empty usuario}">
     
     	<div class="col-md-12">
     		<h3><strong>Necesitas estar registrado para poder visitar tu perfil. Hazlo mas arriba!</strong></h3>
     	</div>
      </c:when>

      <c:otherwise>
      	
      	<div id="perfil-info-izq" class="col-md-3">	
				
					<div class="col-md-12">
								
						<div id="foto-perfil" class="col-md-12" align="center">
						
							<img src="mi_perfil/usuario?id_usuario=${e:forHtmlContent(usuarioPerfil.id)}" height="150px" width="130px"/>
						
						</div>
						<div id="datos-perfil" class="col-md-12">
							
							<h4><strong>Alias: </strong>${e:forHtmlContent(usuarioPerfil.alias)}</h4> 
							<h4><strong>Nombre: </strong>${e:forHtmlContent(usuarioPerfil.nombre)}</h4>
							<h4><strong>Correo electronico:</strong></h4> <h4>${e:forHtmlContent(usuarioPerfil.email)}</h4>
							<h4><strong>Edad: </strong> ${e:forHtmlContent(usuarioPerfil.edad)}</h4>
												
						</div>
					
					</div>
					
					<div class="col-md-12">
					
						<h3 class="h3-perfil" align="center">Valoracion</h3>
						
						<div class="progress">
						  <div class="progress-bar" role="progressbar" aria-valuenow="7" aria-valuemin="0" aria-valuemax="10" style="width: 70%;">
						    7/10
						  </div>
						</div>
					
					</div>
									
				</div>	
				
				<div id="perfil-info-der" class="col-md-9">	
				
					<div id="perfil-info1" class="col-md-6">
					
						<div id="info-diponibilidad" class="col-md-12">
					
							<h3 align="center" class="h3-perfil">Mi Disponibilidad</h3>
													
							<div align="center">
							
								<!-- <div id="datepicker"></div> -->
								
								<table class="table table-bordered">
								
									<thead>
							 		<tr>
							 			<th></th>
							 			<th>L</th>
							 			<th>M</th>
							 			<th>X</th>
							 			<th>J</th>
							 			<th>V</th>
							 			<th>S</th>
							 			<th>D</th>
							 		</tr>
							 	</thead>      
				      		      
				      		    <tbody>
				      		    
				      		    	<tr>
				      		    		<td><strong>Mañana</strong></td>
				      		    		<td class="active"></td>
				      		    		<td class="danger"></td>
				      		    		<td class="danger"></td>
				      		    		<td class="active"></td>
				      		    		<td class="danger"></td>
				      		    		<td class="active"></td>
				      		    		<td class="danger"></td>				      		    						      		    	
				      		    	</tr>
				      		    	
				      		    	<tr>
				      		    		<td><strong>Tarde</strong></td>
				      		    		<td class="danger"></td>
				      		    		<td class="active"></td>
				      		    		<td class="danger"></td>
				      		    		<td class="active"></td>
				      		    		<td class="active"></td>
				      		    		<td class="active"></td>
				      		    		<td class="danger"></td>				      		    						      		    	
				      		    	</tr>
				      		    					      								
								</tbody>
 	
								</table>
								
							</div>
												
						</div>
						
						<div id="info-habilidades" class="col-md-12">
						
							<h3 align="center" class="h3-perfil">Mis Habilidades</h3>
							
						    <h5>Si realiza otro servicio de los predeterminados, añada su/s servicio/s:</h5>
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#nuevoServicio">
							  Añadir nuevo servicio
							</button>
							
							<!-- Modal -->
							<div class="modal fade" id="nuevoServicio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							  <div class="modal-dialog">
							  
							  <form action="">
							  
								    <div class="modal-content">
								    							    
								      <div class="modal-header">
								        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
								        <h4 class="modal-title" id="myModalLabel">Añadir nuevo servicio</h4>
								      </div>
								      
								      <div class="modal-body">
								  	
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
								       
								      
								      <div class="modal-footer">						
								        <button type="button" class="btn btn-primary">Añadir</button>
								      </div>
							      </div>
						      </form>
						    </div>					
						</div>
							
								<ol>
									<c:choose>
		
	      							<c:when test="${not empty usuario}">
										<c:forEach items="${listaServiciosUsuario}" var="s">
											<li>${s.nombre}</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										No tiene servicios.
									
									</c:otherwise>
									</c:choose>
									
								</ol>
								
							
						</div>
						
						<div id="info-intereses" class="col-md-12">
											
							<h3 align="center" class="h3-perfil">Mis Intereses</h3>
							
							
							<ol>
									<c:choose>
		
	      							<c:when test="${not empty usuario}">
										<c:forEach items="${listaInteresesUsuario}" var="s">
											<li>${s.nombre}</li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										No tiene intereses.
									
									</c:otherwise>
									</c:choose>
									
								</ol>
							
						</div>
					
					</div>
					
					<div id="perfil-info2" class="col-md-6">
						
						<h3 align="center" class="h3-perfil">Mi Ubicacion</h3>
						
						<form name="latLongOcultas" id="latLongOcultas" action="">
							<input type="hidden" id="latitud" name="latitud" value="${e:forHtmlContent(usuarioPerfil.latitud)}">
							<input type="hidden" id="longitud" name="longitud" value="${e:forHtmlContent(usuarioPerfil.longitud)}">
						</form>
					
						<div id="perfil-mapa"></div>
						
						<div align="center">
							
							<a href="mi_historial" class="btn btn-primary btn-lg">Historial</a>
						
						</div>
					
					</div>
					
				
				</div>			
						     
      </c:otherwise>
	</c:choose>
					
				
		 </div>
  <%@ include file="../fragments/footer.jspf" %>