<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>
	<title>Válaszadók listája</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Zenei kérdőív - válaszadók listája</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
			<p>
				Felhasználó: <security:authentication property="principal.username" />, Szerep: <security:authentication property="principal.authorities" />
			</p>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>Válaszadó sorszám</th>
					<th>Kor</th>
					<th>Évfolyam</th>
					<th>Ének-zene órák száma</th>
					<th>Válaszok száma</th>
					<th>Utolsó válasz ideje</th>
					
					
					<%-- Only show "Action" column for admin --%>
					<security:authorize access="hasAnyRole('ADMIN')">
					
						<th>Művelet</th>
					
					</security:authorize>
					
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempResp" items="${respondents}">					

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/admin/delete">
						<c:param name="respId" value="${tempResp.id}" />
					</c:url>					
					
					<tr>
						<td> ${tempResp.id} </td>
						<td> ${tempResp.age} </td>
						<td> ${tempResp.year} </td>
						<td> ${tempResp.studies} </td>
						<td> ${tempResp.answer} </td>
						<td> ${tempResp.time} </td>
						

						<security:authorize access="hasAnyRole('ADMIN')">
						
							<td>	
								<security:authorize access="hasAnyRole('ADMIN')">
									<a href="${deleteLink}"
									   onclick="if (!(confirm('Biztosan törölni szeretnéd ezt a válaszadót?'))) return false">Törlés</a>
								</security:authorize>
							</td>

						</security:authorize>
												
					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>
	
	<p></p>
	
	<form:form action="${pageContext.request.contextPath}/admin/export" method="POST">
	
		<input type="submit" value="Eredmények exportálása" class="add-button" />
	
	</form:form>
	<br>
	<br>	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
	
		<input type="submit" value="Kijelentkezés" class="add-button" />
	
	</form:form>
	
</body>

</html>









