<!--DOCTYPE html-->
<%@ page import="java.io.File,java.io.FileReader,java.io.BufferedReader" %>
<%!
	String query;
	String path_home;
	String path_WEBINF;
%>
<%@ include file="WEB-INF/jsp/route.jsp" %>
<%
	query=request.getParameter("query");
	path_home=getServletContext().getRealPath("/").replace('\\','/');
	path_WEBINF=getServletContext().getRealPath("WEB-INF/").replace('\\','/');
	session.setAttribute("path_home",path_home);
	session.setAttribute("path_WEBINF",path_WEBINF);
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
	<script src="js/map_import.js" type="text/javascript" ></script>
	<title>JBP Darshan</title>

</head>
<body style="background-color:#F3F3F3" onLoad="init()" >
<%@ include file="background.jsp" %>
<%
	if(query==null||searchPlaces(query))
	out.println("<!--");
%>
	<div class="nav">
		<%
			String path="";
			if(query!=null&&!query.equals(""))
			{
				String temp[]=query.split(" ");
				int len=temp.length;
				int i=0;
				while(i<len)
				path+=temp[i++];
				out.print("<p><center><font size='4px' color='blue' face='verdana'>"+query.toUpperCase()+"</font></center></p><br>");
				try
				{
					File file=new File(path_WEBINF+"/routes/"+path+".html");
					if(!file.exists())
					out.println("Route Or Place Doesn't exist");
					BufferedReader br=new BufferedReader(new FileReader(file));
					/*int c,count=0;
					while((c=br.read())!=-1)
					{
						char ch;
						ch=(char)c;
						if(count==0&&ch=='\n')
						count=1;
						if(count!=0)
						{
							if(ch=='\n')
							out.print("<br>");
							out.print(ch);
						}
					}*/
					String str=br.readLine();
					while((str=br.readLine())!=null)
					{
						out.println(str+"<br>");
					}					
				}
				catch(Exception e)
				{
					out.println("Nothing Entered");
				}
			}
		%>
	</div>
<%
	if(query==null||searchPlaces(query))
	out.println("-->");
%>
	<div id="<%=mapId()%>" class="<%=mapClass()%>">
		<%
			path="";
			if(query!=null&&!query.equals(""))
			{
				String temp[]=query.split(" ");
				int len=temp.length;
				if(query.indexOf(" to ")!=-1)
				{
					int i=0;
					while(i<len)
					path+=temp[i++];
					path=path.toLowerCase();
					try
					{
						File file=new File(path_WEBINF+"/routes/"+path+".html");
						if(!file.exists())
						out.println("Route Or Place Doesn't exist");
						BufferedReader br=new BufferedReader(new FileReader(file));
						out.println(""+br.readLine());
					}
					catch(Exception e)
					{
						out.println("Nothing Entered");
					}
				}
				else
				{
		%>
					<script>
						function setMarker() {
						var query="<%=query%>";
						var my=new google.maps.LatLng(23.15107,79.94865);
						var LatLng = {
										"sadar":new google.maps.LatLng(23.15107,79.94865),
										"russel chowk":new google.maps.LatLng(23.16327,79.93683),
										"samdariya mall":new google.maps.LatLng(23.16877,79.93335),
										"dumna airport":new google.maps.LatLng(23.18417,80.05929),
										"south avenue mall":new google.maps.LatLng(23.15648,79.94859),
										"iiitdm jabalpur":new google.maps.LatLng(23.17829,80.02538),
										"railway station":new google.maps.LatLng(23.15918,79.95599),
										"bhedaghat":new google.maps.LatLng(23.13059,79.80236),
										"khamaria":new google.maps.LatLng(23.21393,80.03680)
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
							title:query,
							icon:"images/OutsidePink.png"
					  });
						var placeInfo = {
											"sadar":"Places_Information/sadar.html",
											"russel chowk":"Places_Information/russel.html",
											"samdariya mall":"Places_Information/samdariyamall.html",
											"dumna airport":"http://en.wikipedia.org/wiki/Jabalpur_Airport",
											"south avenue mall":"http://www.southavenuemall.com/",
											"iiitdm jabalpur":"http://www.iiitdmj.ac.in/",
											"railway station":"http://en.wikipedia.org/wiki/Jabalpur_Junction_railway_station",
											"bhedaghat":"http://en.wikipedia.org/wiki/Bhedaghat",
											"khamaria":"http://en.wikipedia.org/wiki/Khamaria,_Jabalpur"
										}
						var infoWindowOption={
							content:"<div id='infoWindow' style='width:700px;height:300px;' ><iframe width='100%' height='100%' src="+placeInfo[query]+"></iframe></div>"
						};
						var infoWindow=new google.maps.InfoWindow(infoWindowOption);
						google.maps.event.addListener(marker, 'click', function(){
							infoWindow.open(map,marker);
						});
					}
					google.maps.event.addDomListener(window, 'load', setMarker);
				</script>
		<%
				}
			}
		%>
	</div>
	<div class="footer">
		Copyright © Web Team
	</div>
</body>
</html>