<%@ taglib  uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" prefix="e" %>

<%@ include file="../fragments/headerMiPerfil.jspf" %> 

<script type="text/javascript">

$(document).ready(function(){

	$(function() {
		
			$.ajax({
				dataType: "json",
				url: "${prefix}dameServicios",
				type: "POST",
				success: function(data) {
					obtenerServicios(data);
					obtenerServiciosIntereses(data);
				}
			});		
			
	});
		
});

var losServicios = {};
var serviciosSeleccionados = {};

var losServicios2 = {};
var serviciosSeleccionados2 = {};

function obtenerServicios(serv) {
          	
     console.log(serv);
     
	 var cats = $("#catsel");
	 
	 $("#catsel").empty();
	 $("#catsel").append("<option value='0'>--Selecciona--</option>");
	 
	 $.each(serv, function(i,o) {
		 var v = $("<option value='" + o.id + "'>" + o.nombre + "</option>");
		 cats.append(v);
		 losServicios[o.id] = o;
		 o.servicios = {};
		 $.each(o.valores, function (i, o2){
		 	o.servicios[o2.id] = o2;
		 });
	 });
	 	 	 	 
	 cats.change(function() {
		 actualiza($(this),serv);		 
	 });
	 
	 var list = $("<ol id='listaServsRegistro' name='listaServsRegistro'>");
	 
	 var servs = $("#sersel");
	  
	 servs.change(function() {
		 var cat = losServicios[$("#catsel").val()];
		 var ser = cat.servicios[$("#sersel").val()];
		 serviciosSeleccionados[ser.id] = 'true';
		 $('#servs').val(JSON.stringify(serviciosSeleccionados));
		 
		 var li = $("<li id='" + ser.id + "'>");
		 
		 var posicion=document.getElementById("sersel").options.selectedIndex; //posicion
		 
		 li.append("<strong>Seleccionado: </strong>" + 
				 document.getElementById("sersel").options[posicion].text)
				 
		 var laEquis = $("<span>X</span>");
		 li.append(laEquis);
		 laEquis.click(function() {
			 li.remove();
			 delete(serviciosSeleccionados[ser.id]);
			 $('#servs').val(JSON.stringify(serviciosSeleccionados));
		 });
		 
		 list.append(li);
		 console.log(this);		 	 
		 		 	 
	 });
		 
	 var servsSelec = $("#servicios-selec");	 
	 
	 servsSelec.append(list);
	 	 
 }
            
 function actualiza(que,serv) {
	 
	 var bueno;
	 var buscado = que.val();
	 var servs;
	 
	 $.each(que.children(), function (i, o){
		 
		var selec = parseInt($(o).val());		
		selec = selec + 1;		
		if (selec == buscado){			
			bueno = i;			
			servs = document.getElementById("sersel");			
			if ( servs.hasChildNodes() ){
				while ( servs.childNodes.length >= 1 )
				{
					servs.removeChild( servs.firstChild );
				}
			}			
			servs = $("#sersel");
			
			$("#sersel").empty();
			$("#sersel").append("<option value='0'>--Selecciona--</option>");
			
			console.log(serv[bueno].valores);
								
			$.each(serv[bueno].valores, function(a,u) {
			 	var s = $("<option value='" + u.id + "'>" + u.nombre + "</option>");
			 	servs.append(s);
			 });		 
		} 		
	 });	 	 	 	 
 }
 
 function obtenerServiciosIntereses(serv) {
	   	
     console.log(serv);
     
	 var cats = $("#catselInteres");
	 
	 $("#catselInteres").empty();
	 $("#catselInteres").append("<option value='0'>--Selecciona--</option>");
	 
	 $.each(serv, function(i,o) {
		 var v = $("<option value='" + o.id + "'>" + o.nombre + "</option>");
		 cats.append(v);
		 losServicios2[o.id] = o;
		 o.servicios = {};
		 $.each(o.valores, function (i, o2){
		 	o.servicios[o2.id] = o2;
		 });
	 });
	 	 	 	 
	 cats.change(function() {
		 actualiza2($(this),serv);		 
	 });
	 
	 var list = $("<ol id='listaInteresesRegistro' name='listaInteresesRegistro'>");
	 
	 var servs = $("#serselInteres");
	  
	 servs.change(function() {
		 var cat = losServicios2[$("#catselInteres").val()];
		 var ser = cat.servicios[$("#serselInteres").val()];
		 serviciosSeleccionados2[ser.id] = 'true';
		 $('#intereses').val(JSON.stringify(serviciosSeleccionados2));
		 
		 var li = $("<li id='" + ser.id + "'>");
		 
		 var posicion=document.getElementById("serselInteres").options.selectedIndex; //posicion
		 
		 li.append("<strong>Seleccionado: </strong>" + 
				 document.getElementById("serselInteres").options[posicion].text)
				 
		 var laEquis2 = $("<span>X</span>");
		 li.append(laEquis2);
		 laEquis2.click(function() {
			 li.remove();
			 delete(serviciosSeleccionados2[ser.id]);
			 $('#intereses').val(JSON.stringify(serviciosSeleccionados2));
		 });
		 
		 list.append(li);
		 console.log(this);		 	 
		 		 	 
	 });
		 
	 var servsSelec = $("#interes-selec");	 
	 
	 servsSelec.append(list);
	 	 
 }
            
 function actualiza2(que,serv) {
	 
	 var bueno;
	 var buscado = que.val();
	 var servs;
	 
	 $.each(que.children(), function (i, o){
		 
		var selec = parseInt($(o).val());	
		selec = selec + 1;		
		if (selec == buscado){			
			bueno = i;			
			servs = document.getElementById("serselInteres");			
			if ( servs.hasChildNodes() ){
				while ( servs.childNodes.length >= 1 )
				{
					servs.removeChild( servs.firstChild );
				}
			}			
			servs = $("#serselInteres");
			
			$("#serselInteres").empty();
			$("#serselInteres").append("<option value='0'>--Selecciona--</option>");
			
			console.log(serv[bueno].valores);
								
			$.each(serv[bueno].valores, function(a,u) {
			 	var s = $("<option value='" + u.id + "'>" + u.nombre + "</option>");
			 	servs.append(s);
			 });			 
		} 		
	 });	 	 	 	 
 }
 
 </script>

