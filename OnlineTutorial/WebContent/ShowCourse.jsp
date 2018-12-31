
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.lang.*"%>
<%@ include file="JSP/Connection.jsp" %>


<!DOCTYPE html>
<html>
<head>
	<title>Course</title>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<script src="Js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<script src="Js/jquery-3.3.1.min.js"></script>
  	<script src="ckeditor/ckeditor.js"></script>
  	<script src="Js/cselect.js"></script>
  	<script src="Js/chooseCO.js"></script>
	<style type="text/css">
		.row{
			margin-top: 50px;
			margin-left: 5%;
		}
	</style>
</head>
<body>
<div class="container">
	<legend>
		<center>Courses Overview</center>
	</legend>
	<div class="row">
	<%	
		String Data = "select * from course";
		rs = statement.executeQuery(Data);
		while (rs.next()) {
		%>
  		<div class="col-lg-6 col-sm-6" style="margin-top: 40px;">
		    <div class="card">
		      <div class="card-body">
		      <div class="button-container">
		        <h5 class="card-title"><b><%=rs.getString("CName")%></b></h5>
		        <p class="card-text"><b>Course Duration</b>:<%=rs.getString("CDuration")%></p>
		        <p class="card-text"><b>Course Outcome</b> : <%=rs.getString("COutcome")%></p>
		        <p class="card-text"><b>Course Pre-Requisitise</b> :<%=rs.getString("CPreq")%></p>
				<center><button id=<%= rs.getString("CName")%> class="btn btn-primary" value="Submit" style='width:300pt;'>Enroll for this course</button></center>
		    	</div>
		      </div>
		    </div>
		  </div>
	<%}
%>
	</div>
	
	<br>
	
	<br><br>
	
				
				<br><br>
				<div id="Contents" style="display:none">
					
					</div>
					<div id="regmsg"></div>
					<br>
			
	</div>

<br>
<script type="text/javascript">
$("body").on( "click", ".button-container button", function(){
	var details=(this.id);
	var details = confirm("Are you sure you want to take "+details);
    if (details == true) {
       window.location.href = "http://localhost:8080/OnlineTutorial/JSP/Course/courseenroll.jsp?details=" + (this.id) ;
    } else {
        
    }
	
	
	
}); 
</script>	
</body>
</html>
