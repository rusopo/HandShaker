<%@ include file="../fragments/header.jspf" %>

 <script type="text/javascript">
 
 $(document).ready(function(){
	 
	 $('#tabla-administracion1').dataTable();
	 $('#tabla-administracion2').dataTable();
	 $('#tabla-administracion3').dataTable();
	 
	 
 });
 

  
 </script>

<div id="cuerpo" class="container">
							
			<div id="panel-administrador" class="col-md-12">
				
				<div id="panel-botones-admin">
												
					<!-- Nav tabs -->
					<ul class="nav nav-pills" role="tablist" id="myTab">
					  <li role="presentation" class="active"><a class="enlace-admin" href="#panel-admin-usuarios" role="tab" data-toggle="tab">Usuarios</a></li>
					  <li role="presentation"><a class="enlace-admin" href="#panel-admin-servicios" role="tab" data-toggle="tab">Servicios</a></li>
					  <li role="presentation"><a class="enlace-admin" href="#panel-admin-negociaciones" role="tab" data-toggle="tab">Negociaciones</a></li>
					</ul>
					
				</div>			
											
					<!-- Tab panes -->
					<div class="tab-content">
					
					
				         <div role="tabpanel" class="tab-pane active" id="panel-admin-usuarios">
							
							<%@ include file="../fragments/administrador/user_admin.jspf" %>
					  		     			  		    
				  	     </div>
					  		     
					  		    
				  
				  	     <div role="tabpanel" class="tab-pane" id="panel-admin-servicios">
				  		       
				  		      <%@ include file="../fragments/administrador/services_admin.jspf" %> 
				  		  				  		        
				  	     </div>
				  	     
				  	     <div role="tabpanel" class="tab-pane" id="panel-admin-negociaciones">
				                <%@ include file="../fragments/administrador/negociaciones_admin.jspf" %>
				  	     </div>
				  
				   </div>									
		
		</div>
							
</div>
		 
<%@ include file="../fragments/footer.jspf" %>