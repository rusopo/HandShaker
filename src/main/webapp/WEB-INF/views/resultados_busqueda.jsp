<div id="resultados_busqueda_total">
				
					<div id="resultados_busqueda" class="col-md-12">
					
						<ul class="lista-busqueda">
						
						<c:forEach items="${ListarPorCategoria}" var="s">
					
							<li>
																																
								 <div class="col-md-12">
									<div class="panel panel-primary">
									  <div class="panel-heading">
									    <h3 class="panel-title">
									    <c:choose>
									    	<c:when test="${not empty usuario}">
									    		
									    		<form action="servicio" method="get">
									    			<input type="hidden" name="id_servicio" value="${s.id_servicio}">
									    		</form>								    	
									    		<a href="servicio/${s.id_servicio}">${s.nombre}</a>								    	
									    	</c:when>
									    	<c:otherwise>
									    		${s.nombre}
									    	</c:otherwise>
									    </c:choose>
									    </h3>
									  </div>
									  <div class="panel-body">
									  	
									  	<div class="col-md-12">
									  		
									  		<div class="col-md-10">
									  			${s.descripcion}
									  		</div>
									  		
									  		<div class="col-md-2" align="center">
									  			<div class="icono-usuarios">
							          				<img src="resources/images/usuario.jpg" height="60px" width="90px" />						          				 	
							          			</div>
							          			<div>
							          				<h5><strong>X Usuarios</strong></h5>
							          			</div>
									  		</div>
									  	
									  	</div>
									  	
									    
									  </div>
									 </div>
									 
								</div>
								
							</li>
							
							</c:forEach>
																		
						</ul>
					
					</div>	
					
					<div id="paginacion" class="col-md-12" align="center">
					
						<ul class="pagination">
						  <li class="disabled"><a href="#">&laquo;</a></li>
	  					  <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
						  <li><a href="#">2</a></li>
						  <li><a href="#">3</a></li>
						  <li><a href="#">4</a></li>
						  <li><a href="#">5</a></li>
						  <li><a href="#">&raquo;</a></li>
						</ul>
					
					</div>		
						
			</div>