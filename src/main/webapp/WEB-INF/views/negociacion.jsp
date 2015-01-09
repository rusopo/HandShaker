<%@ include file="../fragments/header.jspf" %>


<div class="container" id = "cuerpo">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-primary">
                <div class="panel-heading" id="accordion">
                    <span class="glyphicon glyphicon-comment"></span> Chat
                    <div class="btn-group pull-right">
                        <a type="button" class="btn btn-default btn-xs" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </a>
                    </div>
                </div>
            <div class="panel-collapse collapse in" id="collapseOne">
                <div class="panel-body">
                    <ul class="chat">
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                        
						<c:forEach items="${ListaComentarios}" var ="c">
                            <div class="chat-body clearfix">
                                <div class="header" >
                                    <strong class="primary-font"> ${c.id_usuario.nombre}</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>12 mins ago</small>
                                </div>
                                <p>
                                    ${c.texto_comentario} 
                                </p>
                              
                            </div>
                           </c:forEach>
						
						 
                        </li>
                    </ul>
                </div>
                <div class="panel-footer">
                    <div class="input-group"> 
                   		<form action = "negociacion" method = "get">
                        <input id="btn-input" type="text" class="form-control input-sm" placeholder="Pon tu mensaje aqui..." name = "textoAEnviar" >
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="btn-chat" >
                                ENVIAR</button>
                        </span>
                      	</form>
                        
                    </div>
                </div>
            </div>
            </div>
            <form action = "negociacion" method = "get">
            <input type= "hidden" name ="OfertaAceptada" value = "aceptada"> 
            </form>
            <a href="mis_ofertas" class="btn btn-success btn-lg"  >ACEPTAR</a>
        </div>
    </div>
</div>

		 
<%@ include file="../fragments/footer.jspf" %>