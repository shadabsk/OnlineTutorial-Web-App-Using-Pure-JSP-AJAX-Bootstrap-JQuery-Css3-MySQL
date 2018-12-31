$(document).ready(function(){
	$("#sign").submit(function(event){
		event.preventDefault(); 
		$.ajax({
			type: "POST",
			url: "JSP/Course/courseenroll.jsp",
			data: $("#sign").serialize(),
			 cache: false,
			success: function(result){
				if(result=="<div class='alert alert-info'>Yes</div>")
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