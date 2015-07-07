<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		
		
		<!-- TITLE Start -->
			<%@include file="../../jsp/include/title.jsp" %>
		<!-- TITLE End -->

		<!-- FAVICO Start -->
			<%@include file="../../jsp/include/favico.jsp" %>
		<!-- FAVICO END -->

		<!-- CSS USED FOR STYLING HOME PAGE Start -->
			<link rel="stylesheet" type="text/css" href="../css/body.css" media="screen">
		<!-- CSS USED FOR STYLING HOME PAGE END -->

		<!-- CSS USED FOR STYLING HOME PAGE Start -->
			<link rel="stylesheet" type="text/css" href="../css/footer.css" media="screen">
		<!-- CSS USED FOR STYLING HOME PAGE END -->


		<!-- For Complete Page start -->
			<link rel="stylesheet" type="text/css" href="../css/stylingRegisterPage.css" media="screen">
		<!-- For Complete Page end -->

		<!-- CSS FOR HEADER MENU START -->	
	  		<link rel="stylesheet" type="text/css" href="../css/header_menu_css.css" media="screen" />
		<!-- CSS FOR HEADER MENU END -->

		<!-- LOOPJ DROPDOWN PLUGIN START -->
			<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
			<script type="text/javascript" src="../resources/js/jquery.tokeninput.js"></script>
			<link rel="stylesheet" href="../resources/css/token-input.css" type="text/css" />
			<link rel="stylesheet" href="../resources/css/token-input-facebook.css" type="text/css" />
		<!-- LOOPJ DROPDOWN PLUGIN END -->

		<!-- FIELDSET START -->
			<link rel="stylesheet" href="../resources/fieldset/fieldset.css" type="text/css" />
		<!-- FIELDSET END -->

		<!-- TIMEPICKER START -->
		    <link rel="stylesheet" href="../resources/timepicker/jquery-ui-1.8.14.custom.css" type="text/css" />
		    <link rel="stylesheet" href="../resources/timepicker/jquery.ui.timepicker.css?v=0.3.1" type="text/css" />
		    <link rel="stylesheet" href="../resources/timepicker/custom.css" type="text/css" />
		    
		    <script type="text/javascript" src="../resources/timepicker/jquery.ui.core.min.js"></script>
		    <script type="text/javascript" src="../resources/timepicker/jquery.ui.timepicker.js?v=0.3.1"></script>
		<!-- TIMEPICKER END -->
	

		<!-- CUSTOM FORM VALIDATION FUNCTIONS START -->

		<!-- CUSTOM FORM VALIDATION FUNCTIONS END -->

		<!-- ZEBRA DATEPICKER START -->
	        <link rel="stylesheet" href="../resources/datepicker/zebra_datepicker.css" type="text/css">
	        <script type="text/javascript" src="../resources/datepicker/jquery-1.8.2.js"></script>
	
	        <script type="text/javascript" src="../resources/datepicker/zebra_datepicker.js"></script>
	        <script type="text/javascript" src="../resources/datepicker/functions.js"></script>	 
		<!-- ZEBRA DATEPICKER END -->
	
		<!-- DIALOG START -->
	        <link rel="stylesheet" href="../resources/dialogBox/zebra_dialog.css" type="text/css">
	        <script type="text/javascript" src="../resources/dialogBox/zebra_dialog.js"></script>
	        <script type="text/javascript" src="../resources/dialogBox/functions.js"></script>
		<!-- DIALOG END -->	
	</head>
	<body>
		<form:form action="submitRegisterPage.jsp" id="testconfirmJQRegister" commandName="User" enctype="multipart/form-data">    
			<div id="wrapper">
				<!-- HEADER START -->
					<%@include file="../../jsp/include/header.jsp" %>
				<!-- HEADER END -->
				<div id="page">	    
					<div id="container">
					 	<h3 class="title"></h3> <br/>
						<fieldset>   
						  	<legend style="height:88px;width:88px;background-image: url(../images/dl/lock-key.jpg); margin-left:65px;"></legend>
							<table width="100%" style="margin: 10px 10px 10px 10px;" border="0">
				
								<tr>
									<td width="50%">
										Enter your Name *: 
									</td>	
									<td align="left" id="nameTD" width="170px">
										<form:input path="userName" id="nameId" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
									<td width="50%"></td>
								</tr>
								<tr>
									<td width="50%">
										Enter Email Id *: 
									</td>	
									<td align="left" id="emailIdTD" width="170px">
										<form:input path="emailId" id="emailId" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
									<td width="50%"></td>
								</tr>
								<tr>
									<td>
										Enter Password *:
									</td>	
									<td align="left" id="newPasswordTD" width="170px">
										<form:password path="password" id="password" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
									<td width="50%"></td>
								</tr>
								<tr>
									<td>
										Retype Password *: 
									</td>	
									<td align="left" id="reTypePasswordTD" width="170px"> 
										<input type="password" name="reTypePassword" id="reTypePassword" style="width: 170px;" class="ui-timepicker-hour"/>
									</td>
									<td width="50%"></td>
								</tr>
								<tr>	
									<td>
										Enter Primary Contact Number *: 
									</td>
									<td align="left" id="primaryContactNumberTD" width="170px">
										<form:input path="primaryContactNumber" id="primaryContactNumber" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
									<td width="50%"></td>
								</tr>
								<tr>	
									<td>
										Enter Secondary Contact Number :
									</td>
									<td align="left" id="secondaryContactNumberTD" width="170px">
										<form:input path="secondaryContactNumber" id="secondaryContactNumber" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
									<td width="50%"></td>
								</tr>
								
								<tr>	
									<td>
										Gender *:
									</td>
									<td align="left">
										<div id="holder">
									 		<div>
												<div class="button-holder">
				
													<form:radiobutton path="gender" id="genderMale" name="gender" value="1" cssClass="regular-radio" />
													<label for="genderMale"></label>Male
													
													<form:radiobutton path="gender" id="genderFemale" name="gender" value="0" cssClass="regular-radio" />
													<label for="genderFemale"></label>Female
				
												</div>
											</div>
										</div>
									</td>
									<td width="50%"></td>
								</tr>
								
								<tr>
									<td>
										Date of Birth *:
									</td>	
									<td align="left" id="dobTD" width="170px">
										<form:input path="dob" id="datepicker-example8" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
									<td width="50%"></td>
								</tr>
								
							</table>
						</fieldset>


						<fieldset>   
						  	<legend style="height:87px;width:103px;background-image: url(../images/dl/Home.png); margin-left:65px;"></legend>
							<table width="798" style="margin: 10px 10px 10px 10px;" border="0">
								<tr>
									<td valign="top">
										Enter Address :
									</td>
									<td align="left" id="singleAddressTD" width="470px" height="100px">
										  <form:textarea path="address.singleAddress" id="singleAddress" cssStyle="width: 470px; height: 100px;" cssClass="address_textarea"/>
									</td>
								</tr>
								<tr>	
									<td>
										Enter City Name :
									</td>
									<td align="left" id="cityTD" width="170px">
										<form:input path="address.cityName" id="cityName" value="Bangalore" readonly="true" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
								</tr>	
								<tr>
									<td>
										Enter State Name :
									</td>	
									<td align="left" id="stateID" width="170px">
										<form:input path="address.stateName" id="stateName" value="Karnataka" readonly="true" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
								</tr>
								<tr>
									<td>
										Enter Country Name : 
									</td>	
									<td align="left" id="countryID" width="170px">
										<form:input path="address.countryName" id="countryName" value="India" readonly="true"  cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
									</td>
								</tr>
								
							</table>
						</fieldset>

						<fieldset>   
						  	<legend style="height:101px;width:125px;background-image: url(../images/dl/gallery-icon.png); margin-left:65px;"></legend>
							<table width="798" style="margin: 10px 10px 10px 10px;" border="0">
								<tr>
									<td colspan="2" style="color: red;"><form:errors path="*" cssStyle="color : red;"/>
        							 	${errors}
        							 </td>
        						</tr>
								<tr>	
									<td align="left" id="userProfilePicfileTD" width="250px">
										Upload your picture :
                    					<input type="file" name="file" style="width: 250px;" id="userProfilePicfile" class="ui-timepicker-hour"/>
                    					<br/><br/>
                    					Max <strong>2MB</strong> supported with allowable extensions as <strong> png, jpg, jpeg, gif </strong> only.
                    					<br/>
									</td>
								</tr>
							
					
							</table>
						</fieldset>
					
					
						
		   				<a href="javascript:void(0)" id="example333" class="classname1">Submit</a>
					</div> 
					<div style="clear: both;">&nbsp;</div>
				</div>	
			 	<div class="container"><img src="../images/img03.png" width="1000" height="40" alt="" /></div>
			</div>
			<!-- FOOTER TEXT START -->
				<%@include file="../../jsp/include/footer.jsp" %>
			<!-- FOOTER TEXT START -->
		</form:form>
	</body>
	
	
	
	
		<% if(request.getParameter("errors")!=null){ %>	
			<script type="text/javascript">
			var errors = "<%=request.getParameter("errors")%>";
			$(document).ready(function() {
			 	 $.Zebra_Dialog(''+errors, {
			  		'type':  'information',
			    	'title': 'Error.'
				  });
			});
			</script>  	
		<% } %>
	
	
	
</html>

