<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>
	<title>Zenei kérdőív - köszöntő</title>

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css">
	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">		  


</head>

<body>
	
	<div id="wrapper">
		<div id="header">
			<h2>Zenei kérdőív</h2>
		</div>
	</div>
	
		<security:authorize access="hasAnyRole('ADMIN')">
			
			<input type="button" value="Admin felület"
					   onclick="window.location.href='/zene-kerdoiv2/admin/answers'; return false;"
					   class="add-button"
			/>
			
		</security:authorize>
	
	<div id="container">
		<div id="content">
			<p>
				Kedves <security:authentication property="principal.username" />!
			</p>
			<p>
				A következő kb. 45 percben egy tesztet fogsz kitölteni,
				ami a zenei képességeidet méri fel.
				Tudd, hogy nincsen semmilyen értékelés a teszt végén.
				Mindössze a képességedre vagyunk kíváncsiak,
				nem pedig arra, hogy azok jók-e vagy rosszak,
				de a tesztet lehetőleg igyekezz a legjobb tudásod szerint kitölteni.
			</p>
			<p>
				A regisztráción túl még szeretném, ha megadnál néhány további részletet magadról.
			</p>
		</div>
		<h3>További információk:</h3>
	
		<form:form action="szia2" modelAttribute="respondent" method="POST">

			<!-- need to associate this data with customer id -->
					
			<table>
				<tbody>
					
					<tr>
						<td><label>Kor: </label></td>
						<td><form:input path="age" /></td>
						<td><form:errors path="age" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td><label>Évfolyam (csak egy számot adj meg): </label></td>
						<td><form:input path="year" /></td>
						<td><form:errors path="year" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td><label>Heti óraszám Ének-zenéből: </label></td>
						<td><form:input path="studies" /></td>
						<td><form:errors path="studies" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td><label>Előző félévi érdemjegy Ének-zenéből: </label></td>
						<td><form:input path="note" /></td>
						<td><form:errors path="note" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td><label>Megye, ahol laksz: </label></td>
						<td><form:select path="county">
							<c:forEach items="${counties}" var="county">
								<option value="${county.id}">${county.county}</option>
  							</c:forEach>
							</form:select>	
						</td>
						<td><form:errors path="county" cssClass="error" /></td>
					</tr>
					
					<tr>
						<td><label>Településtípus: </label></td>
						<td><form:select path="type">
							<c:forEach items="${types}" var="type">
								<option value="${type.id}">${type.type}</option>
  							</c:forEach>
							</form:select>	
						</td>
						<td><form:errors path="type" cssClass="error" /></td>
					</tr>

					<tr>
						<td><label>Nem: </label></td>
						<td><form:select path="gender">
								<option value="1">Fiú</option>
								<option value="2">Lány</option>
							</form:select>
						</td>
						<td><form:errors path="gender" cssClass="error" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Mentés" class="save" /></td>
					</tr>

				
				</tbody>
			</table>
		
		
		</form:form>
	
		<div style="clear; both;"></div>
	
	</div>
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Kijelentkezés" class="add-button" />
	
	</form:form>
	<br>
	<br>
</body>

</html>










