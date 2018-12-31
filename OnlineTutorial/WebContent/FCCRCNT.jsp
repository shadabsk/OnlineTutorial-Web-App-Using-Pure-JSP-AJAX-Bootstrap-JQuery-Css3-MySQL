<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="Css/slide2.css">
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<script src="Js/jquery-3.3.1.min.js"></script>
  	<script src="ckeditor/ckeditor.js"></script>
  	<script src="Js/cselect.js"></script>
  	<script src="Js/Syllabus.js"></script>
  <style>
  textarea#addcheck{
    font-size: 16px;
    resize: none;
    height: 5em;
    transition: height .3s ease-out;
  }
    textarea:focus#addcheck{
    height: 9em;
  }
	.container{
	top: 5em;
	position: relative;
	background-color: white;
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
	margin-bottom: 30pt;

	}

	.security{
		background: url(Images/Registration/bk_reg.jpg);
		height: 620px;
		position: fixed;
		background-size: 100%;
		left: 0;
		right: 0;
		top: 0;
		z-index: -1;
		opacity: 0.7;
		background-repeat: no-repeat;
	}
  </style>
</head>
<body>
	<div class='security'>

	</div>
	<div class="container col-lg-9 col-md-6 col-sm-4 ">
		<form method="post" id="sign" action="">
			<fieldset class="col-lg-12 col-md-6 col-sm-6">
				<center>
					<legend>
						Select Course
					</legend>
				</center>
					 <%@ include file="JSP/Connection.jsp" %>
					<%
					String CNAME=null;
					String name=(String)session.getAttribute("sessname");
					String c_name = "select CName from course where CID in (select CID from teaches where FID in (select FID from faculty where username='"+name+"'))";
					ps=connection.prepareStatement(c_name);
					rs = ps.executeQuery();
					%>
					<select name='cname' class='form-control'>
					<option>Select Course</option>
					<%
					while (rs.next()) {
					%>
						<option value= <%=rs.getString("CName") %>><%=rs.getString("CName") %></option>";
					<%
					}
					%>
					</select>
					<br>
					<center>
					<button id='subm' class="btn btn-primary" value="Submit" style='width:300pt;'>Select</button>
				</center>
				
				<br><br>
					<div id="Contents" style="display:none">
							<div class="form-group" >
	    				<input type="text"  name="chap1"  class="form-control"  placeholder="Chapter Name" />
	  				</div>
					<div class="form-group">
						<textarea  name="topic1"  placeholder="Topics" class="form-control noresize" ></textarea>
					</div>
					<div class="form-group">
					<label for='editor1'>Enter The contents</label>
					<textarea  class="ckeditor" name="editora" style="margin-top:2%;"></textarea>
					</div>
					<div class="form-group">
					
					<input type="button" value="Upload Media" class="btn btn-default" onclick="MyWindow=window.open('JSP/Course/FileUpload.jsp','MyWindow',width=720,height=120); return false;"></input>
					
				</div>
					<div class="form-group">
						<input type="text"  name="wt1"  placeholder="Weightage" maxlength="2"  class="form-control" />
					</div>
					

					<center>
						<input type="submit" id="submitform" class="btn btn-primary" value="Submit" style='width:300pt;'>
					</center>
					</div>
					<div id="regmsg"></div>
					<br>
			</fieldset>
		</form>
	</div>

	
</body>
</html>
