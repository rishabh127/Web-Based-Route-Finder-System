<%!
	String[] places={"","sadar","iiitdm jabalpur","dumna airport","bhedaghat","russel chowk","south avenue mall","railway station","bus stand","samdariya mall","khamaria"};
	public String mapClass()
	{
		if(query==null||searchPlaces(query))
		return "map";
		else return "map-changed";
	}
	public String mapId()
	{
		if(query!=null&&!query.equals(""))
		return "googleMap-changed";
		else return "googleMap"; 
	}
	public String queryReturn()
	{
		return query;
	}
	public boolean searchPlaces(String place)
	{
		for(int i=0;i<places.length;i++)
		{
			if(place.equals(places[i]))
			return true;
		}
		return false;
	}
%>