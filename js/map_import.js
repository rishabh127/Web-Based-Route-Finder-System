function initialize()
{
	var mapImport = {
	center:new google.maps.LatLng(23.1667,79.9333),
	zoom:12,
	mapTypeId:google.maps.MapTypeId.ROADMAP
	};
	var map=new google.maps.Map(document.getElementById("googleMap"),mapImport);
}
google.maps.event.addDomListener(window, 'load', initialize);