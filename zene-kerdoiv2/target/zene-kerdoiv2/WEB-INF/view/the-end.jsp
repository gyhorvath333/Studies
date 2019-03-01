<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<title>Zenei kérdőív - Vége</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Zenei kérdőív - Viszlát!!</h2>
		</div>
	</div>

	<div id="container">
		Köszönöm, hogy kitöltötted!!<br>
		<img src="${pageContext.request.contextPath}/resources/voices/vege.jpg" style="width:400px">
		<div style="clear; both;"></div>
	
	</div>
	
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Kijelentkezés" class="add-button" />
	
	</form:form>

</body>

</html>










