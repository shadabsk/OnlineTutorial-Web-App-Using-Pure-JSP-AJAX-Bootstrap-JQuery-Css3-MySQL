<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title> Reset Password</title>
		<link rel="stylesheet" type="text/css" href="../../Css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="../../Css/glyphicon.css">
		<link rel="stylesheet" type="text/css" href="../../Css/style.css">
		<script src="../../Js/jquery-3.3.1.min.js"></script>
		<style type="text/css">
			body{
			    background-color: #2E8B57;
			 }
			.main1 form div
			{
				position: relative;
			}
			.main1 form div span#abc
			{
				position: absolute;
				top: 100px;
				pointer-events: none;
				left: 30px;
				transition: .3s;
			}
			.main1 input:focus ~span#abc,
			.main1 input:valid ~span#abc
			{
				right: 20;
				top: 90px;
				color: rgb(66,133,244);
				font-size: 12px;
				font-weight: bold;
			}
			.form-group {
				position: relative
			}
			.form-group input[type="password"] {
				padding-right: 30px
			}
			.form-group .glyphicon{
				right: 65px;
				position:absolute;
				top:82px;	
			}
			span:hover{
				cursor: pointer;
			}
			input[type="submit"]:hover{
				cursor:pointer;
			}
		</style>
</head>

	<body>
		<div class="main1">
			<form method="post" action=''>
				<fieldset>
					<center><span class="glyphicon glyphicon-user usercir " style="font-size:60px;"></span></center>

					<center>
						<label style="font-size:17pt; width:200	px;">Reset Password</label>
					</center>
					
					<br>
					<div>
						<br>
					  	<input id="password-field" type="password"  name="repass" class="inputText" style=""required/>
					  	<span toggle="#password-field" class="toggle-password glyphicon glyphicon-eye-open " style="left:-20px;"></span>		  	
					  	<span id="abc">Password</span>
					</div>
					<br>
					<input type="submit" name="next2" value="Reset">
					 <div id='div1' style='display:none;color: red;margin-left:30px;';>
                        Successfully updated!!!Redirecting in a bit
                    </div>
				</fieldset>
			</form>

			<script>
				$(".glyphicon-eye-open").on("click", function() {
					$(this).toggleClass("glyphicon-eye-close");
					var type = $("#password-field").attr("type");
					if (type == "text"){ 
						$("#password-field").prop('type','password');}
					else{ 
						$("#password-field").prop('type','text'); }
					});
			</script>
		</div>
	</body> 	

</html>
 <%@ include file="Connection.jsp" %>

<%
String a=request.getParameter("repass");
String name=(String)session.getAttribute("sessname");
int updateQuery = 0;
if(a!=null ){
    try{
        String query="update users set Password=? where Username='"+name+"'";
        ps=connection.prepareStatement(query);
        ps.setString(1,a);
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){%>

             <script>
                $(document).ready(function(){
                        $('#div1').show();
                    });
              setTimeout(function() {
                  document.location = "login-form.jsp";
              }, 3000); // <-- this is the delay in milliseconds
            </script>
   <%     }
    }catch(Exception ex){
        out.println("Your Connection: "+ex);
    }finally{
        ps.close();
        connection.close();
    }
}
%>