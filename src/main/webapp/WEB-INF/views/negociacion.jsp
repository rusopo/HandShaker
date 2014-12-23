<%@ include file="../fragments/header.jspf" %>

<!--  <div id="cuerpo" class="container">
		
	<div id="cuerpo-negociacion" class="col-md-12">
			
				<div class="col-md-2"></div>
				
				<div class="col-md-8">
					
					<div class="col-md-12">	
					
						<div id="user1" class="col-md-12">
							<div class="col-md-2">
							 
								PEPE
							</div>
							<div class="col-md-10">
							 
								<textarea class="form-control" rows="4"></textarea>
								
								<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
							</div>
							
						</div>
						
						<div class="col-md-12">
						
							<div class="col-md-2"></div>
							<div id="user2" class="col-md-10">
							
								<div class="col-md-2">
								 	JUAN
								</div>
								<div class="col-md-10">
								 
									<textarea class="form-control" rows="4"></textarea>		
																
									<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
								</div>
							</div>
						</div>
						
					
					</div>
					
					<div class="col-md-12">	
					
						<div id="user1" class="col-md-12">
							<div class="col-md-2">
							 
								PEPE
							</div>
							<div class="col-md-10">
							 
								<textarea class="form-control" rows="4"></textarea>
								
								<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
							</div>
							
						</div>
						
						<div class="col-md-12">
						
							<div class="col-md-2"></div>
							<div id="user2" class="col-md-10">
							
								<div class="col-md-2">
								 	JUAN
								</div>
								<div class="col-md-10">
								 
									<textarea class="form-control" rows="4"></textarea>		
																
									<div id ="post-button" class="col-md-12"align="right">
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
								</div>
							</div>
						</div>
						
					
					</div>
					
					</div>			
			
			</div>
			
	<div id="botones-negociacion" class="col-md-12" align="center">
				<button type="submit" class="btn btn-success btn-lg">Aceptar</button>
				<button type="reset" class="btn btn-danger btn-lg">Cancelar</button>
			
			</div>			
			
</div>  -->
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
            <div class="panel-collapse collapse" id="collapseOne">
                <div class="panel-body">
                    <ul class="chat">
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>12 mins ago</small>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>13 mins ago</small>
                                    <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="left clearfix"><span class="chat-img pull-left">
                            <img src="http://placehold.it/50/55C1E7/fff&text=U" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font">Jack Sparrow</strong> <small class="pull-right text-muted">
                                        <span class="glyphicon glyphicon-time"></span>14 mins ago</small>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                        <li class="right clearfix"><span class="chat-img pull-right">
                            <img src="http://placehold.it/50/FA6F57/fff&text=ME" alt="User Avatar" class="img-circle" />
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <small class=" text-muted"><span class="glyphicon glyphicon-time"></span>15 mins ago</small>
                                    <strong class="pull-right primary-font">Bhaumik Patel</strong>
                                </div>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur bibendum ornare
                                    dolor, quis ullamcorper ligula sodales.
                                </p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text" class="form-control input-sm" placeholder="Type your message here..." />
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="btn-chat">
                                Send</button>
                        </span>
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
</div>

		 
<%@ include file="../fragments/footer.jspf" %>