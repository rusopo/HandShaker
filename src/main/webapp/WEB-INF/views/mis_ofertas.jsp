<%@ include file="../fragments/header.jspf" %> 

<div id="cuerpo" class="container">

<c:choose>
	
      <c:when test="${empty usuario}">
     
     	<div class="col-md-12">
     		<h3><strong>Necesitas estar registrado para poder visitar tus ofertas. Hazlo m&aacute;s arriba!</strong></h3>
     	</div>
      </c:when>

      <c:otherwise>
							
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
								<c:if test="${o.negociacion.aceptada eq false }">
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
															     		
														     	</div>
														     	<div>
																	<button  class="btn btn-danger btn-lg">Rechazar Oferta</button>
																</div>
														     </div>
														    	
														  </div>
														  
													 
												 </div>									 		
										</div>
									</c:if>			
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
													     		<form action="negociacion.jsp" method="GET">
													     		<input type= "hidden" name ="id_negociacionNombre" value = "${o.negociacion.id_negociacion}"  >  
													    		</form>	
														     		  <a href="negociacion?id_negociacionNombre=${o.negociacion.id_negociacion}"   class="btn btn-success btn-lg"  >Negociar Oferta</a>
														     		
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
				
		</c:otherwise>
	
	</c:choose>							
				
 </div>
		 
<%@ include file="../fragments/footer.jspf" %>