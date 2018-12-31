<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<script src="Js/jquery-3.3.1.min.js"></script>
	<script src="Js/Facultydet.js"></script>
	<style type="text/css">
	.security{
		background-color: white;
		height: 620px;
		position: fixed;
		background-size: 100%;
		left: 0;
		right: 0;
		z-index: -1;
		opacity: 0.2;
	}	
	.container{
	top: 14em;
	position: relative;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.5), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	width: 30%;
	}
	
	
	</style>
</head>
<body>
<%String name=(String)session.getAttribute("sessname"); %>
	<div class="security">
		
	</div>
	
	<div class="container">
		<form method="post" id="sign" action="">
	
			<legend style="text-align: center;">
					Change Password
			</legend>
			<div class="form-group">
					<input type="password" name="fcpass" placeholder="Password" class="form-control" required="">
			</div>
			<div class="form-group">
					<input type="password" name="fcrepass" placeholder="Confirm Password" class="form-control" required="">
			</div>
			<button id='change'name="change" value="Change" class="btn btn-primary form-control" onClick="javascript:location.href='FacultyDash.jsp'">Change</button>
			<br>
			<br>
			</form>
		
	</div>
	
	
</body>
</html>