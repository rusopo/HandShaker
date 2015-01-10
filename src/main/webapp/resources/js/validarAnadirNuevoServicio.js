$(document).ready(function () {

    $('#formAnadirServicio').validate({ // initialize the plugin
        
    	rules: {
    		
    		'tituloServicio':{
    			required: true,
    			minlength: 5
    		},
    		'categoriaServicio':{
    			required: true,
    		},
    		'descripcionServicio': {
                required: true,
                minlength: 25
            },        	        	
        },
        messages: {
        	
        	'tituloServicio' : "* Campo Requerido con al menos 5 caracteres",
        	'categoriaServicio' : "* Campo Requerido",
        	'descripcionServicio' : "* Campo Requerido con al menos 25 caracteres"        	
        },
       
    });

});