     <%@ include file="../fragments/header.jspf" %> 
        		
		<div id="cuerpo" class="container">
					
				<div id="barra-buscador" class="col-md-12">	
				
					<form id="form-busqueda-index" name="form-busqueda-index" action="busquedaIndex" class="form-inline" role="form" method="post">
					
					  <div class="col-md-5">
					    	<input type="text" class="form-control" name="texto-abuscar" id="texto-abuscar" placeholder="Escribe aquí">
						
					  </div>
					  
					  <div class="col-md-7" align="left">
					  
						  <div class="form-group">
							    <h4><label for="inputCategoria3" class="col-sm-2 control-label"><strong>Categoría</strong></label></h4>
			 
						 </div>
						 
						 <select name="lista_categorias" id="lista_categorias" class="form-control">
						 
							 <c:forEach items="${listaCategorias}" var="c">
								  <option value="${c.id_categoria}">${c.nombreCategoria}</option>								 
							  </c:forEach>
							  
						</select>
						 
						   <div class="form-group">
						  	<button id="boton-buscar-index" type="submit" class="btn btn-lg btn-primary">Buscar</button>
						  </div>
						  
					  </div>
					</form>
				</div>
				
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
								    		<a href="servicio?id_servicio=${s.id_servicio}">${s.nombre}</a>								    	
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
				
				<div class="col-md-12" align="center">
				
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
	 
<%@ include file="../fragments/footer.jspf" %>	 