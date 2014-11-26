     <%@ include file="../fragments/header.jspf" %> 
        		
		<div id="cuerpo" class="container">
					
				<div id="barra-buscador" class="col-md-12">	
				
					
					  <div class="col-md-5">
					    	<input type="text" class="form-control" name="texto-abuscar" id="texto-abuscar" placeholder="Escribe aquí">
						
					  </div>
					  
					  <div class="col-md-7">
					  
						  <div class="col-md-3" align="right">
							    <h4><label for="inputCategoria3" class="col-sm-2 control-label"><strong>Categoría</strong></label></h4>
			 
						 </div>
						 
						 <div class="col-md-4" align="left">
						 
							 <select name="lista_categorias" id="lista_categorias" class="form-control">
							 
								 <c:forEach items="${listaCategorias}" var="c">
									  <option value="${c.id_categoria}">${c.nombreCategoria}</option>								 
								  </c:forEach>
								  
							</select>
						
						</div>
						 
						   <div class="col-md-5" align="left">
						  	<button id="boton-buscar-index" class="btn btn-lg btn-primary">Buscar</button>
						  </div>
						  
					  </div>
					
				</div>
				
				<div id="resultados_busqueda_total">
				
					<%@ include file="../views/resultadosBusqueda.jsp" %>
					
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
			
		 </div>
	 
<%@ include file="../fragments/footer.jspf" %>	 