<div id="cuerpo" class="container">
	<c:choose>
		<c:when test="${empty usuario}">
			<div class="col-md-12">
				<h3>
					<strong>Necesitas estar registrado para poder visitar tu
						perfil. Hazlo m&aacute;s arriba!</strong>
				</h3>
			</div>
		</c:when>
		<c:otherwise>
			<div id="perfil-info-izq" class="col-md-3">
				<div class="col-md-12">
					<div id="foto-perfil" class="col-md-12" align="center">
						<img
							src="${prefix}mi_perfil/usuario?id_usuario=${e:forHtmlContent(usuarioPerfil.id)}"
							height="150px" width="130px" />
					</div>
					<div id="datos-perfil" class="col-md-12">
						<h4>
							<strong>Alias: </strong>${e:forHtmlContent(usuarioPerfil.alias)}</h4>
						<h4>
							<strong>Nombre: </strong>${e:forHtmlContent(usuarioPerfil.nombre)}</h4>
						<h4>
							<strong>Correo electr&oacute;nico:</strong>
						</h4>
						<h4>${e:forHtmlContent(usuarioPerfil.email)}</h4>
						<h4>
							<strong>Edad: </strong> ${e:forHtmlContent(usuarioPerfil.edad)}
						</h4>
					</div>
				</div>
				<div class="col-md-12">
					<h3 class="h3-perfil" align="center">Valoraci&oacute;n</h3>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="7"
							aria-valuemin="0" aria-valuemax="10" style="width: 70%;">
							7/10</div>
					</div>
				</div>
				<c:if test="${usuario.id eq usuarioPerfil.id}">
					<div class="col-md-12" style="margin-top: 5%;" align="center">
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-success btn-lg"
							data-toggle="modal" data-target="#nuevoServicio">
							<strong>A&ntilde;adir nuevo servicio</strong>
						</button>
						<!-- Modal -->
						<div class="modal fade" id="nuevoServicio" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<form id="formAnadirServicio" name="formAnadirServicio"
									action="${prefix}anadirNuevoServicio" method="post">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">
												<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">
												<strong>A&ntilde;adir nuevo servicio</strong>
											</h4>
										</div>
										<div class="modal-body">
											<h5 align="left">Por favor introduzca los datos de
												manera que todos los usuarios lo puedan entender</h5>
											<br>
											<div class="form-group">
												<label for="inputTitulo3" class="col-sm-2 control-label">T&iacute;tulo</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="inputTitulo3"
														name="tituloServicio">
												</div>
											</div>
											<div class="form-group">
												<label for="inputCategoria3" class="col-sm-2 control-label">Categor&iacute;a</label>
												<div class="col-sm-10">
													<select name="categoriaServicio" id="listaCategorias"
														class="form-control">
														<option>-- Selecciona --</option>
														<c:forEach items="${listaCategorias}" var="c">
															<option value="${c.id}">${c.nombreCategoria}</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<label for="inputDescripcion3" class="col-sm-2 control-label">Descripci&oacute;n</label>
											<textarea name="descripcionServicio" class="form-control"
												rows="6"></textarea>
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-lg btn-danger">
												<strong>A&ntilde;adir</strong>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</c:if>
			</div>
			<div id="perfil-info-der" class="col-md-9">
				<div id="perfil-info1" class="col-md-6">
					<div id="info-diponibilidad" class="col-md-12">
						<h3 align="center" class="h3-perfil">Mi Disponibilidad</h3>
						<div align="center">
							<!-- <div id="datepicker"></div> -->
							<table class="table table-bordered">
								<thead>
									<tr>
										<th></th>
										<th>L</th>
										<th>M</th>
										<th>X</th>
										<th>J</th>
										<th>V</th>
										<th>S</th>
										<th>D</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><strong>Ma&ntilde;ana</strong></td>
										<td class="active"></td>
										<td class="danger"></td>
										<td class="danger"></td>
										<td class="active"></td>
										<td class="danger"></td>
										<td class="active"></td>
										<td class="danger"></td>
									</tr>
									<tr>
										<td><strong>Tarde</strong></td>
										<td class="danger"></td>
										<td class="active"></td>
										<td class="danger"></td>
										<td class="active"></td>
										<td class="active"></td>
										<td class="active"></td>
										<td class="danger"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div id="info-habilidades" class="col-md-12">
						<h3 align="center" class="h3-perfil">Mis Habilidades</h3>
						<div class="col-md-12">
							<ol>
								<c:choose>
									<c:when test="${not empty usuario}">
										<c:forEach items="${listaServiciosUsuario}" var="s">
											<li><strong>${s.nombre}</strong></li>
										</c:forEach>
									</c:when>
									<c:otherwise>
										No tiene servicios.								
									</c:otherwise>
								</c:choose>
							</ol>
						</div>
						<c:if test="${usuario.id eq usuarioPerfil.id}">
							<div class="col-md-12" style="margin-top: 1%;" align="center">
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-link" data-toggle="modal"
									data-target="#nuevaHabilidad">
									<strong>A&ntilde;adir nueva habilidad</strong>
								</button>
								<!-- Modal -->
								<div class="modal fade" id="nuevaHabilidad" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<form name="formAnadirHabilidad"
											action="${prefix}anadirNuevaHabilidad" method="post">
											<div class="modal-content" align="left">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">&times;</span><span
															class="sr-only">Close</span>
													</button>
													<h4 align="center" class="modal-title" id="myModalLabel">
														<strong>A&ntilde;adir habilidad</strong>
													</h4>
												</div>
												<div id="anadir-servicio" class="col-md-12">
													<div class="col-md-12">
														<h5>
															<strong>Seleccione las habilidades que desea
																a&ntilde;adir a su lista:</strong>
														</h5>
														<br>
													</div>
													<div class="col-md-5">
														<div align="center" style="margin-bottom: 1%">
															<strong>Categorias</strong>
														</div>
														<select id="catsel" name="categoria" class="form-control">
														</select>
													</div>
													<div class="col-md-7">
														<div align="center" style="margin-bottom: 1%">
															<strong>Servicios</strong>
														</div>
														<select id="sersel" name="servicio" class="form-control">
														</select>
													</div>
													<div id="servicios-selec" class="col-md-12"></div>
													<input type='hidden' name='servs' id='servs' />
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-danger">
														<strong>A&ntilde;adir</strong>
													</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</c:if>
					</div>
					<div id="info-intereses" class="col-md-12">
						<h3 align="center" class="h3-perfil">Mis Intereses</h3>
						<ol>
							<c:choose>
								<c:when test="${not empty usuario}">
									<c:forEach items="${listaInteresesUsuario}" var="s">
										<li><strong>${s.nombre}</strong></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
										No tiene intereses.						
								</c:otherwise>
							</c:choose>
						</ol>
					</div>
					<c:if test="${usuario.id eq usuarioPerfil.id}">
						<div class="col-md-12" style="margin-top: 1%;" align="center">
							<!-- Button trigger modal -->
							<button type="button" class="btn btn-link" data-toggle="modal"
								data-target="#nuevoInteres">
								<strong>A&ntilde;adir nuevo interes</strong>
							</button>
							<!-- Modal -->
							<div class="modal fade" id="nuevoInteres" tabindex="-1"
								role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<form name="formNuevoInteres"
										action="${prefix}anadirNuevoInteres" method="post">
										<div class="modal-content" align="left">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">&times;</span><span
														class="sr-only">Close</span>
												</button>
												<h4 align="center" class="modal-title" id="myModalLabel">
													<strong>A&ntilde;adir Interes</strong>
												</h4>
											</div>
											<div id="anadir-interes" class="col-md-12">
												<div class="col-md-12">
													<h5>
														<strong>Seleccione los intereses que desea
															a&ntilde;adir a su lista:</strong>
													</h5>
													<br>
												</div>
												<div class="col-md-5">
													<div align="center" style="margin-bottom: 1%">
														<strong>Categorias</strong>
													</div>
													<select id="catselInteres" name="categoria"
														class="form-control">
													</select>
												</div>
												<div class="col-md-7">
													<div align="center" style="margin-bottom: 1%">
														<strong>Servicios</strong>
													</div>
													<select id="serselInteres" name="servicio"
														class="form-control">
													</select>
												</div>
												<div id="interes-selec" class="col-md-12"></div>
												<input type='hidden' name='intereses' id='intereses' />
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-danger">
													<strong>A&ntilde;adir</strong>
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</c:if>
				</div>
				<div id="perfil-info2" class="col-md-6">
					<h3 align="center" class="h3-perfil">Mi Ubicaci&oacute;n</h3>
					<form name="latLongOcultas" id="latLongOcultas" action="">
						<input type="hidden" id="latitud" name="latitud"
							value="${e:forHtmlContent(usuarioPerfil.latitud)}"> <input
							type="hidden" id="longitud" name="longitud"
							value="${e:forHtmlContent(usuarioPerfil.longitud)}">
					</form>
					<div id="perfil-mapa"></div>
					<div align="center">
						<a href="${prefix}mi_historial/Usuario/${e:forHtmlContent(usuarioPerfil.id)}"
							class="btn btn-primary btn-lg">Historial</a>
					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<%@ include file="../fragments/footer.jspf" %>