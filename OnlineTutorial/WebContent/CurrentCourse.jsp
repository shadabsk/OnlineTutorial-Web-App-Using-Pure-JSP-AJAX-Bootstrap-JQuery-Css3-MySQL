<%@page import="java.sql.*"%>
<%@ include file="JSP/Connection.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="Css/slide2.css">
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<script src="Js/jquery-3.3.1.min.js"></script>
  	<script src="ckeditor/ckeditor.js"></script>
  	<script src="Js/Cselect.js"></script>
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
		background: url(Images/Registration/bk_Reg.jpg);
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

	
	input[type='button']{
			text-align: center;
			background-color:#343a40;
			width: 100px;
			height: 50px;
			color: white;
			border: 1px solid #4f5f5f;
			margin-bottom: 0px; 
			font-size: 14pt;
			border-radius: 5px;

		}
	input[type='button']:hover
		{
			background-color: orange;
			cursor: pointer;
		}
	

	
  </style>
</head>
<body>
	<div class='security'>

	</div>
	<div class="container col-lg-9 col-md-6 col-sm-4 ">
							<table class="table" id='example'>

							<tr>
								<th>Topic</th>
								
								<th>Weightage</th>
								<th>Name</th>
								
							</tr>
						<%
						String name=(String)session.getAttribute("sessname");
						String Topic=null;
						String Weigh=null;
						String Chap=null;
						String query = "select *from tutorial where CID in (select CID from takes where RNO in (select RNO from student where Username='"+name+"')) order by Name";
						ps=connection.prepareStatement(query);
						rs = ps.executeQuery();
						while (rs.next()) {
							Topic=rs.getString("Topic");
							Weigh=rs.getString("Weightage");
							Chap=rs.getString("Name");
						%>
							<tr ">
							<td><%= Topic %></td>
							
							<td><%= Weigh %></td>
							<td ><%= Chap %></td>
							
							<td><input value='Get Details' type='button' class='theButton' id='ma' onclick='test()'></td>
							</tr>
							<%
						}
						%>
						</table>

					<center>
						
					</center>
					</div>
					<div id="regmsg"></div>
					<br>
			</fieldset>
		</form>
		
	</div>
	
</body>
</html>
<script type="text/javascript">
function test(){
$(document).find('.theButton').on('click',function(){
    var age = $(this).parents('tr:first').find('td:eq(0)').text();
    
     window.open ( "http://localhost:8080/OnlineTutorial/Contents.jsp?age=" + age,'_blank') ;
});
}
</script>
