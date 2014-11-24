$(document).ready(function () {

    $('#form-registro').validate({ // initialize the plugin
        
    	rules: {
    		
    		'AliasRegistro':{
    			required: true,
    			minlength: 5
    		},
    		'NombreRegistro':{
    			required: true,
    		},
    		'EdadRegistro': {
                required: true,
                digits: true,
                min: 18,
                max: 99
            },
        	'EmailRegistro': {
                required: true,
                email: true
            },
            'ContraseniaRegistro': {
                required: true,
                minlength: 5
            },
            'Contrasenia2Registro': {
            	required: true,
    			minlength: 5,
    			equalTo: "#ContraseniaRegistro"
    		},
            'direccion': {
            	required: true
            },
        	
        },
        messages: {
        	
        	'AliasRegistro' : "* Campo Requerido con al menos 5 caracteres",
        	'EdadRegistro' : "Para registrarte en esta p&aacutegina tienes que ser mayor de edad",
        	'NombreRegistro' : "* Campo Requerido",
        	'ContraseniaRegistro' : "Tu contrase&ntildea debe tener al menos 5 caracteres",
        	'Contrasenia2Registro' : "No coinciden las contrase&ntildeas",
        	'EmailRegistro' : "Por favor introduzca una direcci&oacuten de e-mail v&aacutelida",
        	'direccion' : "* Campo Requerido"
        },
       
    });

});