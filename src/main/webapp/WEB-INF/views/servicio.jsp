<%@ include file="../fragments/header.jspf"%>

<script>
	$(function() {
		
		if ($('#listosParaEnviar >tbody >tr').length == 0){
			var fila = $("<h4 id='noOfertas'>Listado de ofertas vacio</h4>");
			$("#ofertasListas").append(fila);
		}
		
		$("#bConfirma").click(preparaPeticion);
		//$("#listosParaEnviar").on("click", ".confirma_p", enviaPeticion);
		$("#listosParaEnviar").on("click", ".cancela_p", cancelaPeticion);
		
	//filas de la tabla, en JSON, preparadas para enviar
	var peticiones = [];

	function preparaPeticion() {
		var aQuien = [];
		var aQuienTexto = [];
		$(".checkUsuario:checked").each(function() {
			aQuien.push($(this).val());
			aQuienTexto.push($(this).parent().find("a").text());
		})
		var sOfrece = $("#nombreServOfrecido").val();
		var sOfreceTexto = $("#nombreServOfrecido option:selected").text();
		var sSolicita = "${servicio.id_servicio}";
		var sSolicitaTexto = "${servicio.nombre}";
		var uEnvia = "${usuario.id}";

		for (var i = 0; i < aQuien.length; i++) {
			var fila = $("<tr>");
			fila.append($("<td>" + aQuienTexto[i] + "</td>"));
			fila.append($("<td>" + sSolicitaTexto + "</td>"));
			fila.append($("<td>" + sOfreceTexto + "</td>"));			
			fila.append($("<td>"
							+ "<button class='confirma_p btn btn-success' id='cp_" + i + "'><strong>Enviar</strong></button>"
							+ "<button class='cancela_p btn btn-danger'><strong>Cancelar</strong></button></td>"));
			fila.append($("</tr>"));
			$("#ofertasListas").append(fila);
			peticiones.push({
				sSolicita : sSolicita,
				sOfrece : sOfrece,
				uEnvia : uEnvia,
				uRecibe : aQuien[i]
			});
		}
		$("#noOfertas").remove();
	}
	
	
	$("#listosParaEnviar").on("click", ".confirma_p", function () {
		$( "#dialog" ).dialog({
		      resizable: false,
		      height:175,
		      width:350,
		      modal: true,
		      buttons: {		    	  
		        "SI": function() {		        	
		        	var i = $(".confirma_p").attr("id").substring("cp_".length);		        	
		    		$.post("${prefix}enviaOferta", peticiones[i], function() {
		    			$('#cp_'+i).parent().parent().remove();
		    			if ($('#listosParaEnviar >tbody >tr').length == 0){
		    				var fila = $("<h4 id='noOfertas'>Listado de ofertas vacio</h4>");
		    				$("#ofertasListas").append(fila);
		    			}
		    			else{
		    				$("#noOfertas").remove();
		    			}    			
		    		});	 
		    		
		    		$(this).dialog("close");
		            
		            $("#dialogOK").dialog({		         
		            	resizable: false,
					    height:175,
					    width:360,
					    modal: true,
		                open: function() {
		                	$(".ui-dialog-titlebar-close").hide();
		                    var foo = $(this);
		                    setTimeout(function() {
		                       foo.dialog('close');
		                    }, 2000);
		                }
		            });		    		
		        },
		        
		        "NO": function() {
		          $(this).dialog("close");
		        }
		      }
	    });
	});
	

	function enviaPeticion() {
		var i = $(this).attr("id").substring("cp_".length);
		$.post("${prefix}enviaOferta", peticiones[i], function() {
			$('#cp_'+i).parent().parent().remove();
			if ($('#listosParaEnviar >tbody >tr').length == 0){
				var fila = $("<h4 id='noOfertas'>Listado de ofertas vacio</h4>");
				$("#ofertasListas").append(fila);
			}
			else{
				$("#noOfertas").remove();
			}
		});
		
		
	}

	function cancelaPeticion() {
		$(this).parent().parent().remove();
		if ($('#listosParaEnviar >tbody >tr').length == 0){
			var fila = $("<h4 id='noOfertas'>Listado de ofertas vacio</h4>");
			$("#ofertasListas").append(fila);
		}
		else{
			$("#noOfertas").remove();
		}
	}
	
});
</script>

<div id="cuerpo" class="container">
	<div class="col-md-12">
		<div class="col-md-12" align="center">
			<h2>
				<strong>SERVICIO SOLICITADO</strong>
			</h2>
		</div>
		<div id="cabecera-servicio" class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<strong>${servicio.nombre}</strong>
					</h3>
				</div>
				<div class="panel-body">${servicio.descripcion}</div>
			</div>
		</div>
		<div id="cuerpo-servicio" class="col-md-12">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h4 class="panel-title">
						<strong>OFERTAS A REALIZAR</strong>
					</h4>
				</div>
				<div class="panel-body">
					<c:choose>
						<c:when test="${empty listaUsuariosServicio}">
							<h4>Solo tu realizas este servicio.</h4>
						</c:when>
						<c:otherwise>
							<div class="checkbox">
								<div class="col-md-6">
									<p>
										<strong>Seleccione los usuarios a los que quiere
											ofrecer un servicio:</strong>
									</p>
									<c:forEach items="${listaUsuariosServicio}" var="u">
										<label> <input class="checkUsuario" type="checkbox"
											value="${u.id}"><a
											href="${prefix}mi_perfil/Usuario/${u.id}">${u.alias}</a>
										</label>
									</c:forEach>
								</div>
								<div class="col-md-4">
									<p>
										<strong>Servicio a ofrecer:</strong>
									</p>
									<select id="nombreServOfrecido" class="form-control">
										<c:forEach items="${listaServiciosDeUsuario}" var="s">
											<option value="${s.id_servicio}">${s.nombre}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-2" id="botones-servicio" align="center">
									<button id="bConfirma" class="btn btn-success btn-lg">
										<strong>Confirmar</strong>
									</button>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- cierro formulario superior -->
		<div class="col-md-12">
			<table id="listosParaEnviar" class="table table-striped">
				<thead>
					<tr>
						<th><h4>
								<strong>OFREZCO A</strong>
							</h4></th>
						<th><h4>
								<strong>SOLICITO</strong>
							</h4></th>
						<th><h4>
								<strong>OFREZCO</strong>
							</h4></th>
						<th><h4>
								<strong>ENVIAR/ELIMINAR OFERTA</strong>
							</h4></th>
					</tr>
				</thead>
				<tbody id="ofertasListas">
				
				</tbody>
			</table>
		</div>
	</div>

	<div id="dialog" title="Confirmaci&oacute;n Oferta"
		style="display: none">
		<strong>&iquest;Est&aacute;s seguro que quiere realizar esta
			oferta?</strong>
	</div>
	<div id="dialogOK" title="Oferta Aceptada" style="display: none">
		<h4>
			<strong>La oferta ha sido enviada con &eacute;xito</strong>
		</h4>
		<br />
		<p>Este mensaje se cerrara en pocos segundos...</p>
	</div>
</div>

<%@ include file="../fragments/footer.jspf"%>