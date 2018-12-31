	$(function(){
	    $("#makeEditable").click(function(){
	        $('input:text').prop("readonly", false);   
	        $('textarea').removeAttr("readonly");
	    });
	    $("#makeNonEditable").click(function(){
	        $('input:text').prop("readonly", true);  
	        $('textarea').prop("readonly",true);  
	        if (confirm('Do you want to save the changes')) {	
			    alert('Changes are saved');
			} else {
			    $('input:text').prop("readonly", false);   
	        	$('textarea').removeAttr("readonly");
			}
	    });               
	})