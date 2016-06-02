<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page import="java.io.InputStream" %>
<%@page import="java.util.Properties" %>
<%@ page import="com.program.weather.constant.Constant" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<spring:url value="/resources/css/main.css" var="mainCss" />
	<spring:url value="/resources/js/jquery-1.10.1.min.js" var="jqueryJs" />
	<spring:url value="/resources/js/moment.js" var="momentJs" />
	
	<title>View Current Weather page</title>
	
	<link href="${mainCss}" rel="stylesheet" />
	<script src="${jqueryJs}"></script>
	<script src="${momentJs}"></script>
</head>
<body>
		<h1>Current Weather of ${city} : </h1> 
		<table class="rwd-table">
		  <tr>
		    <th>City</th>
		    <td id="city">${city}</td>
		  </tr>
		  <tr>
		    <th>Updated time</th>
		    <td id="updateTime"> .... </td>
		  </tr>
		  <tr>
		    <th>Weather</th>
		    <td id="weather"></td>
		  </tr>
		  <tr>
		    <th>Temperature</th>
		    <td id="temperature"> .... </td>
		  </tr>
		  <tr>
		    <th>Wind</th>
		    <td id="wind"> .... </td>
		  </tr>
		</table>
	<% 
		InputStream  stream = application.getResourceAsStream(Constant.CONFIG_PROPERTIES);
		Properties props = new Properties();
		props.load(stream);
	%>
</body>
 <script>
		var city = document.getElementById("city").innerHTML;
		var api_url = '<%=props.getProperty(Constant.OPENWEATHERMAP_URL) %>' + city +  
						'<%=props.getProperty(Constant.OPENWEATHERMAP_COUNTRY) %>' + 
						'<%=props.getProperty(Constant.OPENWEATHERMAP_APIKEY_NAME) %>' + 
						'<%=props.getProperty(Constant.OPENWEATHERMAP_APIKEY_VALUE) %>';
		console.log('openweathermap api: ');
		console.log(api_url);	
			$.ajax({
				url:api_url,
				method:'GET',
				success : function(data){
					var data = data;
					$('#updateTime').text(moment(data.dt).format("dddd HH:mm A"));
					$('#weather').text(data.weather[0].main);
					$('#temperature').text(Math.round(parseInt(data.main.temp)- 273.15) + " °C");
					$('#wind').text(Math.round((parseInt(data.wind.speed) * 18)/5) + " km/h");
				}
			});
	</script>

</html>
