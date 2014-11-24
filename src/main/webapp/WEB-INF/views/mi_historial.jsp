<%@ include file="../fragments/header.jspf" %> 

<div id="cuerpo" class="container">

<c:choose>
	
      <c:when test="${empty usuario}">
     
     	<div class="col-md-12">
     		<h3><strong>Necesitas estar registrado para poder visitar tu historial. Hazlo más arriba!</strong></h3>
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
							 			<th>Fecha</th>
							 			<th>Valoración</th>
							 		</tr>
							 		
							 	</thead>
							 	
							 	<tbody>
							 		<tr>
							 			<td>Pepe</td>
							 			<td>Arreglar enchufe</td>
							 			<td>Juan</td>
							 			<td>Programacion en java</td>
							 			<td>10/10/14</td>
							 			<td>7/10</td>
							 		
							 		</tr>
							 		<tr>
							 			<td>Pepe</td>
							 			<td>Arreglar enchufe</td>
							 			<td>Juan</td>
							 			<td>Programacion en java</td>
							 			<td>10/10/14</td>
							 			<td>7/10</td>
							 		
							 		</tr>
							 		<tr>
							 			<td>Pepe</td>
							 			<td>Arreglar enchufe</td>
							 			<td>Juan</td>
							 			<td>Programacion en java</td>
							 			<td>10/10/14</td>
							 			<td>7/10</td>
							 		
							 		</tr>
							 		
							 	
							 	</tbody>
							 	
							</table>
							
				
				</div>
							
	</c:otherwise>
	
	</c:choose>					
			
</div>
		 
  <%@ include file="../fragments/footer.jspf" %>	