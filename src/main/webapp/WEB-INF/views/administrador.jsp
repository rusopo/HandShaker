<%@ include file="../fragments/header.jspf" %>

<div id="cuerpo" class="container">
							
			<div id="panel-administrador" class="col-md-12">
				
				<div id="panel-botones-admin">
												
					<!-- Nav tabs -->
					<ul class="nav nav-pills" role="tablist" id="myTab">
					  <li role="presentation" class="active"><a href="#panel-admin-usuarios" role="tab" data-toggle="tab">Usuarios</a></li>
					  <li role="presentation"><a href="#panel-admin-servicios" role="tab" data-toggle="tab">Servicios</a></li>
					  <li role="presentation"><a href="#panel-admin-negociaciones" role="tab" data-toggle="tab">Negociaciones</a></li>
					</ul>
					
				</div>			
											
					<!-- Tab panes -->
					<div class="tab-content">
					
					
				         <div role="tabpanel" class="tab-pane active" id="panel-admin-usuarios">
							
							<table id="tabla-administracion" class="table">
							 	<thead>
							 		<tr>
							 			<th>id_usuario</th>
							 			<th>alias</th>
							 			<th>nombre</th>
							 			<th>habilidades</th>
							 			<th>Intereses</th>
							 		</tr>
							 	</thead>      
				      		      
				      		    <tbody>
				      		    <c:choose>
				      		       <c:when test="${not empty usuario}">
										<c:forEach items="${lista_todos_usuarios}" var="u">
											<tr>
											<td>id_usuario</td>
											<td>${u.alias}</td>	
											<td>${u.nombre}</td>
											<td>mis habilidades</td>
											<td>mis intereses</td>
										    </tr>			
										</c:forEach>
									</c:when>
									<c:otherwise>
										No tiene servicios.
									</c:otherwise>
								</c:choose> 
				      		    </tbody>  
				      		      
				         	   </table>
					  		     
					  		    
				  	     </div>
					  		     
					  		    
				  
				  	     <div role="tabpanel" class="tab-pane" id="panel-admin-servicios">
				  		       <table id="tabla-administracion" class="table">
							 	<thead>
							 		<tr>
							 			<th>id_servicio</th>
							 			<th>nombre</th>
							 			<th>categoria</th>
							 			<th>descripcion</th>
							 			
							 		</tr>
							 	</thead>      
				      		      
				      		    <tbody>
				      		    <c:choose>
				      		       <c:when test="${not empty usuario}">
										<c:forEach items="${lista_todos_servicios}" var="s">
											<tr>
											<td>id_servicio</td>	
											<td>${s.nombre}</td>
											<td>${s.categoria.nombreCategoria}</td>
											<td>${s.descripcion}</td>
										    </tr>			
										</c:forEach>
									</c:when>
									<c:otherwise>
										No tiene servicios.
									</c:otherwise>
								</c:choose> 
				      		    </tbody>  
				      		      
				         	   </table>
				  		       
				  		  
				  		        
				  	     </div>
				  	     
				  	     <div role="tabpanel" class="tab-pane" id="panel-admin-negociaciones">
				                <%@ include file="../fragments/administrador/negociaciones_admin.jspf" %>
				  	     </div>
				  
				   </div>									
		
		</div>
							
</div>
		 
<%@ include file="../fragments/footer.jspf" %>