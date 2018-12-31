<%@page import="java.sql.*"%>
<%@ include file="JSP/Connection.jsp" %>
<%
String name=(String)session.getAttribute("sessname");
String Data = "select * from users where Username='"+name+"'";
rs = statement.executeQuery(Data);
while (rs.next()) {
%>



<!DOCTYPE html>
<html>
<head>
	<title>
		Profile
	</title>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="Css/slide2.css">
	<style type="text/css">
	img{
		width: 200px;
		height: 200px;
	}

	.form-inline#abc .form-control{
		border-right: 1;
		border-left: 1;
		border-top: 1;
		border-bottom:3; 
	}

	.form-inline#abcd .form-control{
		border-right: 0;
		border-left: 0;
		border-top: 0;
	}
	.container{
	top: 1em;
	position: relative;
	background-color: white;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	margin-bottom:20pt;

	}

	
	input[type='text']:read-only { 
    	background-color: white;
	}

	p#imgabc{
		font-size: 100pt; 
		margin-top: 50pt; 
		margin-left: 40px;
		border-radius: 50%;
		height: 100px;
		width: 200px;
	}

	</style>
</head>
<body>
	<div class="container">
		<div class="profile" style="border: 0px;margin-left: 0px;width: 90%">
			<div class="inp1" style="margin-left: 0px">
				<% String str=rs.getString("username");
					String uname=str.substring(0,1);
				
				%>
				<p id='imgabc' style=""><%=uname%></p>	
				<?php
				}
				?>
			</div>
			<div class="inp2" style="margin-top: 30px;margin-left: 140px;font-size: 13pt;">
				<span ><b>Username:</b><input type="text" class="form-control " style="width:120%;outline: 0;border-width: 0 0 3px;" value='<%=rs.getString("Username")%>' readonly />
				<b>Password:</b>
				<span><input type="text" class="form-control  " style="width:120%;outline: 0;border-width: 0 0 3px;" value='<%=rs.getString("Password")%>' readonly />
				</span>
			</div> 
		</div>

		<label><b>First name</b></label><label style="margin-left: 27%;"><b>Middle Name</b></label><label style="margin-left:25%;"><b>Last Name</b></label>
		<div class="form-inline" id=abc>
			<input type="text"   class="form-control " style="width:32%;" value='<%=rs.getString("Fname")%>' readonly />
			<input type="text"  class="form-control" style="width: 32%;margin-left: 2%;" value='<%=rs.getString("Lname")%>' readonly>
			<input type="text"  class="form-control" style="width: 32%;margin-left: 2%;" value='<%=rs.getString("Mname")%>' readonly>
		</div>
		<br>
		<label><b>Email ID</b></label><label style="margin-left: 50%;"><b>Contact No</b></label>
		<div class="form-inline" id=abcd>
			<input type="text"   class="form-control " style="width:40%;" value='<%=rs.getString("EmailID")%>' readonly />
			<input type="text"  class="form-control" style="margin-left:15%;width: 45%;" value='<%=rs.getString("ContactNo")%>' readonly>
		</div>
		<br>
		<div class="form-group" id=abcd>
		<label><b>Address</b></label>
			<textarea   class="form-control noresize" style="margin-top:1%;margin-left: 0px;background-color: white;" placeholder='<%=rs.getString("Address")%>' readonly></textarea>
		</div>
		<label><b>Date Of Birth</b></label><label style="margin-left: 47%;"><b>Age </b></label>
		<div class="form-inline" id=abcd>
			<input type="text"   class="form-control " style="width:40%;" value='<%=rs.getString("DOB")%>' readonly />
			<input type="text"  class="form-control" style="margin-left:15%;width: 45%;" value='<%=rs.getString("Age")%>' readonly>
		</div>

		<?php
		}
		}	
	}  
	?>
	<br>
	</div>
</body>
</html>
<%
}
%>