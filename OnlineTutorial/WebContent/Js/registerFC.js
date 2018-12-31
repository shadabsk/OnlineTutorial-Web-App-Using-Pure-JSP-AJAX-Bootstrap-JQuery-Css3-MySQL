$(document).ready(function(){
	$("#sign").submit(function(event){
		event.preventDefault(); 
		$.ajax({
			type: "POST",
			url: "JSP/Register/Reg-InsertFC.jsp",
			data: $("#sign").serialize(),
			 cache: false,
			success: function(result){
				if(result=="<div class='alert alert-info'>The faculty has been enrolled successfully</a></div>")
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