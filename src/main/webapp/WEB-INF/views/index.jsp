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
				
				<%@ include file="../views/resultados_busqueda.jsp" %>
			
		 </div>
	 
<%@ include file="../fragments/footer.jspf" %>	 