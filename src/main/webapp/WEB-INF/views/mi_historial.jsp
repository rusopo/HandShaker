<%@ include file="../fragments/header.jspf" %> 

<div id="cuerpo" class="container">

<c:choose>
	
      <c:when test="${empty usuario}">
     
     	<div class="col-md-12">
     		<h3><strong>Necesitas estar registrado para poder visitar tu historial. Hazlo m&aacute;s arriba!</strong></h3>
     	</div>
      </c:when>

      <c:otherwise>
					
				<div class="col-md-12">	
					
						<table class="table table-striped">
							 	<thead>
							 		<tr>
							 			<th>Usuario</th>
							 			<th>Ofrece</th>
							 			<th>Usuario</th>
							 			<th>Recibe</th>
							 		</tr>
							 		
							 	</thead>
							 	
							 	<tbody>
							 	
							 	<c:forEach items="${listaOfertasAceptadas}" var ="o">
							 		<tr>
							 			<td>${o.usuarioEnvia.nombre}</td>
							 			<td>${o.servicio_solicitado.nombre}</td>
							 			<td>${o.usuarioRecibe.nombre}</td>
							 			<td>${o.servicio_ofrecido.nombre}</td>
							 		</tr>
							 		</c:forEach>
							 								 	
							 	</tbody>
							 	
							</table>
							
				
				</div>
							
	</c:otherwise>
	
	</c:choose>					
			
</div>
		 
  <%@ include file="../fragments/footer.jspf" %>	