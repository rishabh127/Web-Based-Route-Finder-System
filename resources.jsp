<!--DOCTYPE html-->
<%@ page import="java.io.File,java.io.FileReader,java.io.BufferedReader" %>
<%!
	String query;
	String path_home;
	String path_WEBINF;
	String res;
%>
<%@ include file="WEB-INF/jsp/route.jsp" %>
<%
	query=request.getParameter("query");
	path_home=getServletContext().getRealPath("/").replace('\\','/');
	path_WEBINF=getServletContext().getRealPath("WEB-INF/").replace('\\','/');
	session.setAttribute("path_home",path_home);
	session.setAttribute("path_WEBINF",path_WEBINF);
	res=request.getParameter("res");
%>
<%!
		String js=path_WEBINF+"/js/menu.js";
%>
<html>
<head>
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
	<link rel="icon" type="images/icon" href="images/favico.ico" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />
	<script src="js/searchEngine.js" type="text/javascript" ></script>
	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDkV2Y1vwiCQS-EoZroPltEFDrNQW7xwNQ&sensor=false&libraries=places"></script>
	<title>JBP Darshan</title>
</head>
<body style="background-color:#F3F3F3" onLoad="init()" >
<%@ include file="background.jsp" %>
	<div id="googleMap" class="map">
		<script>
			function setMarker()
			{
				var map=new google.maps.Map(document.getElementById("googleMap"),{
											center:new google.maps.LatLng(23.1667,79.9333),
											zoom:12,
											mapTypeId:google.maps.MapTypeId.ROADMAP
										});
				var array = {
							"hospitals":[[new google.maps.LatLng(23.161974,79.936416),"Jabalpur Hospital & Research Center 4th Bridge Road,Russel Crossing, Napier Town,Jabalpur, Madhya Pradesh,482002, 4th Bridge Rd, Napier Town, Jabalpur, MP 482001, India ?+91 76 12 450761 www.jabalpurhospital.in"],
										[new google.maps.LatLng(23.168270,79.928444),"Bombay Hospital & Research Center Jabalpur Khandwa, Jabalpur, MP, India  +91 76 12 410202"],
										[new google.maps.LatLng(23.164415,79.950048),"Marble City Hospital North Civil Lines, Jabalpur, MP, 482001, Civil Lines, Jabalpur, MP 482001, India +91 76 12 628154"],
										[new google.maps.LatLng(23.194023,79.912512),"Swastik Multispecialty Hospital and Research Centre Madhya Pradesh State Highway 37, Vijay Nagar, Raksha, MP 482002, India  +91 76 12 640639 ?  www.swastikhospitaljbp.com"],
										[new google.maps.LatLng(23.175970,79.946318),"Dube Surgical and Dental Hospital Belbaag-Gurandi Rd, Anwar Ganj, Jabalpur, MP 482002, India ? +91 97 13 955558  www.dsdhospital.com"]],
							"airport":new google.maps.LatLng(23.184171,80.059291),
							"busstand":new google.maps.LatLng(23.187728,79.929720),
							"railwaystation":new google.maps.LatLng(23.164805,79.950397),
							"highcourt":new google.maps.LatLng(23.168307,79.947600)
						};
				var res="<%=res%>";
				if(res==="hospitals")
				{
					for(var i=0;i<5;i++)
					{
						var marker = new google.maps.Marker({
							position: array[res][i][0],
							map: map,
							title:array[res][i][1],
							icon:"images/LeftPinkPin.png"
						});
					}
				}
				/*else if(res==="airport")
				{
					var marker = new google.maps.Marker({
						position: array[res],
						map: map,
						title:res,
						icon:"images/LeftPinkPin.png"
					});	
				}
				else if(res==="busstand")
				{
					var marker = new google.maps.Marker({
						position: array[res],
						map: map,
						title:res,
						icon:"images/LeftPinkPin.png"
					});
				}
				else if(res==="railwaystation")
				{
					var marker = new google.maps.Marker({
						position: array[res],
						map: map,
						title:res,
						icon:"images/LeftPinkPin.png"
					});
				}
				else if(res==="highcourt")
				{
					var marker = new google.maps.Marker({
						position: array[res],
						map: map,
						title:res,
						icon:"images/LeftPinkPin.png"
					});
				}
				else
				{
					alert("(*)This part is under construction");
				}
				/*var infoWindowOption={
					content:"<div id='infoWindow' style='width:700px;height:300px;' ><iframe width='100%' height='100%' src="+placeInfo[query]+"></iframe></div>"
				};
				var infoWindow=new google.maps.InfoWindow(infoWindowOption);
					google.maps.event.addListener(marker, 'click', function(){
					infoWindow.open(map,marker);
				});*/
			}
			google.maps.event.addDomListener(window, 'load', setMarker);
		</script>
	</div>
	<div class="footer">
		Copyright © Web Team
	</div>
</body>
</html>