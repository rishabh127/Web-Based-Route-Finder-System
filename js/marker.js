function setMarker() {
	//var query=document.getElementById('query').value;
	alert("<h1>query:"+query+"</h1>");
	var my=new google.maps.LatLng(23.15107,79.94865);
	var LatLng = {
					"sadar":new google.maps.LatLng(23.15107,79.94865),
					"russel chowk":new google.maps.LatLng(23.16327,79.93683),
					"samdariya mall":new google.maps.LatLng(23.16877,79.93335),
					"dumna airport":new google.maps.LatLng(23.18417,80.05929),
					"south avenue mall":new google.maps.LatLng(23.15648,79.94859),
					"IIITDM Jabalpur":new google.maps.LatLng(23.17829,80.02538),
					"railway station":new google.maps.LatLng(23.15918,79.95599),
					"bhedaghat":new google.maps.LatLng(23.13059,79.80236),
					"khamaria":new google.maps.LatLng(23.21393,80.03680),
				};
	var mapOptions ={
		zoom: 14,
		center: LatLng[query],
		mapTypeId: google.maps.MapTypeId.ROADMAP
	}
	var map = new google.maps.Map(document.getElementById("googleMap-changed"), mapOptions);
	var marker = new google.maps.Marker({
		position: LatLng[query],
		map: map,
		title:query
  });
}
google.maps.event.addDomListener(window, 'load', setMarker);