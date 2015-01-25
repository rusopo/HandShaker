
$(function(){	
		initialize();
		//window.onload = loadScript;
});

var map;
function initialize() {
	
	var latitud= document.getElementById('latitud').value;
	var longitud= document.getElementById('longitud').value;
	
  var mapOptions = {
    zoom: 16,
    center: new google.maps.LatLng(latitud , longitud),
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  
  map = new google.maps.Map(document.getElementById('perfil-mapa'),mapOptions);
  
//creamos el marcador en el mapa
  marker = new google.maps.Marker({
      map: map,//el mapa creado en el paso anterior
      position: new google.maps.LatLng(latitud , longitud),//objeto con latitud y longitud
      draggable: true //que el marcador se pueda arrastrar
  });
}

function loadScript() {
	  var script = document.createElement("script");
	  script.type = "text/javascript";
	  script.src = "http://maps.googleapis.com/maps/api/js?callback=initialize";
	  document.body.appendChild(script);
	}