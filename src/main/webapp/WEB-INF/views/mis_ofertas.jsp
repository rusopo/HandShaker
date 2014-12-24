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
													    <h3 class="panel-title"> #1 OFERTA DE ${o.usuario_receptor.nombre}</h3>
													    </div>
													  <div class="panel-body">
													    	
													     <div class="col-md-6">
													     
													     	<h4>Te Ofrece:</h4><p>${o.servicio_recibido.servicio_ofrecido.nombre}</p>
															
													    	<h4>Por:</h4> <p> Montar mueble</p>
													    	
													    	
													     </div>
													     <div class="col-md-6">
													     	<div id="boton-ofertas">
													     		
													     		<a href="negociacion" id= "boton-negociacion" class="btn btn-success btn-lg" name ="boton-negociacion" type ="negociar">Negociar Oferta</a>
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
													    <h3 class="panel-title">#1 OFERTA DE ${o.usuario.nombre}</h3>
													    
													  </div>
													  <div class="panel-body">
													    	
													     <div class="col-md-6">
													     
													     	<h4>Ofrezco:</h4><p>${o.servicio_recibido.nombre}</p>
											     	
													    	<h4>Por:</h4> <p> Montar mueble</p>
													    	
													     </div>
													     <div class="col-md-6">
													     	<div id="boton-ofertas">
													     	<form action="negociacion" method="POST">
													     		
													     		<input type= "submit"
													     		 <a href="negociacion" id= "boton-negociacion" class="btn btn-success btn-lg" name ="boton-negociacionRM" value ="1" >Negociar Oferta</a>
													     		/>
													     	</form>	
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
				
 </div>
		 
<%@ include file="../fragments/footer.jspf" %>