<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

$(function(){
	
	$("#btn-chat").click(function(){
 		 
  		var textoComentario =  $('#textoComentario').val();
 			var idNegociacion = $('#idNegociacion').val();
  		
	    $.ajax({			    	
	    	type: "POST",
	    	url: "${prefix}anadirComentarioNegociacion",
	    	data:{ idNegociacion: idNegociacion,
	    		textoComentario: textoComentario},
	    	success:function(data){
	      		$("#divChatPrincipal").html(data);
	      		
	    	}
	    });
  	});
	
	$(".botonAceptarNegociacion").click(function () {
		$("#dialogAceptarNegociacion").dialog({
		      resizable: false,
		      height:175,
		      width:350,
		      modal: true,
		      buttons: {		    	  
		        "SI": function() {	
		        	
	        	  var id = $(".botonAceptarNegociacion").attr("id").substring("botonAceptarNegociacion_".length);
		        	$.ajax({			    	
				    	type: "POST",
				    	url: "${prefix}negociacionAceptada",
				    	data:{ IDNegociacion: id},
				    	success:function(data){					 					      		
				    	}
				    });
		        	
		    		$(this).dialog("close");
		            
		            $("#dialogConfirmada").dialog({
		            	resizable: false,
					    height:175,
					    width:360,
					    modal: true,
		                open: function() {
		                    var foo = $(this);
		                    setTimeout(function() {
		                       $(".ui-dialog-titlebar-close").hide();
		                       foo.dialog('close');
		                       window.location.href = "${prefix}mi_historial/Usuario/${usuario.id}";
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

	$(".botonCancelarNegociacion").click(function () {
		$("#dialogCancelada").dialog({
	    	resizable: false,
		    height:175,
		    width:360,
		    modal: true,
	        open: function() {
	        	
	        	var id = $(".botonCancelarNegociacion").attr("id").substring("botonCancelarNegociacion_".length);
	        	$.ajax({			    	
			    	type: "POST",
			    	url: "${prefix}negociacionCancelada",
			    	data:{ IDNegociacion: id},
			    	success:function(data){					 					      		
			    	}
			    });
	        	        	
	            var foo = $(this);
	            setTimeout(function() {
	               $(".ui-dialog-titlebar-close").hide();
	               foo.dialog('close');
	               $(location).attr('href','${prefix}mis_ofertas');
	            }, 3000);         
	      }
	    });			            
							
	});
			  
  	 
		  	
});
</script>

<div id="divChatPrincipal">

<div class="col-md-1"></div>
    	
        <div class="col-md-10" id="divPrincipalNegociacion">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span><strong> CHAT</strong>
                </div>
                <div class="panel-body">
                
                <c:choose>
                	
                	<c:when test="${empty ListaComentarios}">              		
                		<h4><strong>${NoHayComentarios}</strong></h4>               	
                	</c:when>
                
                	<c:otherwise>
                	          
                    <ul class="listaChat">
                    	
                    	<c:forEach items="${ListaComentarios}" var ="c">
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="${prefix}mi_perfil/usuario?id_usuario=${c.id_usuario.id}" height="45px" width="45px" class="img-circle" /></span>

                           <div class="chat-body clearfix">
                                <div class="header" >
                                    <strong class="primary-font">  ${c.id_usuario.nombre}</strong> 
                                    <small class="pull-right text-muted"><span class="glyphicon glyphicon-time"></span>12 mins ago</small>
                                </div>
                                <p>
                                    ${c.texto_comentario} 
                                </p>
                              
                            </div>
                         												 
                        </li>
                         </c:forEach>
                    </ul>
                    </c:otherwise>
                   </c:choose>
                   
                   <div class="col-md-12" id="divComentarioNegociacion">
                                      
	                 	   <input type="hidden" id="idNegociacion" name="idNegociacion" value="${negociacion.id_negociacion}">
	                       <!-- <textarea id="btn-input" id="textoComentario" name="textoComentario" class="form-control" rows="5" autofocus="autofocus" placeholder="Escribe aqui tu comentario ..." ></textarea>-->
	                       <input type="text" id="textoComentario" name="textoComentario" class="form-control" placeholder="Escribe aqui tu comentario ...">
	                      
	                       <div align="right">	                     
	                           <button class="btn btn-primary" id="btn-chat" ><strong>ENVIAR</strong></button>        
	                       </div>
	                    
                   </div>
                </div>
                
                <div class="panel-footer">
                      <div class="col-md-6" align="right">       		                    	 			            
				            <button id="botonAceptarNegociacion_${negociacion.id_negociacion}" class="botonAceptarNegociacion"><strong>ACEPTAR NEGOCIACI&Oacute;N</strong></button>			             
			          </div>	         
			            	<button id="botonCancelarNegociacion_${negociacion.id_negociacion}" class="botonCancelarNegociacion"><strong>RECHAZAR NEGOCIACI&Oacute;N</strong></button>
              </div>
                           
            </div>
            
        </div>
		
		<div class="col-md-1"></div>
		
</div>