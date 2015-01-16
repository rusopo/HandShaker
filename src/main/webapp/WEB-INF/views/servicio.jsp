
<%@ include file="../fragments/header.jspf"%>

<script>

$(function(){
	$("#bConfirma").click(preparaPeticion);
	$("#listosParaEnviar").on("click", ".confirma_p", enviaPeticion);
	$("#listosParaEnviar").on("click", ".cancela_p", cancelaPeticion);
});

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
	
	for (var i=0; i<aQuien.length; i++) {
		var fila = $("<tr>");
		fila.append($("<td>" + aQuienTexto[i] + "</td>"));
		fila.append($("<td>" + sOfreceTexto + "</td>"));
		fila.append($("<td>" + sSolicitaTexto + "</td>"));
		fila.append($("<td>"
		+ "<button class='confirma_p' id='cp_" + i + "'>Enviar</button>'"
		+ "<button class='cancela_p'>Cancelar</button>'"));
		$("#listosParaEnviar").append(fila);
		peticiones.push({
			sSolicita: sSolicita, 
			sOfrece: sOfrece,
			uEnvia: uEnvia, 
			uRecibe: aQuien[i]
		});
	}
}

function enviaPeticion() {
	var i = $(this).attr("id").substring("cp_".length);
	$.post("enviaOferta", peticiones[i], function() {
		$(this).parent().parent().remove();
	});
}
function cancelaPeticion() {
	$(this).parent().parent().remove();
}

</script>

<div id="cuerpo" class="container">

	<div class="col-md-12">

		<div id="cabecera-servicio" class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">${servicio.nombre}</h3>
				</div>
				<div class="panel-body">${servicio.descripcion}</div>
			</div>
		</div>

		<div id="preparo">
			<div id="cuerpo-servicio" class="col-md-12">
				<div id="cuerpo-servicio-top" class="col-md-12">
					<h3 align="center">
						<strong>USUARIOS</strong>
					</h3>
					<div class="panel panel-success">
						<div class="panel-heading">
							<h4 class="panel-title">Lista de usuarios que ofrecen el
								servicio</h4>
						</div>
						<div class="panel-body">
							<c:choose>
								<c:when test="${empty listaUsuariosServicio}">
									<h4>Solo tu realizas este servicio.</h4>
								</c:when>
								<c:otherwise>
									<div class="checkbox">
										<c:forEach items="${listaUsuariosServicio}" var="u">
											<label> <input class="checkUsuario" type="checkbox"
												value="${u.id}"><a
												href="${prefix}mi_perfil/Usuario/${u.id}">${u.alias}</a>
											</label>
										</c:forEach>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>

				<div id="cuerpo-servicio-bottom" class="col-md-12">
					<ol id="lista-usuarios-servicio">
						<li class="elementoListaOfrecerServicio">
							<div class="col-md-12">
								<div class="col-md-3">
									<h4 id="nombre" class="col-sm-6">Ruben</h4>
									<div class="col-sm-6">
										<input class="checkOfrecerServicio" type="checkbox"><strong>
											Ofrecer Servicio</strong>
									</div>
								</div>
								<div class="col-md-6">
									<select id="nombreServOfrecido" class="form-control">
										<c:forEach items="${listaServiciosDeUsuario}" var="s">
											<option value="${s.id_servicio}">${s.nombre}</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-md-3">
									<h5 id="ServicioAofrecer">
										<strong>Servicio ofrecido: X</strong>
									</h5>
								</div>
							</div>
						</li>
					</ol>
				</div>
			</div>

			<div id="botones-servicio" class="col-md-12" align="center">
				<button id="bConfirma" class="btn btn-success">Confirma</button>
			</div>
			</div><!-- cierro formulario superior -->
			<table id="listosParaEnviar">
				<tr><th>solicitar a</th><th>que haga</th><th>a cambio de</th><th>acciones</th></tr>
			</table>
		</div>


	</div>

	<%@ include file="../fragments/footer.jspf"%>