$(document).ready(function() {

	$('#example1').bind('click', function(e) {
		e.preventDefault();
		$.Zebra_Dialog('<strong>Zebra_Dialog</strong>, a small, compact and highly configurable dialog box plugin for jQuery');
	});

	$('#example2_1').bind('click', function(e) {
		e.preventDefault();
		$.Zebra_Dialog('<strong>Zebra_Dialog</strong> has no dependencies other than <em>jQuery 1.5.2+</em> and works in all major' +
				' browsers like<br>- Firefox<br>- Opera<br>- Safari<br>- Chrome<br>- Internet Explorer 6+', {
			'type':     'error',
			'title':    'Error'
		});
	});

	$('#example2_2').bind('click', function(e) {
		e.preventDefault();
		$.Zebra_Dialog('<strong>Zebra_Dialog</strong> is meant to replace JavaScript\'s <em>alert</em> and <em>confirmation</em>' +
				' dialog boxes. <br><br> Can also be used as a notification widget - when configured to show no buttons and to close' +
				' automatically - for updates or errors, without distracting users from their browser experience by displaying obtrusive alerts.', {
			'type':     'warning',
			'title':    'Warning'
		});
	});

	$('#example2_3').bind('click', function(e) {
		e.preventDefault();
		$.Zebra_Dialog('<strong>Zebra_Dialog</strong> can generate 5 types of dialog boxes: confirmation, information, ' +
				' warning, error and question.<br><br>The appearance of the dialog boxes is easily customizable by changing the CSS file ', {
			'type':     'question',
			'title':    'Question'
		});
	});

	$('#example2_4').bind('click', function(e) {
		e.preventDefault();
		$.Zebra_Dialog('<strong>Zebra_Dialog</strong> dialog boxes can be positioned anywhere on the screen - not just in the middle!' +
				'<br><br>By default, dialog boxes can be closed by pressing the ESC key or by clicking anywhere on the overlay.', {
			'type':     'information',
			'title':    'Information'
		});
	});

	$('#example2_5').bind('click', function(e) {
		e.preventDefault();
		$.Zebra_Dialog('<strong>Zebra_Dialog</strong> is a small (4KB minified), compact (one JS file, no dependencies other than jQuery 1.5.2+)' +
				' and highly configurable dialog box plugin for jQuery meant to replace JavaScript\'s <em>alert</em> and <em>confirmation</em> dialog boxes.', {
			'type':     'confirmation',
			'title':    'Confirmation'
		});
	});

	$('#example3').bind('click', function(e) {
		e.preventDefault();
		$.Zebra_Dialog('<strong>Zebra_Dialog</strong>, a small,  compact and highly configurable dialog box plugin for jQuery eer', {
			'type':     'question',
			'title':    'Preview',
			'buttons':  ['Yes', 'No', 'Help'],
			'onClose':  function(caption) {
				alert((caption != '' ? '"' + caption + '"' : 'nothing') + ' was clicked');
			}
		});
	});

	
	// START1
	$('#example33341').bind('click', function(e) {

		var userName = document.getElementById("userName").value;
		var primaryContactNumber = document.getElementById("primaryContactNumber").value;
		var secondaryContactNumber = document.getElementById("secondaryContactNumber").value;

		if(userName.trim() == ""){				
			$.Zebra_Dialog('Please enter your Name.', { 'type':'error','title':'Error' } ); 

			document.getElementById("userName").value = "";

			$('#userName').focus();
			$("#userNameTD").css("background-color", "red");    		
			$("#userNameTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#userNameTD").css("background-color", "white");
		}

		
		if(primaryContactNumber.trim() == ""){				
			$.Zebra_Dialog('Please enter your Primary Contact Number.', { 'type':'error','title':'Error' } ); 

			document.getElementById("primaryContactNumber").value = "";

			$('#primaryContactNumber').focus();
			$("#primaryContactNumberTD").css("background-color", "red");    		
			$("#primaryContactNumberTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#primaryContactNumberTD").css("background-color", "white");
		}


		var mobileRegex = new RegExp("^[0-9]+$", "i");
		var fieldVal = primaryContactNumber;

		if (!fieldVal.match(mobileRegex)) {
			$.Zebra_Dialog('Primary Contact No should not contain value other then number.', { 'type':'error','title':'Error' } ); 

			$('#primaryContactNumber').focus();
			$("#primaryContactNumberTD").css("background-color", "red");    		
			$("#primaryContactNumberTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#primaryContactNumberTD").css("background-color", "white");
		}

		
		
		if (fieldVal.length != 10) {
			$.Zebra_Dialog('Primary Mobile Number Length should be equal to 10 digits.', { 'type':'error','title':'Error' } ); 

			$('#primaryContactNumber').focus();
			$("#primaryContactNumberTD").css("background-color", "red");    		
			$("#primaryContactNumberTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#primaryContactNumberTD").css("background-color", "white");
		}

		
		
		if(secondaryContactNumber.trim() != ""){				

			var mobileRegex1 = new RegExp("^[0-9]+$", "i");
			var fieldVal1 = secondaryContactNumber;

			if (!fieldVal1.match(mobileRegex1)) {
				$.Zebra_Dialog('Secondary Contact No should not contain value other then number.', { 'type':'error','title':'Error' } ); 

				$('#secondaryContactNumber').focus();
				$("#secondaryContactNumberTD").css("background-color", "red");    		
				$("#secondaryContactNumberTD").css("webkit-border-radius", "6px");

				return false;
			}else{
				$("#secondaryContactNumberTD").css("background-color", "white");
			}

			
			
			if (fieldVal1.length != 10) {
				$.Zebra_Dialog('Secondary Mobile Number Length should be equal to 10 digits.', { 'type':'error','title':'Error' } ); 

				$('#secondaryContactNumber').focus();
				$("#secondaryContactNumberTD").css("background-color", "red");    		
				$("#secondaryContactNumberTD").css("webkit-border-radius", "6px");

				return false;
			}else{
				$("#secondaryContactNumberTD").css("background-color", "white");
			}
			
		}else{
			$("#secondaryContactNumberTD").css("background-color", "white");
		}
		
		

		var dob = document.getElementById("datepicker-example8").value;

		var previewData = "Are you sure you want to submit?";

		if(dob.trim() == ""){
			$.Zebra_Dialog('Please select the Date of Birth.', { 'type':'error','title':'Error' } );

			document.getElementById("datepicker-example8").value = "";

			$('#datepicker-example8').focus();
			$("#dobTD").css("background-color", "red");    		
			$("#dobTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#dobTD").css("background-color", "white");
		}

		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("updateUserAccountData").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});

	//END1
	


	
	
	// START
	$('#example12340').bind('click', function(e) {

		
		var previewData = "<form  action=\" " + document.getElementById("contextPath").value + "/j_spring_security_check\" method=\"post\" id=\"subForm\" >";
		
		previewData = previewData + "<center><img src=\"resources/images/logo.gif\"></center>";
		previewData = previewData + "<br>";
		
		previewData = previewData + "<center>Your data is safe with us.</center>";
		
		previewData = previewData + "<br><br>";
		
		previewData = previewData + "<input type=\"text\" name=\"j_username\" id=\"name\" placeholder=\"Email\" /> ";
		
		previewData = previewData + "<br>";
		
		previewData = previewData + "<input type=\"password\" name=\"j_password\" id=\"zlldr-zlldr\" placeholder=\"Password\" /> ";
		 
		previewData = previewData + "<br>";
		previewData = previewData + "<br>";
		
		previewData = previewData + "</form>";
		
		
		
		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation1',
			'title':    'Avaya Connect',
			'buttons':  [
			             {caption: 'Submit', callback: function() { 
			            	 document.getElementById("subForm").submit();
			             }},
			             {caption: 'Cancel', callback: function() { }}
			             ]
		});
	});

	
	
	
	// START
	$('#example333').bind('click', function(e) {

		var nameId = document.getElementById("nameId").value;

		var emailId = document.getElementById("emailId").value;
		var newPassword = document.getElementById("password").value;
		var reTypePassword = document.getElementById("reTypePassword").value;

		var primaryContactNumber = document.getElementById("primaryContactNumber").value;
		var secondaryContactNumber = document.getElementById("secondaryContactNumber").value;
		
		var dob = document.getElementById("datepicker-example8").value;

		var cityName = document.getElementById("cityName").value;
		var stateName = document.getElementById("stateName").value;
		var countryName = document.getElementById("countryName").value;

		var previewData = "Are you sure you want to submit?";

		
		if (nameId.trim() == "") {
			$.Zebra_Dialog('Please enter your name.', { 'type':'error','title':'Error' } );
			$("#nameId").focus();
			document.getElementById("nameId").value = "";
			$("#nameTD").css("background-color", "red");
			$("#nameTD").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#nameTD").css("background-color", "white");
		}		
		
		if (emailId.trim() == "") {
			$.Zebra_Dialog('Please enter your email id.', { 'type':'error','title':'Error' } );
			$("#emailId").focus();
			document.getElementById("emailId").value = "";
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}

		var emailVal = emailId;
		var re = new RegExp(
		/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i);
		if (!emailVal.match(re)) {
			$.Zebra_Dialog('Email Id provided is not valid.', { 'type':'error','title':'Error' } );

			$("#emailId").focus();
			document.getElementById("emailId").value = "";
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}
		
		
		

		/*
		  FOR CHECKING CORPORATE USER STARTED
		 */ 
		var domain = emailId.substring(emailId.indexOf("@")+1,emailId.length);
		
		if (domain.trim() != "avaya.com") {
			$.Zebra_Dialog('Please enter your Corporate id.', { 'type':'error','title':'Error' } );
			$("#emailId").focus();
			document.getElementById("emailId").value = "";
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}
		
		/*
		  FOR CHECKING CORPORATE USER ENDED
		 */ 
		
		
		if(newPassword.trim() == ""){
			$.Zebra_Dialog('Please fill the Password field.', { 'type':'error','title':'Error' } );
			$('#password').focus();
			document.getElementById("password").value = "";
			$("#newPasswordTD").css("background-color", "red");
			$("#newPasswordTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#newPasswordTD").css("background-color", "white");
		}


		if(reTypePassword.trim() == ""){
			$.Zebra_Dialog('Please fill the Retype Password field.', { 'type':'error','title':'Error' } );
			$('#reTypePassword').focus();
			document.getElementById("reTypePassword").value = "";
			$("#reTypePasswordTD").css("background-color", "red");
			$("#reTypePasswordTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#reTypePasswordTD").css("background-color", "white");
		}


		if(newPassword!=reTypePassword){
			$.Zebra_Dialog('New Password and Retyped passwords not matching', { 'type':'error','title':'Error' } );
			$("#reTypePasswordTD").css("background-color", "red");
			$("#reTypePasswordTD").css("webkit-border-radius", "6px");

			$('#password').focus();
			
			document.getElementById("reTypePassword").value = "";
			document.getElementById("password").value = "";

			$("#newPasswordTD").css("background-color", "red");
			$("#newPasswordTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#newPasswordTD").css("background-color", "white");
			$("#reTypePasswordTD").css("background-color", "white");
		}


		if(primaryContactNumber.trim() == ""){
			$.Zebra_Dialog('Please enter your Primary Contact Number.', { 'type':'error','title':'Error' } ); 

			document.getElementById("primaryContactNumber").value = "";

			$('#primaryContactNumber').focus();
			$("#primaryContactNumberTD").css("background-color", "red");    		
			$("#primaryContactNumberTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#primaryContactNumberTD").css("background-color", "white");
		}
		

		var mobileRegex = new RegExp("^[0-9]+$", "i");
		var fieldVal = primaryContactNumber;

		if (!fieldVal.match(mobileRegex)) {
			$.Zebra_Dialog('Primary Contact No should not contain value other then number.', { 'type':'error','title':'Error' } ); 

			$('#primaryContactNumber').focus();
			$("#primaryContactNumberTD").css("background-color", "red");    		
			$("#primaryContactNumberTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#primaryContactNumberTD").css("background-color", "white");
		}

		if (fieldVal.length != 10) {
			$.Zebra_Dialog('Primary Mobile Number Length should be equal to 10 digits.', { 'type':'error','title':'Error' } ); 

			$('#primaryContactNumber').focus();
			$("#primaryContactNumberTD").css("background-color", "red");    		
			$("#primaryContactNumberTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#primaryContactNumberTD").css("background-color", "white");
		}

		
		if(secondaryContactNumber.trim() != ""){
		
			
			var mobileRegex1 = new RegExp("^[0-9]+$", "i");
			var fieldVal1 = secondaryContactNumber;

			if (!fieldVal1.match(mobileRegex1)) {
				$.Zebra_Dialog('Secondary Contact No should not contain value other then number.', { 'type':'error','title':'Error' } ); 

				$('#secondaryContactNumber').focus();
				$("#secondaryContactNumberTD").css("background-color", "red");    		
				$("#secondaryContactNumberTD").css("webkit-border-radius", "6px");

				return false;
			}else{
				$("#secondaryContactNumberTD").css("background-color", "white");
			}

			if (fieldVal1.length != 10) {
				$.Zebra_Dialog('Secondary Mobile Number Length should be equal to 10 digits.', { 'type':'error','title':'Error' } ); 

				$('#secondaryContactNumber').focus();
				$("#secondaryContactNumberTD").css("background-color", "red");    		
				$("#secondaryContactNumberTD").css("webkit-border-radius", "6px");

				return false;
			}else{
				$("#secondaryContactNumberTD").css("background-color", "white");
			}
			
			
		}else{
			$("#secondaryContactNumberTD").css("background-color", "white");
		}


		if(dob.trim() == ""){
			$.Zebra_Dialog('Please select the Date of Birth.', { 'type':'error','title':'Error' } );

			document.getElementById("datepicker-example8").value = "";

			$('#datepicker-example8').focus();
			$("#dobTD").css("background-color", "red");    		
			$("#dobTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#dobTD").css("background-color", "white");
		}

		if(cityName.trim() == "" ){
			$.Zebra_Dialog('Please enter the City name.', { 'type':'error','title':'Error' } );
			$('#cityName').focus();
			$("#cityNameTD").css("background-color", "red");    		
			$("#cityNameTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#cityNameTD").css("background-color", "white");
		}

		if(stateName.trim() == "" ){
			$.Zebra_Dialog('Please enter the State name.', { 'type':'error','title':'Error' } );
			$('#stateName').focus();
			$("#stateNameTD").css("background-color", "red");    		
			$("#stateNameTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#stateNameTD").css("background-color", "white");
		}


		if(countryName.trim() == "" ){
			$.Zebra_Dialog('Please enter the Country Name.', { 'type':'error','title':'Error' } );
			$('#countryName').focus();
			$("#countryNameTD").css("background-color", "red");    		
			$("#countryNameTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#countryNameTD").css("background-color", "white");
		}
		
		
		
		var userProfilePicfile = document.getElementById("userProfilePicfile").value;
		
		if(userProfilePicfile!=null && userProfilePicfile.trim()==""){
			$.Zebra_Dialog('Please select your pic.', { 'type':'error','title':'Error' } );
			$('#userProfilePicfile').focus();
			document.getElementById("userProfilePicfile").value = "";
			$("#userProfilePicfile").css("border-color", "red");
			$("#userProfilePicfile").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#userProfilePicfile").css("border-color", "green");			
		}
     
		var ext = userProfilePicfile.substring(userProfilePicfile.lastIndexOf('.') + 1);        
        if(ext!=null){
		    if(!(ext=="gif" || ext=="GIF" || ext=="jpg" || ext=="jpeg" || ext=="JPG" || ext=="JPEG" || ext=="png" || ext=="PNG" )){
		    	$.Zebra_Dialog('Image with extensions gif, jpg, jpeg, png are only allowed.', { 'type':'error','title':'Error' } );
				$('#userProfilePicfile').focus();
				document.getElementById("userProfilePicfile").value = "";
				$("#userProfilePicfile").css("border-color", "red");
				$("#userProfilePicfile").css("webkit-border-radius", "6px");

				return false;
			}else{
				$("#userProfilePicfile").css("border-color", "green");			
			}
        }else{

        	$.Zebra_Dialog('Please select valid picture.', { 'type':'error','title':'Error' } );
			$('#userProfilePicfile').focus();
			document.getElementById("userProfilePicfile").value = "";
			$("#userProfilePicfile").css("border-color", "red");
			$("#userProfilePicfile").css("webkit-border-radius", "6px");

			return false;
        }		
		
		
		
		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("testconfirmJQRegister").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});

	//END


	$('#example139').bind('click', function(e) {

		var oldPassword = document.getElementById("oldPassword").value;

		var newPassword = document.getElementById("newPassword").value;
		var reTypePassword = document.getElementById("reTypePassword").value;

		var previewData = "Are you sure you want to submit?";

		if(oldPassword.trim() == ""){	
			$.Zebra_Dialog('Please fill the old Password field.', { 'type':'error','title':'Error' } );
			$('#oldPassword').focus();
			document.getElementById("oldPassword").value = "";
			$("#oldPasswordTD").css("background-color", "red");
			$("#oldPasswordTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#oldPasswordTD").css("background-color", "white");
		}


		if(newPassword.trim() == ""){
			$.Zebra_Dialog('Please fill the New Password field.', { 'type':'error','title':'Error' } );
			$('#newPassword').focus();
			document.getElementById("newPassword").value = "";
			$("#newPasswordTD").css("background-color", "red");
			$("#newPasswordTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#newPasswordTD").css("background-color", "white");
		}


		if(reTypePassword.trim() == ""){
			$.Zebra_Dialog('Please fill the Retype Password field.', { 'type':'error','title':'Error' } );
			$('#reTypePassword').focus();
			document.getElementById("reTypePassword").value = "";
			$("#reTypePasswordTD").css("background-color", "red");
			$("#reTypePasswordTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#reTypePasswordTD").css("background-color", "white");
		}


		if(newPassword!=reTypePassword){
			$.Zebra_Dialog('New Password and Retyped passwords not matching', { 'type':'error','title':'Error' } );
			$("#reTypePasswordTD").css("background-color", "red");
			$("#reTypePasswordTD").css("webkit-border-radius", "6px");

			document.getElementById("newPassword").value = "";
			document.getElementById("reTypePassword").value = "";

			$("#newPasswordTD").css("background-color", "red");
			$("#newPasswordTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#newPasswordTD").css("background-color", "white");
			$("#reTypePasswordTD").css("background-color", "white");
		}

		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("testconfirmJQUpdatePassword").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});


	$('#example140').bind('click', function(e) {

		var emailId = document.getElementById("emailId").value;

		var previewData = "Are you sure you want to submit?";

		
		if (emailId.trim() == "") {
			$.Zebra_Dialog('Please enter your email id.', { 'type':'error','title':'Error' } );
			$('#emailId').focus();
			document.getElementById("emailId").value = "";
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}

		var emailVal = emailId;
		var re = new RegExp(
		/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i);
		if (!emailVal.match(re)) {
			$.Zebra_Dialog('Email Id provided is not valid.', { 'type':'error','title':'Error' } );

			$('#emailId').focus();
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}
		

		/*
		  FOR CHECKING CORPORATE USER STARTED
		 */ 
		var domain = emailId.substring(emailId.indexOf("@")+1,emailId.length);
		
		if (domain.trim() != "avaya.com") {
			$.Zebra_Dialog('Please enter your Corporate id.', { 'type':'error','title':'Error' } );
			
			$('#emailId').focus();
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}
		
		/*
		  FOR CHECKING CORPORATE USER ENDED
		 */ 

		
		
		
		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("testConfirmResetPassword").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});


	$('#example1401').bind('click', function(e) {

		var emailId = document.getElementById("emailId").value;

		var previewData = "Are you sure you want to submit?";

		
		if (emailId.trim() == "") {
			$.Zebra_Dialog('Please enter your email id.', { 'type':'error','title':'Error' } );
			$('#emailId').focus();
			document.getElementById("emailId").value = "";
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}

		var emailVal = emailId;
		var re = new RegExp(
		/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i);
		if (!emailVal.match(re)) {
			$.Zebra_Dialog('Email Id provided is not valid.', { 'type':'error','title':'Error' } );

			$('#emailId').focus();
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}
		
		
		/*
		  FOR CHECKING CORPORATE USER STARTED
		 */ 
		var domain = emailId.substring(emailId.indexOf("@")+1,emailId.length);
		
		if (domain.trim() != "avaya.com") {
			$.Zebra_Dialog('Please enter your Corporate id.', { 'type':'error','title':'Error' } );

			$('#emailId').focus();
			$("#emailIdTD").css("background-color", "red");
			$("#emailIdTD").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#emailIdTD").css("background-color", "white");
		}
		
		/*
		  FOR CHECKING CORPORATE USER ENDED
		 */ 
		

		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("testConfirmResetActivationLink").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});

	

	$('#example1402').bind('click', function(e) {

		var userProfilePicfile = document.getElementById("userProfilePicfile").value;
		
		if(userProfilePicfile!=null && userProfilePicfile.trim()==""){
			$.Zebra_Dialog('Please select your pic.', { 'type':'error','title':'Error' } );
			$('#userProfilePicfile').focus();
			document.getElementById("userProfilePicfile").value = "";
			$("#userProfilePicfile").css("border-color", "red");
			$("#userProfilePicfile").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#userProfilePicfile").css("border-color", "green");			
		}
     
		var ext = userProfilePicfile.substring(userProfilePicfile.lastIndexOf('.') + 1);        
        if(ext!=null){
		    if(!(ext=="gif" || ext=="GIF" || ext=="jpg" || ext=="jpeg" || ext=="JPG" || ext=="JPEG" || ext=="png" || ext=="PNG" )){
		    	$.Zebra_Dialog('Image with extensions gif, jpg, jpeg, png are only allowed.', { 'type':'error','title':'Error' } );
				$('#userProfilePicfile').focus();
				document.getElementById("userProfilePicfile").value = "";
				$("#userProfilePicfile").css("border-color", "red");
				$("#userProfilePicfile").css("webkit-border-radius", "6px");

				return false;
			}else{
				$("#userProfilePicfile").css("border-color", "green");			
			}
        }else{

        	$.Zebra_Dialog('Please select valid picture.', { 'type':'error','title':'Error' } );
			$('#userProfilePicfile').focus();
			document.getElementById("userProfilePicfile").value = "";
			$("#userProfilePicfile").css("border-color", "red");
			$("#userProfilePicfile").css("webkit-border-radius", "6px");

			return false;
        }		
        
		var previewData = "Are you sure you want to submit?";

		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("testConfirmUpdateProfilePicture").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});
	
	

	$('#example31').bind('click', function(e) {

		e.preventDefault();	

		var carpoolOnSpecificDays = document.getElementById("carpoolOnSpecificDays");    	
		if(carpoolOnSpecificDays.checked){

			var weekDays1 = $("#weekDays123").val();

			if(weekDays1==null){
				$.Zebra_Dialog('Please select atleast one day of the week', { 'type':'error','title':'Error'} ); 
				$("#daysSelectionP").css("background-color", "red");
				$(window).scrollTop($('#daysSelectionDiv').offset().top);	

				return false;
			}else{
				$("#daysSelectionP").css("background-color", "white");
			}
		}



		var fromPlaces = $('#homeToOfficeFrom').tokenInput('get');
		var toPlaces = $('#homeToOfficeTo').tokenInput('get');
		var inBetweenPlacesArray = $('#demo-input-facebook-theme').tokenInput('get');
		var sourceLeavingTime = document.getElementById("timepicker.[1]").value;

		var carpoolBothWayOption = document.getElementById("carpoolOneWayTwoOptionYes");
		var returnRouteSameWayOption = document.getElementById("returnRouteSameOptionNo");	
		var destinationToSourceLeavingTime = document.getElementById("timepicker.[2]").value;

		var compensationPrice = document.getElementById("compensationPrice");
		var compensationAmount = document.getElementById("compensationAmount").value;

		var termsAndCondition = document.getElementById("checkbox-1-1");


		var previewData = "Are you sure you want to submit?";

		
		
		if(fromPlaces=='null' || fromPlaces.length <= 0 ){
			$.Zebra_Dialog('From place is required', { 'type':'error','title':'Error' } );
			$('#homeToOfficeFrom').focus();
			$("#homeToOfficeFrom_td_id").css("background-color", "red");
			$("#homeToOfficeFrom_td_id").css("webkit-border-radius", "6px");

			return false;
		}else{
			$("#homeToOfficeFrom_td_id").css("background-color", "white");
		}


		if(toPlaces=='null' || toPlaces.length <= 0 ){
			$.Zebra_Dialog('To place is required', { 'type':'error','title':'Error' } );
			$('#homeToOfficeTo').focus();
			$("#homeToOfficeTo_td_id").css("background-color", "red");
			$("#homeToOfficeTo_td_id").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#homeToOfficeTo_td_id").css("background-color", "white");
		}

		
		

		if(inBetweenPlacesArray=='null' || inBetweenPlacesArray.length <= 0 ){
			$.Zebra_Dialog('Please fill atleast one in between places you pass by.', { 'type':'error','title':'Error' } );
			$('#demo-input-facebook-theme').focus();
			$("#homeToOfficeInBetPlaces_td_id").css("background-color", "red");   
			$("#homeToOfficeInBetPlaces_td_id").css("webkit-border-radius", "6px");
			
			return false;
		}else{
			$("#homeToOfficeInBetPlaces_td_id").css("background-color", "white");
		}


		if(sourceLeavingTime=='null' || sourceLeavingTime.length <= 0){
			$.Zebra_Dialog('Please fill your start time from source place.', { 'type':'error','title':'Error' } );
			$(window).scrollTop($('#sourceLeavingTimeOneWay').offset().top);
			$("#sourceLeavingTimeOneWay").css("background-color", "red");
			$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
			
			return false;    		
		}else{
			$("#sourceLeavingTimeOneWay").css("background-color", "white");
		}


		var carpoolOnSpecificDates = document.getElementById("carpoolOnSpecificDates");


		if(carpoolOnSpecificDates.checked){
			var datepickerSourceToDest = document.getElementById("datepicker-example4").value;


			if(datepickerSourceToDest=='null' || datepickerSourceToDest.length <= 0){
				$.Zebra_Dialog('Please select the date you are going to start from source place.', { 'type':'error','title':'Error' } );
				$('#datepicker-example4').focus();
				$("#datepickerSourceToDestDiv").css("background-color", "red");
				$("#datepickerSourceToDestDiv").css("webkit-border-radius", "6px");
				return false;    		
			}else{
				$("#datepickerSourceToDestDiv").css("background-color", "white");
			}    		

		}



		if(carpoolBothWayOption.checked){

			if(destinationToSourceLeavingTime=='null' || destinationToSourceLeavingTime.length <= 0){
				$.Zebra_Dialog('Destination leaving time cannot be empty, if you wish to carpool both your way.', { 'type':'error','title':'Error' } );
				$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
				$("#sourceLeavingTimeOtherWay").css("background-color", "red");
				$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
				return false;    		
			}else{
				$("#sourceLeavingTimeOtherWay").css("background-color", "white");
			}


			if(carpoolOnSpecificDates.checked){
				var datepickerDestToSource = document.getElementById("datepicker-example4Copy").value;


				if(datepickerDestToSource=='null' || datepickerDestToSource.length <= 0){
					$.Zebra_Dialog('Please select the date you are going to start from destination place.', { 'type':'error','title':'Error' } );
					$('#datepicker-example4Copy').focus();
					$("#datepickerDestToSourceDiv").css("background-color", "red");
					$("#datepickerDestToSourceDiv").css("webkit-border-radius", "6px");
					return false;    		
				}else{
					$("#datepickerDestToSourceDiv").css("background-color", "white");
				}

			}
			
			
			if(carpoolOnSpecificDates.checked){
				var datepickerSourceToDest1 = document.getElementById("datepicker-example4").value;
				var datepickerDestToSource2 = document.getElementById("datepicker-example4Copy").value;

				
				var firstValue = datepickerSourceToDest1.split('/');
				var secondValue = datepickerDestToSource2.split('/');

				 var firstDate=new Date();
				 firstDate.setFullYear(firstValue[0],(firstValue[1] - 1 ),firstValue[2]);

				 var secondDate=new Date();
				 secondDate.setFullYear(secondValue[0],(secondValue[1] - 1 ),secondValue[2]);     

				 
				 if(!(firstDate>secondDate || secondDate>firstDate)){

					 if (sourceLeavingTime > destinationToSourceLeavingTime){
							$.Zebra_Dialog('Source Leaving Time cannot be greater then Returning time of Journey.', { 'type':'error','title':'Error' } );
							$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
						
							$("#sourceLeavingTimeOneWay").css("background-color", "red");
							$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
							
							$("#sourceLeavingTimeOtherWay").css("background-color", "red");
							$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
						
							return false;    		
						}else{
							$("#sourceLeavingTimeOtherWay").css("background-color", "white");
							$("#sourceLeavingTimeOneWay").css("background-color", "white");
						}


				
				
						if (sourceLeavingTime == destinationToSourceLeavingTime){
							$.Zebra_Dialog('Source Leaving Time and Returning time of Journey cannot be same', { 'type':'error','title':'Error' } );
							$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
							
							$("#sourceLeavingTimeOneWay").css("background-color", "red");
							$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
							
							$("#sourceLeavingTimeOtherWay").css("background-color", "red");
							$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
						
							return false;    		
						}else{
							$("#sourceLeavingTimeOtherWay").css("background-color", "white");
							$("#sourceLeavingTimeOneWay").css("background-color", "white");
						}

				 
				 }
				 
				 
				 if (firstDate > secondDate){
					 $.Zebra_Dialog('Start Journey Date is greater then Leaving Destination date.', { 'type':'error','title':'Error' } );
					 
				 	$('#datepicker-example4').focus();
				 	
				 	 $("#datepickerDestToSourceDiv").css("background-color", "red");
				 	 $("#datepickerDestToSourceDiv").css("webkit-border-radius", "6px");
					 
				 	 $("#datepickerSourceToDestDiv").css("webkit-border-radius", "6px");
					 $("#datepickerSourceToDestDiv").css("background-color", "red");
					 return false;    		
				 }else{
					 $("#datepickerSourceToDestDiv").css("background-color", "white");
					 $("#datepickerDestToSourceDiv").css("background-color", "white");
				 }
				 
			}
						
		


			if(carpoolOnSpecificDays.checked){		
				
				if (sourceLeavingTime > destinationToSourceLeavingTime){
					$.Zebra_Dialog('Source Leaving Time cannot be greater then Returning time of Journey.', { 'type':'error','title':'Error' } );
					$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
				
					$("#sourceLeavingTimeOneWay").css("background-color", "red");
					$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
					
					$("#sourceLeavingTimeOtherWay").css("background-color", "red");
					$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
				
					return false;    		
				}else{
					$("#sourceLeavingTimeOtherWay").css("background-color", "white");
					$("#sourceLeavingTimeOneWay").css("background-color", "white");
				}
		
		
				if (sourceLeavingTime == destinationToSourceLeavingTime){
					$.Zebra_Dialog('Source Leaving Time and Returning time of Journey cannot be same', { 'type':'error','title':'Error' } );
					$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
				
					$("#sourceLeavingTimeOneWay").css("background-color", "red");
					$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
					
					$("#sourceLeavingTimeOtherWay").css("background-color", "red");
					$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
				
					return false;    		
				}else{
					$("#sourceLeavingTimeOtherWay").css("background-color", "white");
					$("#sourceLeavingTimeOneWay").css("background-color", "white");
				}
				
			}
		  
		
		  
			if(returnRouteSameWayOption.checked){
	
				var fromPlacesReturn = $('#officeToHomeFrom').tokenInput('get');
				var toPlacesReturn = $('#officeToHomeTo').tokenInput('get');
				var inBetweenPlacesArrayReturn = $('#officeToHomeInBetweenPlaces').tokenInput('get');    	
	
	
				if(fromPlacesReturn=='null' || fromPlacesReturn.length <= 0 ){
					$.Zebra_Dialog('Return Route From place is required', { 'type':'error','title':'Error' } );
					$('#officeToHomeFrom').focus();
					$("#officeToHomeFrom_td_id").css("background-color", "red");
					$("#officeToHomeFrom_td_id").css("webkit-border-radius", "6px");
					return false;
				}else{
					$("#officeToHomeFrom_td_id").css("background-color", "white");
				}
	
				if(toPlacesReturn=='null' || toPlacesReturn.length <= 0 ){
					$.Zebra_Dialog('Return Route To place is required', { 'type':'error','title':'Error' } ); 
					$('#officeToHomeTo').focus();
					$("#officeToHomeTo_td_id").css("background-color", "red");
					$("#officeToHomeTo_td_id").css("webkit-border-radius", "6px");
					return false;
				}else{
					$("#officeToHomeTo_td_id").css("background-color", "white");
				}
	
				
				if(inBetweenPlacesArrayReturn=='null' || inBetweenPlacesArrayReturn.length <= 0 ){
					$.Zebra_Dialog('Please fill atleast one in between places you Returned to your destination by.', { 'type':'error','title':'Error' } );
					$('#officeToHomeInBetweenPlaces').focus();
					$("#officeToHomeInBetPlaces_td_id").css("background-color", "red");    	
					$("#officeToHomeInBetPlaces_td_id").css("webkit-border-radius", "6px");
					return false;
				}else{
					$("#officeToHomeInBetPlaces_td_id").css("background-color", "white");
				}
	
			}

		}
		
		if(compensationPrice.checked){

		
			if (compensationAmount.trim() == "") {
				$.Zebra_Dialog('Please enter the amount you would like carpooler to compensate.', { 'type':'error','title':'Error' } );
				$('#compensationAmount').focus();
				$("#compensationPriceTD").css("background-color", "red");    	
				$("#compensationPriceTD").css("webkit-border-radius", "6px");
				return false;
			}else{
				$("#compensationPriceTD").css("background-color", "white");
			}
			
			
			var mobileRegex31 = new RegExp("^[0-9]+$", "i");
			var fieldVal31 = compensationAmount;

			if (!fieldVal31.match(mobileRegex31)) {
				$.Zebra_Dialog('Price Amount should only contain Numbers.', { 'type':'error','title':'Error' } ); 
				$('#compensationAmount').focus();
				$("#compensationPriceTD").css("background-color", "red");    	
				$("#compensationPriceTD").css("webkit-border-radius", "6px");
				return false;
			}else{
				$("#compensationPriceTD").css("background-color", "white");
			}
			
			

			if (fieldVal31.length >= 4) {
				$.Zebra_Dialog('Price Amount should not be greater then 9999 INR.', { 'type':'error','title':'Error' } ); 
				$('#compensationAmount').focus();
				$("#compensationPriceTD").css("background-color", "red");    	
				$("#compensationPriceTD").css("webkit-border-radius", "6px");
				return false;
			}else{
				$("#compensationPriceTD").css("background-color", "white");
			}
			
			
			
		}


		if(termsAndCondition.checked == false){
			$.Zebra_Dialog('Please accept the terms and condition to proceed.', { 'type':'error','title':'Error' } );
			$("#termsAndAgreementTD").css("background-color", "red");    	
			return false;
		}


		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("testconfirmJQ").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});




	$('#example311').bind('click', function(e) {

		e.preventDefault();	

	
		var carpoolOnSpecificDays = document.getElementById("carpoolOnSpecificDays"); 

		if(carpoolOnSpecificDays.checked){
			var weekDays1 = $("#weekDays123").val();

			if(weekDays1==null){
				$.Zebra_Dialog('Please select atleast one day of the week', { 'type':'error','title':'Error'} ); 
				$("#daysSelectionP").css("background-color", "red");
				$(window).scrollTop($('#daysSelectionDiv').offset().top);	

				return false;
			}else{
				$("#daysSelectionP").css("background-color", "white");
			}
		}

		var fromPlaces = $('#homeToOfficeFrom').tokenInput('get');
		var toPlaces = $('#homeToOfficeTo').tokenInput('get');
		var inBetweenPlacesArray = $('#demo-input-facebook-theme').tokenInput('get');
		var sourceLeavingTime = document.getElementById("timepicker.[1]").value;

		var carpoolBothWayOption = document.getElementById("carpoolOneWayTwoOptionYes");
		var returnRouteSameWayOption = document.getElementById("returnRouteSameOptionNo");	
		var destinationToSourceLeavingTime = document.getElementById("timepicker.[2]").value;


		var compensationPrice = document.getElementById("compensationPrice");
		var compensationAmount = document.getElementById("compensationAmount").value;

		var previewData = "Are you sure you want to submit?";


		if(fromPlaces=='null' || fromPlaces.length <= 0 ){
			$.Zebra_Dialog('From place is required', { 'type':'error','title':'Error' } );
			$('#homeToOfficeFrom').focus();
			$("#homeToOfficeFrom_td_id").css("background-color", "red");
			$("#homeToOfficeFrom_td_id").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#homeToOfficeFrom_td_id").css("background-color", "white");
		}

		

		if(toPlaces=='null' || toPlaces.length <= 0 ){
			$.Zebra_Dialog('To place is required', { 'type':'error','title':'Error' } );
			$('#homeToOfficeTo').focus();
			$("#homeToOfficeTo_td_id").css("background-color", "red");
			$("#homeToOfficeTo_td_id").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#homeToOfficeTo_td_id").css("background-color", "white");
		}


		if(inBetweenPlacesArray=='null' || inBetweenPlacesArray.length <= 0 ){
			$.Zebra_Dialog('Please fill atleast one in between places you pass by.', { 'type':'error','title':'Error' } );
			$('#demo-input-facebook-theme').focus();
			$("#homeToOfficeInBetPlaces_td_id").css("background-color", "red");
			$("#homeToOfficeInBetPlaces_td_id").css("webkit-border-radius", "6px");
			return false;
		}else{
			$("#homeToOfficeInBetPlaces_td_id").css("background-color", "white");
		}


		if(sourceLeavingTime=='null' || sourceLeavingTime.length <= 0){
			$.Zebra_Dialog('Please fill your start time from source place.', { 'type':'error','title':'Error' } );
			$(window).scrollTop($('#sourceLeavingTimeOneWay').offset().top);
			$("#sourceLeavingTimeOneWay").css("background-color", "red");
			$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
			return false;    		
		}else{
			$("sourceLeavingTimeOneWay").css("background-color", "white");
		}
		
		


		var carpoolOnSpecificDates = document.getElementById("carpoolOnSpecificDates");


		if(carpoolOnSpecificDates.checked){
			var datepickerSourceToDest = document.getElementById("datepicker-example4").value;


			if(datepickerSourceToDest=='null' || datepickerSourceToDest.length <= 0){
				$.Zebra_Dialog('Please select the date you are going to start from source place.', { 'type':'error','title':'Error' } );
				$('#datepicker-example4').focus();
				$("#datepickerSourceToDestDiv").css("background-color", "red");
				$("#datepickerSourceToDestDiv").css("webkit-border-radius", "6px");
				return false;    		
			}else{
				$("#datepickerSourceToDestDiv").css("background-color", "white");
			}    		

		}



		if(carpoolBothWayOption.checked){

			if(destinationToSourceLeavingTime=='null' || destinationToSourceLeavingTime.length <= 0){
				$.Zebra_Dialog('Destination leaving time cannot be empty, if you wish to carpool both your way.', { 'type':'error','title':'Error' } );
				$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
				$("#sourceLeavingTimeOtherWay").css("background-color", "red");
				$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
				return false;    		
			}else{
				$("#sourceLeavingTimeOtherWay").css("background-color", "white");
			}

			if(carpoolOnSpecificDates.checked){
				var datepickerDestToSource = document.getElementById("datepicker-example4Copy").value;


				if(datepickerDestToSource=='null' || datepickerDestToSource.length <= 0){
					$.Zebra_Dialog('Please select the date you are going to start from destination place.', { 'type':'error','title':'Error' } );
					$('#datepicker-example4Copy').focus();
					$("#datepickerDestToSourceDiv").css("background-color", "red");
					$("#datepickerDestToSourceDiv").css("webkit-border-radius", "6px");
					
					return false;    		
				}else{
					$("#datepickerDestToSourceDiv").css("background-color", "white");
				}

			}
			
			
			
			
			
			
			if(carpoolOnSpecificDates.checked){
				var datepickerSourceToDest1 = document.getElementById("datepicker-example4").value;
				var datepickerDestToSource2 = document.getElementById("datepicker-example4Copy").value;

				
				var firstValue = datepickerSourceToDest1.split('/');
				var secondValue = datepickerDestToSource2.split('/');

				 var firstDate=new Date();
				 firstDate.setFullYear(firstValue[0],(firstValue[1] - 1 ),firstValue[2]);

				 var secondDate=new Date();
				 secondDate.setFullYear(secondValue[0],(secondValue[1] - 1 ),secondValue[2]);     

				 
				 if(!(firstDate>secondDate || secondDate>firstDate)){
					 
					 if (sourceLeavingTime > destinationToSourceLeavingTime){
							$.Zebra_Dialog('Source Leaving Time cannot be greater then Returning time of Journey.', { 'type':'error','title':'Error' } );
							$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
						
							$("#sourceLeavingTimeOneWay").css("background-color", "red");
							$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
							
							$("#sourceLeavingTimeOtherWay").css("background-color", "red");
							$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
						
							return false;    		
						}else{
							$("#sourceLeavingTimeOtherWay").css("background-color", "white");
							$("#sourceLeavingTimeOneWay").css("background-color", "white");
						}
					 
					 
					 
										
						if (sourceLeavingTime == destinationToSourceLeavingTime){
							$.Zebra_Dialog('Source Leaving Time and Returning time of Journey cannot be same', { 'type':'error','title':'Error' } );
							$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
							
							$("#sourceLeavingTimeOneWay").css("background-color", "red");
							$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
							
							$("#sourceLeavingTimeOtherWay").css("background-color", "red");
							$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
						
							return false;    		
						}else{
							$("#sourceLeavingTimeOtherWay").css("background-color", "white");
							$("#sourceLeavingTimeOneWay").css("background-color", "white");
						}
						
						
				 
				 }
				 
				 if (firstDate > secondDate){
					 $.Zebra_Dialog('Start Journey Date is greater then Leaving Destination date.', { 'type':'error','title':'Error' } );
					 
				 	$('#datepicker-example4').focus();
				 	
				 	 $("#datepickerDestToSourceDiv").css("background-color", "red");
				 	 $("#datepickerDestToSourceDiv").css("webkit-border-radius", "6px");
					 
				 	 $("#datepickerSourceToDestDiv").css("webkit-border-radius", "6px");
					 $("#datepickerSourceToDestDiv").css("background-color", "red");
					 return false;    		
				 }else{
					 $("#datepickerSourceToDestDiv").css("background-color", "white");
					 $("#datepickerDestToSourceDiv").css("background-color", "white");
				 }
				 
				 
				 
			}
			
			
			
			
		
			if(carpoolOnSpecificDays.checked){		
				if (sourceLeavingTime > destinationToSourceLeavingTime){
					$.Zebra_Dialog('Source Leaving Time cannot be greater then Returning time of Journey.', { 'type':'error','title':'Error' } );
					$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
					
					$("#sourceLeavingTimeOneWay").css("background-color", "red");
					$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
					
					$("#sourceLeavingTimeOtherWay").css("background-color", "red");
					$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
					
					return false;    		
				}else{
					$("#sourceLeavingTimeOtherWay").css("background-color", "white");
					$("#sourceLeavingTimeOneWay").css("background-color", "white");
				}
		
		
				if (sourceLeavingTime == destinationToSourceLeavingTime){
					$.Zebra_Dialog('Source Leaving Time and Returning time of Journey cannot be same', { 'type':'error','title':'Error' } );
					
					$(window).scrollTop($('#sourceLeavingTimeOtherWay').offset().top);
					
					$("#sourceLeavingTimeOneWay").css("background-color", "red");
					$("#sourceLeavingTimeOneWay").css("webkit-border-radius", "6px");
					
					$("#sourceLeavingTimeOtherWay").css("background-color", "red");
					$("#sourceLeavingTimeOtherWay").css("webkit-border-radius", "6px");
					
					return false;    		
				}else{
					$("#sourceLeavingTimeOtherWay").css("background-color", "white");
					$("#sourceLeavingTimeOneWay").css("background-color", "white");
				}
			}

			if(returnRouteSameWayOption.checked){
	
				var fromPlacesReturn = $('#officeToHomeFrom').tokenInput('get');
				var toPlacesReturn = $('#officeToHomeTo').tokenInput('get');
				var inBetweenPlacesArrayReturn = $('#officeToHomeInBetweenPlaces').tokenInput('get');    	
	
	
				if(fromPlacesReturn=='null' || fromPlacesReturn.length <= 0 ){
					$.Zebra_Dialog('Return Route From place is required', { 'type':'error','title':'Error' } );
					$('#officeToHomeFrom').focus();
					$("#officeToHomeFrom_td_id").css("background-color", "red");
					$("#officeToHomeFrom_td_id").css("webkit-border-radius", "6px");
					return false;
				}else{
					$("#officeToHomeFrom_td_id").css("background-color", "white");
				}
	
				if(toPlacesReturn=='null' || toPlacesReturn.length <= 0 ){
					$.Zebra_Dialog('Return Route To place is required', { 'type':'error','title':'Error' } ); 
					$('#officeToHomeTo').focus();
					$("#officeToHomeTo_td_id").css("background-color", "red");
					$("#officeToHomeTo_td_id").css("webkit-border-radius", "6px");
					return false;
				}else{
					$("#officeToHomeTo_td_id").css("background-color", "white");
				}
	
				if(inBetweenPlacesArrayReturn=='null' || inBetweenPlacesArrayReturn.length <= 0 ){
					$.Zebra_Dialog('Please fill atleast one in between places you Returned to your destination by.', { 'type':'error','title':'Error' } );
					$('#officeToHomeInBetweenPlaces').focus();
					$("#officeToHomeInBetPlaces_td_id").css("background-color", "red");  
					$("#officeToHomeInBetPlaces_td_id").css("webkit-border-radius", "6px");
					return false;
				}else{
					$("#officeToHomeInBetPlaces_td_id").css("background-color", "white");
				}
			}
		}
		
		if(compensationPrice.checked){

			
			if (compensationAmount.trim() == "") {
				$.Zebra_Dialog('Please enter the amount you would like carpooler to compensate.', { 'type':'error','title':'Error' } );
				$('#compensationAmount').focus();
				$("#compensationPriceTD").css("background-color", "red");    	
				$("#compensationPriceTD").css("webkit-border-radius", "6px");
				return false;
			}else{
				$("#compensationPriceTD").css("background-color", "white");
			}
			
			
			var mobileRegex31 = new RegExp("^[0-9]+$", "i");
			var fieldVal31 = compensationAmount;

			if (!fieldVal31.match(mobileRegex31)) {
				$.Zebra_Dialog('Price Amount should only contain Numbers.', { 'type':'error','title':'Error' } ); 
				$('#compensationAmount').focus();
				$("#compensationPriceTD").css("background-color", "red");    	
				$("#compensationPriceTD").css("webkit-border-radius", "6px");
				return false;
			}else{
				$("#compensationPriceTD").css("background-color", "white");
			}
			
			

			if (fieldVal31.length >= 4) {
				$.Zebra_Dialog('Price Amount should not be greater then 9999 INR.', { 'type':'error','title':'Error' } ); 
				$('#compensationAmount').focus();
				$("#compensationPriceTD").css("background-color", "red");    	
				$("#compensationPriceTD").css("webkit-border-radius", "6px");
				return false;
			}else{
				$("#compensationPriceTD").css("background-color", "white");
			}
			
			
			
		}
		



		e.preventDefault();
		$.Zebra_Dialog(' ' + previewData + ' ', {
			'type':     'confirmation',
			'title':    'Confirmation',
			'buttons':  [
			             {caption: 'Yes', callback: function() { 
			            	 document.getElementById("testconfirmJQUpdate").submit();
			             }},
			             {caption: 'No', callback: function() { }}
			             ]
		});
	});

	$('#example5').bind('click', function(e) {
		e.preventDefault();
		new $.Zebra_Dialog('<strong>Zebra_Dialog</strong>, a small, compact and highly configurable dialog box plugin for jQuery', {
			'buttons':  false,
			'modal': false,
			'position': ['right - 20', 'top + 20'],
			'auto_close': 2000
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
