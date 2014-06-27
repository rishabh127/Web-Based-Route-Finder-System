<!--DOCTYPE html-->
<%@ page import="java.io.File,java.io.FileReader,java.io.BufferedReader" %>
<%!
	String query;
	String path_home;
	String path_WEBINF;
	String route_no;
%>
<%@ include file="WEB-INF/jsp/route.jsp" %>
<%
	query=request.getParameter("query");
	path_home=getServletContext().getRealPath("/").replace('\\','/');
	path_WEBINF=getServletContext().getRealPath("WEB-INF/").replace('\\','/');
	session.setAttribute("path_home",path_home);
	session.setAttribute("path_WEBINF",path_WEBINF);
	route_no=request.getParameter("route");
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
	<div class="nav">
		<%
			try
			{
				File file=new File(path_WEBINF+"/routes/route"+route_no+".html");
				if(!file.exists())
				{
		%>
					<script type="text/javascript">
						alert("(*)This part is under construction");
					</script>
		<%
				}
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
						out.println(str);
					}					
				}
			catch(Exception e)
			{
				out.println("");
			}
		%>
	</div>
	<div id="googleMap-changed" class="map-changed">
		<%
			try
			{
				File file=new File(path_WEBINF+"/routes/route"+route_no+".html");
				if(!file.exists())
				out.println("Bus Route Doesn't exist");
				BufferedReader br=new BufferedReader(new FileReader(file));
				out.println(""+br.readLine());
			}
			catch(Exception e)
			{
				out.println("");
			}
		%>
	</div>
	<div class="footer">
		Copyright © Web Team
	</div>
</body>
</html>