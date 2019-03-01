<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<title>Zenei kérdőív - köszöntő</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Zenei kérdőív - <security:authentication property="principal.username" /></h2>
		</div>
	</div>

	<div id="container">
	
		<div>
			A zenei képességeidnek hat területét fogjuk lemérni.
			Mind a hat esetben nagyon egyszerű kérdésekre kell majd választ adnod.
			A hangszóró ikonra kattintva fogod tudni lejátszani a zenét vagy hangokat.
			Ha meghallgattad őket, akkor fogsz tudni válaszolni a kérdésekre.	
		</div>
		
		<h3>Próbáld is ki!</h3>
	
			<audio id="song1" src="${pageContext.request.contextPath}/resources/voices/Dallam/5A.mp3"></audio>
					<p align="center">
					<button onclick="play1()">
						<img src="${pageContext.request.contextPath}/resources/voices/Hangszoro.png" style="width:50px">					
					</button>
					</p>
					<script type="text/javascript">
						function play1() {
							document.getElementById("song1").play();
						}
					</script>
		
		<div>
		Kérlek használj fülhallgatót!
		Egyrészt, így a társaidat nem zavarod, másrészt jobban hallod a mintákat.
		</div>
		
		<div>
		Minden feladatnál két hangmintát vagy hangot kell összehasonlítanod.
		A legtöbb esetben meg kell majd állapítanod, hogy a két hangminta azonos vagy különböző, de lesz olyan feladat, ahol háromféle kimenetel lehetséges.
		A legtöbb feladatnál két lejátszó lesz a képernyőn. A <img src="${pageContext.request.contextPath}/resources/voices/Hangszoro.png" style="width:20px">-ra kattintva indíthatod el a minták lejátszását.
		<h3>Nagyon fontos, hogy minden mintát csak egyszer tudsz meghallgatni, ezért nagyon figyelj!</h3>
		
		</div>
	
		<h3>Lássunk egy példát!</h3>
		
		
		<div>
			<form:form action="${pageContext.request.contextPath}/zene/pelda">
						<input type="submit" value="Tovább" class="button" />
			</form:form>
		</div>
		
		<div style="clear; both;"></div>
	
	</div>

</body>

</html>










