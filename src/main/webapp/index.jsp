<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Current Weather Based on City</title>
	<spring:url value="/resources/css/main.css" var="mainCss" />
	<spring:url value="/resources/js/jquery-1.10.1.min.js" var="jqueryJs" />
	
	<link href="${mainCss}" rel="stylesheet" />
	<script src="${jqueryJs}"></script>
</head>

<body>
	<form method="post" action="index.jsp" name="weatherOfCity">
		<h2>Choose City
			<select name="cities" id="cityDropdown" onchange="window.location.href=this.value">
				<option value="currentWeather?city=Sydney">Sydney</option>
				<option value="currentWeather?city=Melbourne">Melbourne</option>
				<option value="currentWeather?city=Wollongong">Wollongong</option>
			</select>
			<%
				String city = request.getParameter("cities");
			%>
		</h2>
	</form>
	
	<a id="result"></a>
	<script>
	document.getElementById("cityDropdown").value = '<% out.print(city); %>';
	</script>
</body>
</html>
