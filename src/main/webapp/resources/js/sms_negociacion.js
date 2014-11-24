$(document).ready(function(){ 
    $("#boton-negociacion").click(function() {
        $("#dialogo").dialog({ 
        	width: 800,  
            height: 400,
            show: "blind",
            hide: "shake", 
            resizable: "true",
            position: "center",
        });
    });
});