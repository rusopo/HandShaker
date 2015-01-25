<%@ include file="../fragments/header.jspf" %> 

<script type="text/javascript">
		  
		  $(document).ready(function(){
			  
		  	 $("#boton-buscar-index").click(function(){		  		 
		  		var textoAbuscar =  $('#texto-abuscar').val();
		  		var categoria = $('#lista_categorias').val();
		  		
			    $.ajax({			    	
			    	type: "POST",
			    	url: "${prefix}busquedaIndex",
			    	data:{ categoria: categoria,
			    		textoBuscado: textoAbuscar},
			    	success:function(data){
			      		$("#resultados_busqueda").html(data);			      		
			    	}
			    });
		  	});
		  	 
		  	$("#lista_categorias").change(function(){		  		 
		  		var textoAbuscar =  $('#texto-abuscar').val();
		  		var categoria = $('#lista_categorias').val();
		  		
			    $.ajax({			    	
			    	type: "POST",
			    	url: "${prefix}busquedaIndex",
			    	data:{ categoria: categoria,
			    		textoBuscado: textoAbuscar},
			    	success:function(data){
			      		$("#resultados_busqueda").html(data);
			      		
			    	}
			    });
		  	});
		  	
		});
		  
 </script>

<div id="cuerpo" class="container">
	<div id="barra-buscador" class="col-md-12">
		<div class="col-md-5" id="textoBuscado">
			<input type="text" class="form-control" name="texto-abuscar"
				id="texto-abuscar" placeholder="Escribe aqu&iacute;">
		</div>
		<div class="col-md-7">
			<div class="col-md-3" align="right">
				<h4>
					<label for="inputCategoria3" class="col-sm-2 control-label"><strong>Categor&iacute;a</strong></label>
				</h4>
			</div>
			<div class="col-md-4" align="left" id="categoriaSeleccionadaIndex">
				<select name="lista_categorias" id="lista_categorias"
					class="form-control">
					<option>-- Selecciona --</option>
					<c:forEach items="${listaCategorias}" var="c">
						<option value="${c.id_categoria}">${c.nombreCategoria}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-5" align="left">
				<button id="boton-buscar-index" class="btn btn-lg btn-primary">
					<strong><span class="glyphicon glyphicon-search"
						aria-hidden="true"></span> Buscar</strong>
				</button>
			</div>
		</div>
	</div>
	<div id="resultados_busqueda_total">
		<%@ include file="../views/resultadosBusqueda.jsp"%>
		<div id="paginacion" class="col-md-12" align="center">
			<ul class="pagination">
				<li class="disabled"><a href="#resultados_busqueda">&laquo;</a></li>
				<li class="active"><a href="#resultados_busqueda">1 <span
						class="sr-only">(current)</span></a></li>
				<li><a href="#resultados_busqueda">2</a></li>
				<li><a href="#resultados_busqueda">3</a></li>
				<li><a href="#resultados_busqueda">4</a></li>
				<li><a href="#resultados_busqueda">5</a></li>
				<li><a href="#resultados_busqueda">&raquo;</a></li>
			</ul>
		</div>
	</div>
</div>

<%@ include file="../fragments/footer.jspf" %>	 