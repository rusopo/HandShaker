<%@ taglib  uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" prefix="e" %>
<%@ include file="../fragments/header.jspf" %> 

<div id="cuerpo" class="container">
							
	<div id="cuerpo-ofertas" class="col-md-12">	
				
				 <div class="col-md-6">

				<h2 align="center">Mis Ofertas Recibidas</h2>
  
				<ul id="lista-ofertas">
				
				<c:choose>
					<c:when test="${empty usuario}">
						No tienes Ofertas .
					</c:when>
					<c:otherwise>
						<c:forEach items="${listaOfertasRecibidasUsuario}" var ="o">
								<li>
										<div class="col-md-12">
										
												<div class="panel panel-primary">
													  <div class="panel-heading">
													    <h3 class="panel-title"> #1 OFERTA DE ${o.usuarioEnvia.nombre} HACIA ${o.usuarioRecibe.nombre}</h3>
													    </div>
													  <div class="panel-body">
													    	
													     <div class="col-md-6">
													     
													     	<h4>Te Ofrece:</h4><p>${o.servicio_solicitado.nombre}</p>
													    	<h4>Por:</h4> <p> ${o.servicio_ofrecido.nombre}</p>
													    	
													     </div>
													     <div class="col-md-6">
													     	<div id="boton-ofertas">
													     	 	<form action="negociacion.jsp" method="GET">
													     		<input type= "hidden" name ="id_negociacionNombre" value = "${o.negociacion.id_negociacion}"  >  
													    		</form>	
														     		  <a href="negociacion?id_negociacionNombre=${o.negociacion.id_negociacion}"   class="btn btn-success btn-lg"  >Negociar Oferta</a>
														     		<!--	
														     		 <a href="negociacion."  id= "boton-negociacion" class="btn btn-success btn-lg"  >Negociar Oferta</a>
														     	-->
													     		
													     		
													     <!--		<form action="servicio" method="get">
									    			<input type="hidden" name="id_servicio" value="${s.id_servicio}">
									    		</form>								    	
									    		<a href="servicio?id_servicio=${s.id_servicio}">${s.nombre}</a>	-->
													     	</div>
													     	<div>
																<button  class="btn btn-danger btn-lg">Rechazar Oferta</button>
															</div>
													     </div>
													    	
													  </div>
												 </div>									 		
										</div>
												
								</li>
							</c:forEach>
						</c:otherwise>
						</c:choose>	
					</ul>
					
				  </div>
				  
				  <div class="col-md-6">

				<h2 align="center">Mis Ofertas Enviadas</h2>

				<ul id="lista-ofertas">
				
				<c:choose>
						
					<c:when test="${empty usuario}">
						No tienes Ofertas .
					</c:when>
					<c:otherwise>
						<c:forEach items="${listaOfertasEnviadasUsuario}" var ="o">
								<li>
										<div class="col-md-12">
										
												<div class="panel panel-primary">
													  <div class="panel-heading">
													    <h3 class="panel-title">#1 OFERTA DE ${o.usuarioEnvia.nombre} HACIA ${o.usuarioRecibe.nombre} </h3>
													    
													  </div>
													  <div class="panel-body">
													    	
													     <div class="col-md-6">
													     
													     	<h4>Ofrezco:</h4><p>${o.servicio_solicitado.nombre}</p>
											     	
													    	<h4>Por:</h4> <p> ${o.servicio_ofrecido.nombre}</p>
													    	
													     </div>
													     <div class="col-md-6">
													     	<div id="boton-ofertas">
													     		<button id= "boton-negociacion" class="btn btn-success btn-lg">Negociar Oferta</button>
													     	</div>
													     	<div>
																<button  class="btn btn-danger btn-lg">Rechazar Oferta</button>
															</div>
													     </div>
													    	
													  </div>
												 </div>									 		
										</div>		
								</li>
							</c:forEach>
						</c:otherwise>
						</c:choose>	
					</ul>
				  </div>
				  
				  
				</div>			
	
	<div id="dialogo" class="ventana" title= "Negociacion de la oferta de Juan">
		
	
			
				<div class="col-md-2"></div>
				
				<div class="col-md-8">
					
					<div class="col-md-12">	
					
						<div id="user1" class="col-md-12">
							<div class="col-md-2">
							 
								PEPE
							</div>
							<div class="col-md-10">
							 
								<textarea class="form-control" rows="4"></textarea>
								
								<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
							</div>
							
						</div>
						
						<div class="col-md-12">
						
							<div class="col-md-2"></div>
							<div id="user2" class="col-md-10">
							
								<div class="col-md-2">
								 	JUAN
								</div>
								<div class="col-md-10">
								 
									<textarea class="form-control" rows="4"></textarea>		
																
									<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
								</div>
							</div>
						</div>
						
					
					</div>
					
					<div class="col-md-12">	
					
						<div id="user1" class="col-md-12">
							<div class="col-md-2">
							 
								PEPE
							</div>
							<div class="col-md-10">
							 
								<textarea class="form-control" rows="4"></textarea>
								
								<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
							</div>
							
						</div>
						
						<div class="col-md-12">
						
							<div class="col-md-2"></div>
							<div id="user2" class="col-md-10">
							
								<div class="col-md-2">
								 	JUAN
								</div>
								<div class="col-md-10">
								 
									<textarea class="form-control" rows="4"></textarea>		
																
									<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
								</div>
							</div>
						</div>
						
					
					</div>
					
					</div>			
			
			
			
			<div id="botones-negociacion" class="col-md-12" align="center">
				<button type="submit" class="btn btn-success btn-lg">Aceptar</button>
				<button type="reset" class="btn btn-danger btn-lg">Cancelar</button>
			
			</div>			
			
</div>					
				
 </div>
		 
<%@ include file="../fragments/footer.jspf" %>