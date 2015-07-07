$(document).ready(function() {


 	
    $('#example3337').bind('click', function(e) {
    	 
    	e.preventDefault();
    	
    	
		var mailSubject = document.getElementById("mailSubject").value;
		var mailBody = document.getElementById("mailBody").value;	
			
 		var previewData = "Are you sure you want to submit?";

    	if(mailSubject=='null' || mailSubject.length <= 0){
    		$.Zebra_Dialog('Please enter the subject of mail.', { 'type':'error','title':'Error' } ); 
	   		return false;    		
    	}
    	
    	if(mailBody=='null' || mailBody.length <= 0 ){
    		$.Zebra_Dialog('Please fill in the mail body.', { 'type':'error','title':'Error' } ); 
	   		return false;
	    }
	  	
		
        e.preventDefault();
        $.Zebra_Dialog(' ' + previewData + ' ', {
            'type':     'confirmation',
            'title':    'Confirmation',
            'buttons':  [
                            {caption: 'Yes', callback: function() { 
                            	document.getElementById("ContactForm").submit();
                            }},
                            {caption: 'No', callback: function() { }}
                        ]
        });
    });

    

    $('#example6').bind('click', function(e) {
        e.preventDefault();
        new $.Zebra_Dialog('Buy me a coffee if you like this plugin!', {
            'custom_class': 'myclass',
            'title': 'Customizing the appearance'
        });
    });

});
