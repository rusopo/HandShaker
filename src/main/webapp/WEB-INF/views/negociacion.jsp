<%@ include file="../fragments/header.jspf" %>


<div class="container" id = "cuerpo">

	<div class="col-md-12">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div align="left" class="col-md-9">
				
				  	<h2><strong>OFERTA</strong></h2>
				  	
							
			</div>
			<div class="col-md-3" align="right">
				<a href="${prefix}mis_ofertas" class="btn btn-link"><h3><strong><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span> Volver a Ofertas</strong></h3></a>
			</div>
		</div>
		<div class="col-md-1"></div> 
	</div>   	
    	<%@ include file="../views/resultadosChatNegociacion.jsp" %>
</div>

<div id="dialogAceptarNegociacion" title="Confirmaci&oacute;n Negociaci&oacute;n" style="display:none"><strong>&iquest;Est&aacute;s seguro que quiere aceptar esta negociaci&oacute;n?</strong></div>
<div id="dialogConfirmada" title="Negociaci&oacute;n Aceptada" style="display:none">
		<h4><strong>La negociaci&oacute;n ha sido aceptada</strong></h4><br/>
		 <p>Redirigiendo a su historial...</p>
</div>
<div id="dialogCancelada" title="Negociaci&oacute;n Cancelada" style="display:none">
		<h4><strong>La negociaci&oacute;n ha sido cancelada</strong></h4><br/>
		 <p>Este mensaje se cerrara en pocos segundos...</p>
</div>	
		 
<%@ include file="../fragments/footer.jspf" %>