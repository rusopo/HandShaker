/*	
$(document).ready(function()
 {
	var elemento=document.getElementById('btn-admin-usuarios');
    elemento.setAttribute('class','active');
    
    $("#panel-admin-usuarios").css("display", "block");
    $("#panel-admin-servicios").css("display", "none");
    $("#panel-admin-negociaciones").css("display", "none");
    
 });
*/
function cambiarDivPanel(id){
	
	if(id==1){
		
		$("#panel-control-admin").load("administrador"){
			
			var elemento=document.getElementById('btn-admin-usuarios');
	        elemento.setAttribute('class','active');
	        
	        $("#panel-admin-usuarios").css("display", "block");
	        $("#panel-admin-servicios").css("display", "none");
	        $("#panel-admin-negociaciones").css("display", "none");
		}
	}
	else if(id==2){
		
		$("#panel-control-admin").load("administrador"){
			
			 var elemento=document.getElementById('btn-admin-servicios');
	         elemento.setAttribute('class','active'); 
			
			 $("#panel-admin-usuarios").css("display", "none");
	         $("#panel-admin-servicios").css("display", "block");
	         $("#panel-admin-negociaciones").css("display", "none");
		}
         
		
	}
	else if(id==3){
		
		var elemento=document.getElementById('btn-admin-negociaciones');
        elemento.setAttribute('class','active');
        
		$("#panel-admin-usuarios").css("display", "none");
        $("#panel-admin-servicios").css("display", "none");
        $("##panel-admin-negociaciones").css("display", "block");
        
        
	}
	
}
		   
		
	   