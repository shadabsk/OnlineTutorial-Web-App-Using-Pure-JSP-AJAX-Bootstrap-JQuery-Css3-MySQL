

$(document).ready(function(){
	$("#sign").submit(function(event){
	    for ( instance in CKEDITOR.instances )
	    {
	        CKEDITOR.instances[instance].updateElement();
	    }
		    
		event.preventDefault(); 
		$.ajax({
			type: "POST",
			url: "JSP/Course/Syllabus.jsp",
			data: $("#sign").serialize(),
			 cache: false,
			success: function(result){
				if(result=="<div class='alert alert-info'>Records Inserted</div>")
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