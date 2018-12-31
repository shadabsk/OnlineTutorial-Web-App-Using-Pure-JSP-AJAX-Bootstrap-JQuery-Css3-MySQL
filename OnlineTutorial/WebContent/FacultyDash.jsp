
<!DOCTYPE html>
<html>
<head>
	<title>Student Dashboard</title>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<script src="Js/jquery-3.3.1.min.js"></script>
	<script src="Js/loadPageFC.js"></script>


	<style type="text/css">
		*{
			margin: 0;
			padding: 0;
		}
		#side
		{
			position: fixed;
			width: 200px;
			height: 100%;
			background-color: black;
			color: white;
			left: -200px;
			transition: all 500ms linear;
		}
		#side.active{
			left: 0px;
		}
		button{
			text-align: left;
			background-color:#343a40;
			width: 200px;
			height: 60px;
			color: white;
			border: 1px solid #4f5f5f;
			margin-bottom: 0px; 
			font-size: 14pt;

		}
		button:hover
		{
			background-color: orange;
			cursor:pointer;
		}
		#side ul li{
			background-color: rgba(255,255,255,255,0.5);
			list-style: none;
			padding: 15px 10px;
			border-bottom: 2px solid rgba(100,100,100,0.9); 
		}


		#side .toggle {
			position: absolute;
			left: 205px;
			top: 20px;
		}
		#side .toggle span{
			display: block;
			width: 33px;
			height: 5px;

			background-color: white;
			margin: 3px 0px;
		}


		#content{
			margin-left: 12%;
			height: 90%;
			width: 80%;
			margin-right: 10px;
		}

		.toggle span:hover{
			cursor: pointer;
			
		}
		button:hover{
			cursor:pointer;
		}
	</style>
</head>
<body>
<div id="side" class="bg-dark" style="width: 18%; float:left">
	<div class="toggle" onclick="toggleside()">
		<span></span>
		<span></span>
		<span></span>
	</div>
	<ul>
		<br>
		<button id='FcPF'>My Profile</button>
		<button id='FcCR'>Course Schema</button>
		<button id='FcCNT'>Course Syllabus</button>
		<button onClick="javascript:location.href='Logout.jsp'">Logout</button>
	</ul>
</div>
	<div id ="content" style="width: 80%; float:right">
		<img src='Images/Bkc.jpg' />
	</div>
	<script src="Js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="Js/misc.js"></script>
	<script src="Js/loadPage.js"></script>
	<script type="text/javascript">
		function toggleside() {
			document.getElementById('side').classList.toggle('active');
		}
	</script>
<?php
}
?>
</body>
</html>