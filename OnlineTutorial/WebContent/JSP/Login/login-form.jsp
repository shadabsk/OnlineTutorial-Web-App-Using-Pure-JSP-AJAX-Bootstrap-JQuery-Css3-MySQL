<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" href="../../Css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="../../Css/glyphicon.css">
	    <link rel="stylesheet" type="text/css" href="../../Css/style.css">
	    <script src="../../Js/jquery-3.3.1.min.js"></script>
	    <script src="../../Js/bootstrap.min.js"></script>
	    <style>
	    	body{
	    		background-color: #2E8B57;
	    	}
	    	.main form div
			{
				position: relative;
			}

			.main form div#notvalid
			{
				margin-left: 30px;
				width: 270px;
				color: red;
			}
			.main form div#valid
			{
				margin-left: 30px;
				width: 270px;
				color: green;
			}
			.main form div span#abc1
			{
				position: absolute;
				top: 80px;
				pointer-events: none;
				left: 30px;
				transition: .3s;
			}
			.main input:focus ~span#abc1,
			.main input:valid ~span#abc1
			{
				right: 20;
				top: 60px;
				color: rgb(66,133,244);
				font-size: 12px;
				font-weight: bold;
			}

			.main form div
			{
				position: relative;
			}
			.main form div span#abc
			{
				position: absolute;
				top: 40px;
				pointer-events: none;
				left: 30px;
				transition: .3s;
			}
			.main input:focus ~span#abc,
			.main input:valid ~span#abc
			{
				right: 20;
				top: 20px;
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
				position:absolute;
				top:40px;
				right: 60px;	
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
		<div class="main" style="margin-top: 8%;">
			<form method="post" action="">
				<fieldset>
					<center><span class="glyphicon glyphicon-user usercir " style="font-size:60px;"></span></center>
					<center><label style="font-size:20pt; width:90px;">Login</label></center>
					<br>
					<div >
					  	<input type="text" name="uname" class="inputText" required/>
					  	<span id="abc1">Username</span>
					</div>
					<div class='form-group'>
									<input id="password-field" type="password"  name="upass" class="inputText" required style="margin-top: 30px;">
									 <span id='abc' style="margin-bottom: 50px;">Password</span>
									 <span class="glyphicon glyphicon-eye-open" ></span>
									 
					</div>
					<div id="valid"></div>
					<div id="notvalid"></div>
					<a href="reset.jsp" class="ref1 btn btn-link" >ForgotPassword?</a>
					<br>
					<input type="submit" name="submit" value="Login">
					</div>
				</fieldset>
			</form>
		</div>

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
						</form>
					</div>

			
				
	</body>
</html>


<script>
		$(document).ready(function() { 
			setTimeout(function() { 
				$('#div1').fadeOut(); 
		 }, 2000); 
		});
</script>   
</html>

<%@ include file="Connection.jsp" %>
<%
try{
	String username=request.getParameter("uname");
	String pass=request.getParameter("upass");
	String dbname=null;
	String dbpass=null;
	String Data = "select * from users where Username=? and Password=? ";
	ps=connection.prepareStatement(Data);
	ps.setString(1,username);
	ps.setString(2,pass);
	rs = ps.executeQuery();
	while (rs.next()) {
	dbname=rs.getString("Username");
	dbpass=rs.getString("Password");
	}

	if(username.equals(dbname)&&pass.equals(dbpass)){
		String Grpname=null;
		String FClg=null;
		String SClg=null;
		String query = "select GroupName from belongs where Username=?";
		ps=connection.prepareStatement(query);
		ps.setString(1,username);
		rs = ps.executeQuery();
		while (rs.next()) {
			Grpname=rs.getString("GroupName");
		}
		if("Admin".equals(Grpname)){
			session.setAttribute("sessname",username); 
			
		%>
			<script>
			$(function () {
				$('#valid').html('<center><div>Successfully logged in</div></center>').fadeIn().delay(3000).fadeOut();
			});
			  setTimeout(function() {
			      document.location = "../../AdminDash.jsp";
			  }, 3000); 
			</script>
		
	<%
		}
		else if("Faculty".equals(Grpname)){
			String logincheck = "select LastModified from faculty where Username=?";
			ps=connection.prepareStatement(logincheck);
			ps.setString(1,username);
			rs = ps.executeQuery();
			while (rs.next()) {
				FClg=rs.getString("LastModified");
			}
			
			if(FClg!=null){
			session.setAttribute("sessname",username); 
			
		%>
			<script>
			$(function () {
				$('#valid').html('<center><div>Successfully logged in</div></center>').fadeIn().delay(3000).fadeOut();
			});
			  setTimeout(function() {
			      document.location = "../../FacultyDash.jsp";
			  }, 3000); 
			</script>
			
		
	<%
			}
			else{
				session.setAttribute("sessname",username); 
				
				%>
					<script>
					$(function () {
						$('#valid').html('<center><div>Seems this is the first time you are logging in</div></center>').fadeIn().delay(3000).fadeOut();
					});
					  setTimeout(function() {
					      document.location = "../../FirstLoginFC.jsp";
					  }, 3000); 
					</script>
				<%
			}
		}
		else{
			String logincheck1 = "select Username from Student where Username=?";
			ps=connection.prepareStatement(logincheck1);
			ps.setString(1,username);
			rs = ps.executeQuery();
			while (rs.next()) {
				SClg=rs.getString("Username");
			}
			
			if(SClg!=null){
			session.setAttribute("sessname",username); 
			
		%>
			<script>
			$(function () {
				$('#valid').html('<center><div>Successfully logged in</div></center>').fadeIn().delay(3000).fadeOut();
			});
			  setTimeout(function() {
			      document.location = "../../StudentDash.jsp";
			  }, 3000); 
			</script>
			
		
	<%
			}
			else{
				session.setAttribute("sessname",username); 
				
				%>
					<script>
					$(function () {
						$('#valid').html('<center><div>Seems this is the first time you are logging in</div></center>').fadeIn().delay(3000).fadeOut();
					});
					  setTimeout(function() {
					      document.location = "../../ShowCourse.jsp";
					  }, 3000); 
					</script>
				<%
			}
		
		}
	}
	else{%>
			
			<script type="text/javascript">
			$(function () {
					$('#notvalid').html('<div>Username and password didnt match</div>').fadeIn().delay(3000).fadeOut();
				});
			</script>
		
<%		
	}
}
    catch(Exception e){
        e.printStackTrace();
    }
%>