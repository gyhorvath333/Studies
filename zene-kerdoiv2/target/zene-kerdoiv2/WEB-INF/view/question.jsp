<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

	<% String userName=(String)session.getAttribute("userName"); %>
	<% int qa=(int)request.getAttribute("qa"); %>
	<% int qf=(int)request.getAttribute("qf"); %>
	<% String qt=(String)request.getAttribute("qt"); %>
<head>
	<title>Zenei kérdőív - Éles kérdés</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Zenei kérdőív - ${question.title}   ${question.subId}</h2>
			<h3>Kitöltő: <security:authentication property="principal.username" /></h3>
			<security:authorize access="hasAnyRole('ADMIN')">
			<h3>Helyes válasz: ${question.right} </h3>
			</security:authorize>
		</div>
	</div>
	<input type="hidden" id="play1" value="0">
	<input type="hidden" id="play2" value="0">

	<div id="container">
		<h3><% switch(qt)  {
		case "Dallam": %>Azonos-e a két dallam?<%;
		break;
		case "Hangmagasság": %>A két hang közül melyik a magasabb? Esetleg azonosak?<%;
		break;
		case "Hangerő": %>A két hangminta közül melyik a hangosabb?<%;
		break;
		case "Ritmus": %>Ugyanaz a ritmus szól-e a két hangmintán?<%;
		break;
		case "Tempó": %>A két ritmus közül melyik a gyorsabb? Esetleg azonosak?<%;
		break;
		case "Hangszín": %>Azonos vagy különböző hangszerek játsszák a hangzatokat?<%;
		break;
		default: %><%;
		break;
		}%></h3>
		
		<table>
			<tr>
					<th style="float:center">A minta</th>
					<%if (qf==2) { %>
					<th style="float:center">B minta</th>
					<%} %>
			</tr>
			<tr>
				<td style="float:center">
					<audio id="song1" src="${pageContext.request.contextPath}/resources/voices/${question.title}/${question.filePath1}"></audio>
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
				<%if (qf==2) { %>
				<td style="float:center">
					<audio id="song2" src="${pageContext.request.contextPath}/resources/voices/${question.title}/${question.filePath2}"></audio>
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
				<%} %>	
			</tr>
		</table>
		<br>
		<br>
		<br>
		<table>
			<tr>
				<td style="float:center">
					<form:form action="${pageContext.request.contextPath}/zene/next-${question.answer1}">
						<input type="submit" value="${question.answer1}" class="button" />
					</form:form>
				</td>
				<td style="float:center">
					<form:form action="${pageContext.request.contextPath}/zene/next-${question.answer2}">
						<input type="submit" value="${question.answer2}" class="button" />
					</form:form>
				</td>
				<%if (qa==3) { %>
				<td style="float:center">	
					<form:form action="${pageContext.request.contextPath}/zene/next-${question.answer3}">
						<input type="submit" value="${question.answer3}" class="button" />
					</form:form>
				</td>
			<% }%>
			</tr>
		</table>	
		<div style="clear; both;"></div>
	
	</div>
	
	<br>
	<br>
	
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Kijelentkezés" class="add-button" />
	
	</form:form>

</body>

</html>










