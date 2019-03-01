<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
			<h2>Zenei kérdőív - Ritmus megkülönböztetése</h2>
			<h3>Kitöltő: <security:authentication property="principal.username" /></h3>
		</div>
	</div>
	<input type="hidden" id="play1" value="0">
	<input type="hidden" id="play2" value="0">

	<div id="container">
	
		
		<h3>Azonos a két ritmus?</h3>
		
		<table style="float:center" >
			<tr>
					<th>A minta</th>
					<th>B minta</th>
			</tr>
			<tr>
				<td style="float:center">
					<audio id="song1" src="${pageContext.request.contextPath}/resources/voices/Ritmus/5A.mp3"></audio>
					<p align="center">
					<button onclick="play1()">
						<img src="${pageContext.request.contextPath}/resources/voices/Hangszoro.png" style="width:50px">					
					</button>
					</p>
					<script type="text/javascript">
						function play1() {
							if(document.getElementById("play1").value=="0") {
								document.getElementById("play1").value="1";
								document.getElementById("song1").play();
							}
						}
					</script>
				</td>
				<td style="float:center">
					<audio id="song2" src="${pageContext.request.contextPath}/resources/voices/Ritmus/5B.mp3"></audio>
					<p align="center">
					<button onclick="play2()">
						<img src="${pageContext.request.contextPath}/resources/voices/Hangszoro.png" style="width:50px">					
					</button>
					</p>
					<script type="text/javascript">
						function play2() {
							if(document.getElementById("play2").value=="0") {
								document.getElementById("play2").value="1";
								document.getElementById("song2").play();
							}
						}
					</script>
				</td>	
			</tr>
		</table>
		<br>
		<br>
		<br>
		
		<table>
			<tr>
				<td style="float:center">
					<form:form action="${pageContext.request.contextPath}/zene/jokivansag">
						<input type="submit" value="Azonos" class="button" />
					</form:form>
				</td>
				<td style="float:center">
					<form:form action="${pageContext.request.contextPath}/zene/jokivansag">
						<input type="submit" value="Különböző" class="button" />
					</form:form>
				</td>
			</tr>
		</table>		
		<div style="clear; both;"></div>
	
	</div>
	

</body>

</html>










