<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<html>

<head>
	<title>Eredmények exportálása</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script>
  		$(function () {
    	$('#datetimepicker1').datetimepicker();
    	$('#datetimepicker2').datetimepicker();
 		});
	</script>
	
</head>

<div class="container">
  <div class="panel panel-primary">
    <div class="panel-heading">Zenei kérdőív - Eredmények exportálása</div>
      <div class="panel-body">
         <div class="row">
            <div class="col-md-6">
               <div class="form-group">
					Felhasználó: <security:authentication property="principal.username" />, Szerep: <security:authentication property="principal.authorities" />
               </div>
            </div>
         </div>
         <form:form action="${pageContext.request.contextPath}/admin/generate" 
						  	   modelAttribute="term"
						  	   class="form-horizontal" method="POST">
            <div class='col-md-6'>
               <div class="form-group">
                  <label class="control-label">Kezdő dátum</label>
                  <div class='input-group date' path="startTime" id='datetimepicker1'>
                     <input type="text" class="form-control" />
                     <span class="input-group-addon">
                     <span class="glyphicon glyphicon-calendar"></span>
                     </span>
                  </div>
               </div>
            </div>
            <div class='col-md-6'>
               <div class="form-group">
                  <label class="control-label">Befejező dátum</label>
                  <div class='input-group date' path="endTime" id='datetimepicker2'>
                     <input type='text' class="form-control" />
                     <span class="input-group-addon">
                     <span class="glyphicon glyphicon-calendar"></span>
                     </span>
                  </div>
               </div>
            </div>
            <input type="submit" class="btn btn-primary" value="Export">
            </form:form>
        </div>
        <form:form action="${pageContext.request.contextPath}/admin/answers" method="GET">
	
			<input type="submit" value="Vissza" class="add-button" />
	
		</form:form>
        <br>
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
	
			<input type="submit" value="Kijelentkezés" class="add-button" />
	
		</form:form>
        
	</div>
</div>

</html>









