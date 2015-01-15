<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

$(document).ready(function(){
			  
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
		  	
});
$('#myModal').on('shown.bs.modal', function () {
    $('#historial').focus()
  })
</script>

<div id="divChatPrincipal">

<div class="col-md-1"></div>


	
    	
        <div class="col-md-10" id="divPrincipalNegociacion">
        	<c:if test = "${negociacion.aceptada eq false }"> 
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-comment"></span> Chat -  ${negociacion.usuario2.alias }
          
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
	                           <button class="btn btn-primary" id="btn-chat" >ENVIAR</button>        
	                       </div>
	                    
                   </div>
                </div>
                
                <div class="panel-footer">
                      <div class="col-md-6" align="right">       		
                      	<form action = "${prefix}negociacionAceptada" method = "post">
				            <input type= "hidden" name ="IDNegociacion" value="${negociacion.id_negociacion}"> 			            
				            <button type="submit" class="btn btn-success">ACEPTAR NEGOCIACI&Oacute;N</button>
			             </form>
			          </div>
			          
			             <form action="${prefix}negociacionCancelada" method="post">
			            	<input type= "hidden" name ="IDNegociacion" value="${negociacion.id_negociacion}">
			            	<button type="submit" class="btn btn-danger">RECHAZAR NEGOCIACI&Oacute;N</button>
			             </form>          
                                     
                </div>
                           
            </div>
            </c:if>
            <c:if test = "${negociacion.aceptada eq true }"> 
				<div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-ok"></span> OFERTA ACEPTADA
          
                </div>
                <div class="panel-body">
                
                	<p>
                		La oferta ha sido realizada con exito. 
                	</p>
                	<p>
                		Si desea ver su historial pinche aqui.
                		
                	</p>
                	<form action = "${prefix}mi_historial" method = "post">
				            <input type= "hidden" name ="IDUsuario" value="${usuario.id}"> 			            
				            <button type="submit" class="btn btn-success">HISTORIAL</button>
			         </form>
                </div>
                </div>
        	
        	</c:if>
        </div>
        
        
        
       
		
		<div class="col-md-1"></div>
		
</div>