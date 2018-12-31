<!DOCTYPE html>
<html>
<head>
	<title>Faculty</title>
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="Css/slide2.css">
	<script src="Js/defCR.js"></script>
	<style type="text/css">
	textarea{
	margin-top: 2px;
	margin-left: 0px;
    font-size: 16px;
    resize: none;
    height: 5em;
    }
    textarea:focus{
    transition: height .3s ease-out;	
    height: 9em;
  }
	.course{
		margin-left: 20%;
		width: 50%;
		display: block;
		border: 1px solid black;
		box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		margin-bottom: 30pt;
		margin-top: 50pt;
	}

	</style>
</head>
<body>
		<form id="define" method="POST" class="course">
		
			<fieldset class="col-lg-12 col-md-6 col-sm-6">
				<center>
					<legend>
						Course
					</legend>
				</center>
  				<div class="form-group" >
    				<input type="text"  name="cname"  class="form-control" required=""  placeholder="Course Name" />
  				</div>
  				<div class="form-group" >
  					<label for='cduration'>Duration</label>
    				<input type="text"  name="cduration"  class="form-control" required=""  placeholder="Course Duration" />
  				</div>
  				<div class="form-group" >
    				<textarea  name="cout"  placeholder="Course Outcome" class="form-control noresize" required=""></textarea>
  				</div>
				<div class="form-group">
					<textarea  name="prereq"  placeholder="Pre Requitise" class="form-control noresize" required=""></textarea>
				</div>
				<input type="submit" name="submit" class="btn btn-primary" value="Define">
				<div id="regmsg"></div>
				<br>
			</fieldset>
		</form>
		
	</body>
</html>