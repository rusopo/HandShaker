<%@ include file="../fragments/header.jspf" %>

<script>
$(function(){	
	$(".botonOfertaRechazada").click(function () {
		$("#dialogRechazarOferta").dialog({
		      resizable: false,
		      height:175,
		      width:350,
		      modal: true,
		      buttons: {		    	  
		        "SI": function() {			        	
	        	  var id = $(".botonOfertaRechazada").attr("id").substring("botonOfertaRechazada_".length);
		        	$.ajax({			    	
				    	type: "POST",
				    	url: "${prefix}negociacionCancelada",
				    	data:{ IDNegociacion: id},
				    	success:function(data){					 					      		
				    	}
				    });
		        	
		    		$(this).dialog("close");
		            
		            $("#dialogRechazada").dialog({
		            	resizable: false,
					    height:175,
					    width:360,
					    modal: true,
		                open: function() {
		                	$(".ui-dialog-titlebar-close").hide();
		                    var foo = $(this);
		                    setTimeout(function() {
		                       foo.dialog('close');
		                       window.location.href = "${prefix}mis_ofertas";
		                    }, 3000);		                    			                    
		                }
		            });			        				    		
		        },
		        
		        "NO": function() {
		          $(this).dialog("close");
		        }
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
					<strong>Necesitas estar registrado para poder visitar tus
						ofertas. Hazlo m&aacute;s arriba!</strong>
				</h3>
			</div>
		</c:when>
		<c:otherwise>
			<div id="cuerpo-ofertas" class="col-md-12">
				<div class="col-md-6">
					<h2 align="center">
						<strong>Mis Ofertas Recibidas</strong>
					</h2>
					<ul id="lista-ofertas">
						<c:choose>
							<c:when test="${contadorOfertasRecibidas eq 0}">
								<div align="center" class="alert alert-danger" role="alert">
									<h4>
										<strong>No tienes Ofertas Recibidas</strong>
									</h4>
								</div>
							</c:when>
							<c:otherwise>
								<%
									int contador1 = 1;
								%>
								<c:forEach items="${listaOfertasRecibidasUsuario}" var="o">
									<li><c:if test="${o.negociacion.aceptada eq false }">
											<div class="col-md-12">
												<div class="panel panel-primary">
													<div class="panel-heading">
														<h3 class="panel-title">
															<strong> #<%=contador1%> OFERTA DE
																${o.usuarioEnvia.nombre} HACIA ${o.usuarioRecibe.nombre}
															</strong>
														</h3>
													</div>
													<div class="panel-body">
														<div class="col-md-6">
															<h4>
																<strong>Te Ofrece:</strong>
															</h4>
															<p>${o.servicio_solicitado.nombre}</p>
															<h4>
																<strong>Por:</strong>
															</h4>
															<p>${o.servicio_ofrecido.nombre}</p>
														</div>
														<div class="col-md-6">
															<div id="boton-ofertas">
																<form action="${prefix}negociacion" method="GET">
																	<input type="hidden" name="idNegociacionNombre"
																		value="${o.negociacion.id_negociacion}">
																</form>
																<a href="${prefix}negociacion/${o.negociacion.id_negociacion}"
																	class="btn btn-success btn-lg"><strong>Negociar
																		Oferta</strong></a>
															</div>
															<div>
																<button
																	id="botonOfertaRechazada_${o.negociacion.id_negociacion}"
																	class="botonOfertaRechazada btn btn-danger btn-lg">
																	<strong>Rechazar Oferta</strong>
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:if></li>
									<%
										contador1++;
									%>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
				<div class="col-md-6">
					<h2 align="center">
						<strong>Mis Ofertas Enviadas</strong>
					</h2>
					<ul id="lista-ofertas">
						<c:choose>
							<c:when test="${contadorOfertasEnviadas eq 0}">
								<div align="center" class="alert alert-danger" role="alert">
									<h4>
										<strong>No tienes Ofertas Enviadas</strong>
									</h4>
								</div>
							</c:when>
							<c:otherwise>
								<%
									int contador2 = 1;
								%>
								<c:forEach items="${listaOfertasEnviadasUsuario}" var="o">
									<li>
										<div class="col-md-12">

											<div class="panel panel-primary">
												<div class="panel-heading">
													<h3 class="panel-title">
														<strong>#<%=contador2%> OFERTA DE
															${o.usuarioEnvia.nombre} HACIA ${o.usuarioRecibe.nombre}
														</strong>
													</h3>
												</div>
												<div class="panel-body">
													<div class="col-md-6">
														<h4>
															<strong>Ofrezco:</strong>
														</h4>
														<p>${o.servicio_solicitado.nombre}</p>

														<h4>
															<strong>Por:</strong>
														</h4>
														<p>${o.servicio_ofrecido.nombre}</p>
													</div>
													<div class="col-md-6">
														<div id="boton-ofertas">
															<form action="${prefix}negociacion" method="GET">
																<input type="hidden" name="idNegociacionNombre"
																	value="${o.negociacion.id_negociacion}">
															</form>
															<a
																href="${prefix}negociacion/${o.negociacion.id_negociacion}"
																class="btn btn-success btn-lg"><strong>Negociar
																	Oferta</strong></a>
														</div>
														<div>
															<button
																id="botonOfertaRechazada_${o.negociacion.id_negociacion}"
																class="botonOfertaRechazada btn btn-danger btn-lg">
																<strong>Rechazar Oferta</strong>
															</button>
														</div>
													</div>
												</div>
											</div>
										</div>
									</li>
									<%
										contador2++;
									%>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<div id="dialogRechazarOferta" title="Oferta Rechazada"
	style="display: none">
	<strong>&iquest;Est&aacute;s seguro que quieres rechazar esta
		oferta?</strong>
</div>
<div id="dialogRechazada" title="Oferta Rechazada" style="display: none">
	<h4>
		<strong>La oferta ha sido rechazada</strong>
	</h4>
	<br />
	<p>Este mensaje se cerrara en pocos segundos...</p>
</div>

<%@ include file="../fragments/footer.jspf" %>