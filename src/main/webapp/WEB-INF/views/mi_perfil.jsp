<%@ include file="../fragments/headerMiPerfil.jspf" %> 

<div id="cuerpo" class="container">

	<c:choose>
	
      <c:when test="${empty usuario}">
     
     	<div class="col-md-12">
     		<h3><strong>Necesitas estar registrado para poder visitar tu perfil. Hazlo m�s arriba!</strong></h3>
     	</div>
      </c:when>

      <c:otherwise>
      	
      	<div id="perfil-info-izq" class="col-md-3">	
				
					<div class="col-md-12">
								
						<div id="foto-perfil" class="col-md-12" align="center">
						
							<img src="mi_perfil/usuario?id_usuario=${usuario.id}" height="150px" width="130px"/>
						
						</div>
						<div id="datos-perfil" class="col-md-12">
							
							<h4><strong>Alias: </strong>${usuario.alias}</h4> 
							<h4><strong>Nombre: </strong>${usuario.nombre}</h4>
							<h4><strong>Correo electr�nico:</strong></h4> <h4>${usuario.email}</h4>
							<h4><strong>Edad: </strong> ${usuario.edad}</h4>
												
						</div>
					
					</div>
					
					<div class="col-md-12">
					
						<h3 class="h3-perfil" align="center">Valoración</h3>
						
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
								
								<c:when test="${not empty usuario } ">
									<c:forEach items="${listaInteresesUsusario} " var ="i">
										<li>${i.nombre}</li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									No tiene Intereses soso.
								</c:otherwise>
								</c:choose>
							</ol>
							
						</div>
					
					</div>
					
					<div id="perfil-info2" class="col-md-6">
						
						<h3 align="center" class="h3-perfil">Mi Ubicaci�n</h3>
						
						<form name="latLongOcultas" id="latLongOcultas" action="">
							<input type="hidden" id="latitud" name="latitud" value="${usuario.latitud}">
							<input type="hidden" id="longitud" name="longitud" value="${usuario.longitud}">
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