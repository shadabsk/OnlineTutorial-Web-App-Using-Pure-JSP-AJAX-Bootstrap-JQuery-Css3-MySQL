<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
	<title>SUpload Median</title>
	<link rel="stylesheet" type="text/css" href="../../Css/bootstrap.css">
	   
	   <script src="../../Js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
	.security{
		background: url(../../Images/Reset/Forgot.jpg);
		height: 620px;
		position: fixed;
		background-size: 100%;
		left: 0;
		right: 0;
		z-index: -1;
		opacity: 0.3;
		background-repeat: no-repeat;
	}
	.container{
	top: 11em;
	position: relative;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	width: 30%;

	}
	legend{
		text-align: center;
	}
	</style>
</head>
<body>
		<div class="security">
		</div>
		<div class="container">
			<form  method="post" action="FileUpload1.jsp" enctype="multipart/form-data">
				<fieldset class="col-lg-12 col-md-6 col-sm-6">
					<legend>
							Upload Media less than 5 mb
					</legend>
					<div class="form-group">
						<input type="file" name="file" class="form-control" required="" placeholder="Username">
					</div>
				
					<div id='div1' style='display:none;color: red;margin-left:30px;';>
                        No such records found!
                    </div>
                    <br>
						<input type="submit" name="submit" class="form-control btn btn-primary" value="Send">

						
				</fieldset>
				<br>
			</form>
		</div>

</body>
</html>