<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<title>Zenei kérdőív - példa</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Zenei kérdőív - Mindjárt kezdjük!</h2>
		</div>
	</div>

	<div id="container">
	
		<div>
			<h3>Látod, nem is volt olyan nehéz! ☺</h3>
			<br>
			<br>
			<br>
			<h3>
				Sok sikert kivánok a teszt kitöltéséhez és KÖSZÖNÖM, hogy segíted a munkám!
			</h3>
		</div>
		
		<div>
			<form:form action="${pageContext.request.contextPath}/zene/next-">
						<input type="submit" value="Tovább" class="button" />
			</form:form>
		</div>
		
		<div style="clear; both;"></div>
	
	</div>
	<br>
	<br>
	<br>
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Kijelentkezés" class="add-button" />
	
	</form:form>

</body>

</html>










