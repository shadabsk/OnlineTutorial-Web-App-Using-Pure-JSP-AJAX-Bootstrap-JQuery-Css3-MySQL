$(document).ready(function(){
	$("#define").submit(function(event){
		event.preventDefault(); 
		$.ajax({
			type: "POST",
			url: "JSP/Course/Course.jsp",
			data: $("#define").serialize(),
			 cache: false,
			success: function(result){
				if(result=="<div class='alert alert-info'>Course has been created successfully</div>")
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