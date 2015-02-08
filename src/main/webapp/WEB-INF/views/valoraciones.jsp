<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../fragments/header.jspf"%>

<script>
	$(function(){	
		$(".botonValorar").click(function () {
			var idValoracion = $(this).attr("id").substring("botonValorar_".length);
			var botonPulsado= $(this);
			var puntuacion =  $(this).parent().find("#puntuacion").val();
			$.ajax({			    	
		    	type: "POST",
		    	url: "${prefix}gestionValoracion",
		    	data:{ idValoracion: idValoracion,
		    		puntuacion: puntuacion},	    		
		    	success:function(data){
		    		
		    		$("#dialogVotado").dialog({
		            	resizable: false,
					    height:175,
					    width:360,
					    modal: true,
		                open: function() {
		                	$(".ui-dialog-titlebar-close").hide();
		                    var foo = $(this);
		                    setTimeout(function() {
		                       foo.dialog('close');
		                       $(botonPulsado).parent().parent().parent().parent().remove();
		                    }, 3000);		                    			                    
		                }
		            });			      		
		    	}
		    });
		});
	});
</script>

<div id="cuerpo" class="container">

	<c:choose>
		<c:when test="${empty usuario}">
			<div class="col-md-12">
				<h3>
					<strong>Necesitas estar registrado para poder valorar</strong>
				</h3>
			</div>
		</c:when>
		<c:otherwise>

			<div class="col-md-12">
				<h3 align="center">
					<strong>Vota a los usuarios</strong>
				</h3>
				<br>
				<c:choose>
					<c:when test="${contValoraciones eq 0}">
						<h4>No tiene votaciones pendientes.</h4>
					</c:when>
					<c:otherwise>
						<ol id="listaValoraciones">
							<c:forEach items="${listaUsuariosAValorar}" var="v">
								<li>
									<div class="col-md-12">
										<div class="col-md-2">
											<h4>
												<strong>${v.usuarioValorado.alias}</strong>
											</h4>
										</div>
										<div class="col-md-10">
											<div class="form-group" align="left">
												<h4 class="col-md-5">Insertar puntuacion del 1 al 10:</h4>
												<div class="col-md-2">
													<input type="text" id="puntuacion" class="form-control">
												</div>
												<button class="btn btn-info botonValorar"
													id="botonValorar_${v.id}">Valorar</button>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</ol>
					</c:otherwise>
				</c:choose>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<div id="dialogVotado" title="Votacion efectuada" style="display: none">Su votacion ha sido efectuada. Gracias!</div>

<%@ include file="../fragments/footer.jspf"%>