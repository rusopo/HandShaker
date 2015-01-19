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

				<h2 align="center"><strong>Mis Ofertas Recibidas</strong></h2>
  
				<ul id="lista-ofertas">
				
				<c:choose>
					<c:when test="${empty usuario}">
						No tienes Ofertas .
					</c:when>
					<c:otherwise>
						<%int contador1=1; %>
						<c:forEach items="${listaOfertasRecibidasUsuario}" var ="o">
								<li>
								<c:if test="${o.negociacion.aceptada eq false }">
										<div class="col-md-12">
										
												<div class="panel panel-primary">
													  <div class="panel-heading">
													  
													    <h3 class="panel-title"><strong> #<%=contador1%> OFERTA DE ${o.usuarioEnvia.nombre} HACIA ${o.usuarioRecibe.nombre}</strong></h3>
													    </div>
													  
													  	
														  <div class="panel-body">
														    	
														     <div class="col-md-6">
														     
														     	<h4><strong>Te Ofrece:</strong></h4><p>${o.servicio_solicitado.nombre}</p>
														    	<h4><strong>Por:</strong></h4> <p> ${o.servicio_ofrecido.nombre}</p>
														    	
														     </div>
														     <div class="col-md-6">
														     	<div id="boton-ofertas">
														     	 	<form action="${prefix}negociacion" method="GET">
														     			  <input type= "hidden" name ="idNegociacionNombre" value = "${o.negociacion.id_negociacion}"  >  
														    		</form>	
															     		  <a href="${prefix}negociacion/${o.negociacion.id_negociacion}"   class="btn btn-success btn-lg"><strong>Negociar Oferta</strong></a>
															     		  					     		
														     	</div>
														     	<div>
																	<button  class="btn btn-danger btn-lg"><strong>Rechazar Oferta</strong></button>
																</div>
														     </div>
														    	
														  </div>
														  
													 
												 </div>									 		
										</div>
									</c:if>			
								</li>
								<%contador1++; %>
							</c:forEach>
						</c:otherwise>
						</c:choose>	
					</ul>
					
				  </div>
				  
				  <div class="col-md-6">

				<h2 align="center"><strong>Mis Ofertas Enviadas</strong></h2>

				<ul id="lista-ofertas">
				
				<c:choose>
						
					<c:when test="${empty usuario}">
						No tienes Ofertas .
					</c:when>
					<c:otherwise>
						<%int contador2=1; %>
						<c:forEach items="${listaOfertasEnviadasUsuario}" var ="o">
								<li>
										<div class="col-md-12">
										
												<div class="panel panel-primary">
													  <div class="panel-heading">
													    <h3 class="panel-title"><strong>#<%=contador2%> OFERTA DE ${o.usuarioEnvia.nombre} HACIA ${o.usuarioRecibe.nombre} </strong></h3>
													    
													  </div>
													  <div class="panel-body">
													    	
													     <div class="col-md-6">
													     
													     	<h4><strong>Ofrezco:</strong></h4><p>${o.servicio_solicitado.nombre}</p>
											     	
													    	<h4><strong>Por:</strong></h4> <p> ${o.servicio_ofrecido.nombre}</p>
													    	
													     </div>
													     <div class="col-md-6">
													     	<div id="boton-ofertas">
													     		<form action="${prefix}negociacion" method="GET">
													     		<input type= "hidden" name ="idNegociacionNombre" value = "${o.negociacion.id_negociacion}"  >  
													    		</form>	
														     		  <a href="${prefix}negociacion/${o.negociacion.id_negociacion}" class="btn btn-success btn-lg"><strong>Negociar Oferta</strong></a>
														     		
													     	</div>
													     	<div>
																<button  class="btn btn-danger btn-lg"><strong>Rechazar Oferta</strong></button>
															</div>
													     </div>
													    	
													  </div>
												 </div>									 		
										</div>		
								</li>
								<%contador2++; %>
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