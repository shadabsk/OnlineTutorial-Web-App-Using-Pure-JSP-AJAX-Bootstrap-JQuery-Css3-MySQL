<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<style type="text/css">
	body{
		background-color: #DEB887; 
	}
	.abc{

		top: 5em;
	position: relative;
	background-color: white;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	margin-bottom: 30pt;
	margin-left: 100pt;
	width: 80%;
	}	

	</style>
</head>
<body >
<%@ include file="JSP/Connection.jsp" %>
<%
String cont=null;
String med=null;
String CTopic=request.getParameter("age");
try{
	String query="select *from tutorial where Topic=?";
	ps=connection.prepareStatement(query);
	ps.setString(1,CTopic);
	rs = ps.executeQuery();
	while (rs.next()) {
		cont=rs.getString("content");
		med=rs.getString("Media");
		}
		
}

catch(Exception e){
	
}
%>
<div class='abc'>
				<%=cont %>
				
							
							<center>
							<video width="50%" height="500" controls>
								  <source src="<%=med %>" type="video/mp4">
						
							</video>
						</center>
						<center>
						<div class="alert alert-info"><a href="StudentDash.php">Click here to go back</a></div>
					</center>
</div>

							
						


</body>
</html>
