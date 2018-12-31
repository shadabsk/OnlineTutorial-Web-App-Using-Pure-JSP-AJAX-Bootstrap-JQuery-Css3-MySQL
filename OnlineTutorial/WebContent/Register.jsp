
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	
	<link rel="stylesheet" type="text/css" href="Css/slide2.css">
	<link rel="stylesheet" type="text/css" href="Css/bootstrap.css">
	<script src="Js/jquery-3.3.1.min.js"></script>
	<script src="Js/register.js"></script>
  	<script src="Js/misc.js"></script>
	
	<style>
	input[type="submit"]{
    margin-left: 0%;
   
	}
  textarea#addcheck{
    font-size: 16px;
    resize: none;
    height: 5em;
    transition: height .3s ease-out;
  }-
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

	#submit:hover{
		cursor:pointer;
	}
  </style>
</head>
<body>
	<div class='security'>

	</div>
	<div class="container col-lg-9 col-md-6 col-sm-4 ">
		<form method="post" id="sign" action="">
			<fieldset class="col-lg-12 col-md-6 col-sm-6">
				<legend>
						<center>
						Registration
						
						</center>
				</legend>
				<div class="form-group" >
    				<input type="text"  id="user" name="user"  class="form-control" required=""  placeholder="Username">
    				<br>
    				<span id="usererr"></span>
  				</div>
  				<div class="form-group">
					<input type="password"  id="pass" name="pass"   class="form-control"	required="" placeholder="Password" onkeyup="return passwordChanged();"/>
					<span id="strength"></span>
    				
				</div>
  				<div class="form-group">
					<input type="password"    class="form-control" required="" placeholder="Confirm Password" />
					<br>
					<span id="cpasserr"></span>
				</div>	
				<div class="form-inline">
					<input type="text" name="fname"  class="form-control " style="width:32%;" required="" placeholder="First Name" />
					<input type="text" name="mname" class="form-control" style="margin-left: 2%;width: 32%;"  placeholder="Middle Name">
					<input type="text" name="lname" class="form-control" style="margin-left: 2%;width: 32%;" placeholder="Last Name">
				</div>
				<div class="form-group">
					<input type="email" name="emailid" class="form-control" style="margin-top: 2%;" required="" placeholder="Email ID"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" title="Email is in Not valid form" id="semail">
					<br>
					<span id="emailmsg" ></span>
					 <small  class="form-text">We'll never share your email with anyone else.</small>
				</div>
				<div class="form-group">
					<input type="tel" name="contactno" class="form-control"  required="" placeholder="Contact Number" pattern="^[789]\d{9}$" title="Contact Number is invalid">
				</div>
				<div class="form-group">
					<textarea  name="address" id="textrem" placeholder="Address" class="form-control noresize" style="margin-top:2%;"></textarea>
					<h6 id="count_message" style="text-align: right;" ></h6>
				</div>
				<div class="form-group">
					<label for="dob">Date Of Birth</label>
					<input type="date" name="dob"  class="form-control"></textarea>
				</div>

				<div class="form-group">
					<label for="dob">Age</label>
					<input type="number" name="age"  id="age" class="form-control" onchange="agecheck()" maxlength="3"></textarea>
				</div>
				<div class="form-group">
					<select name="question" class="form-control" required="">
						<option value="">Security Question</option>
						<option value="What is Your Pet Name">What is Your Pet Name</option>
						<option value="What is Your Car Numbers">What is Your Car Number</option>
						<option value="What is the first name of your best friend in high school">What is the first name of your best friend in high school?</option>
					</select>
				</div>
				<div class="form-group">
					<input type="text" name="ans" class="form-control" placeholder="Answer">
				</div>
					<input type="submit" class="btn btn-primary" style="width: 100%;" value="Register">
					<br><br>
					<div id="regmsg"></div>
					<br>
			</fieldset>
		</form>
	</div>
	<script type="text/javascript">
		
		function passwordChanged() {
			var strength = document.getElementById('strength');
			var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
			var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
			var enoughRegex = new RegExp("(?=.{6,}).*", "g");
			var pwd = document.getElementById("pass");
			if (pwd.value.length==0) {
				strength.innerHTML = 'Type Password';
			} 
			else if (false == enoughRegex.test(pwd.value)) {
				strength.innerHTML = 'More Characters';
			} 
			else if (strongRegex.test(pwd.value)) {
				strength.innerHTML = '<span style="color:green">Strong!</span>';
			} 
			else if (mediumRegex.test(pwd.value)) {
				strength.innerHTML = '<span style="color:orange">Medium!</span>';
			} 
			else {
			strength.innerHTML = '<span style="color:red">Weak!</span>';
			}
		}
		function agecheck()
		{
			var age=document.getElementById('age');
			if(age.value<=0)
			{
				alert("Please Put Correct Age");
			}
		}
	</script>
	
	
	
</body>
</html>
