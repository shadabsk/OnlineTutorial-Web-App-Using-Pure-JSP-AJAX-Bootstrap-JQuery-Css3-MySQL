$(document).ready(function(){
	$("#sign").submit(function(event){
		event.preventDefault(); 
		$.ajax({
			type: "POST",
			url: "JSP/Faculty/FCupass.jsp",
			data: $("#sign").serialize(),
			 cache: false,
			success: function(result){
				if(result=="<div class='alert alert-info'><a href='JSP/Login/login-form.jsp'>Successfully Registered!!!Click here to be redirected to login page</a></div>")
				{	
					$('#regmsg').html(result).fadeIn().delay(1000);
					
				}
				else
				{
					$('#regmsg').html(result).fadeIn().delay(1000);
				}
			}
			});
		return false;
	});
});