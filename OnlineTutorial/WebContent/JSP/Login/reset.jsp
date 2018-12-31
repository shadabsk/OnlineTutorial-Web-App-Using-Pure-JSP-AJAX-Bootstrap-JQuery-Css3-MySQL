<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
	<title>Security Question</title>
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
			<form  method="post" action="" >
				<fieldset class="col-lg-12 col-md-6 col-sm-6">
					<legend>
							Seems that you have Forgotten Your Password! It happens relax
					</legend>
					<div class="form-group">
						<input type="text" name="username" class="form-control" required="" placeholder="Username">
					</div>
				<div class="form-group">
						<select name="rquestion" class="form-control" required="">
							<option value="">Security Question</option>
							<option value="What is Your Pet Name">What is Your Pet Name</option>
							<option value="What is Your Car Numbers">What is Your Car Number</option>
							<option value="What is the first name of your best friend in high school">What is the first name of your best friend in high school</option>
						</select>
					</div>
					<div class="form-group">
						<input type="text" name="ranswer" class="form-control" placeholder="Answer">
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

			


<%@ include file="Connection.jsp" %>
<%

String uname=request.getParameter("username");
String a=request.getParameter("rquestion");
String b=request.getParameter("ranswer");
String que="";
String qans="";
String dbname="";
if(a!=null && b!=null){
  try{
      String query="select Quest,Ans,Username from users where Username='"+uname+"'";
      rs = statement.executeQuery(query);
        while (rs.next()) {

       dbname=rs.getString("Username");
        que=rs.getString("Quest");
        qans=rs.getString("Ans");
       	
          }
      if(b.equals(qans) && a.equals(que) && uname.equals(dbname))
      {
    	session.setAttribute("sessname",uname);   
      	response.sendRedirect("reset2.jsp");
      }
      else
      {%>
      	<script>
      	 $(document).ready(function(){
                      $('#div1').show().fadeIn().delay(3000).fadeOut();
                  });  
            </script>     

       <%}
    
    }catch(Exception ex){
        out.println("Your Connection: "+ex);
    }finally{
        connection.close();
    }
}
%>