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
			</select>
		</h2>
	</form>
	
	<a id="result"></a>
	<script>
	
	//list of city value based on openWeatherMap json data
	var json = [{"_id":2147714,"name":"Sydney","country":"AU","coord":{"lon":151.207321,"lat":-33.867851}},
	            {"_id":2158177,"name":"Melbourne","country":"AU","coord":{"lon":144.963318,"lat":-37.813999}},
	            {"_id":2171507,"name":"Wollongong","country":"AU","coord":{"lon":150.883331,"lat":-34.433331}}];
	
	//populate list of cities into option of citydropdown element
	$.each(json,function(key,value)
	{
		var newValue="currentWeather?city="+value.name;
		 $("#cityDropdown").append($('<option></option>').val(newValue).html(value.name));
	});

	</script>
</body>
</html>
