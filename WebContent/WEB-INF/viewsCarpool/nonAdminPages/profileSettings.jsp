<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
	
		<!-- JQUERY -->
		<%@ include file="../../../includes/transport/jquery.jsp" %>
 	
		<!-- BOOOTSTRAP -->
		<%@ include file="../../../includes/transport/bootstrap-css.jsp" %>
		
		<!-- MENUBAR STARTED -->
		<%@ include file="../../../includes/transport/menubar.jsp" %>
		<!-- MENUBAR ENDED -->	

		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
				
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->

		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->

		<!-- FIELDSET START -->
		<link rel="stylesheet" href="../../../resources/carpool/fieldset/fieldset.css" type="text/css" />
		<!-- FIELDSET END -->

		<!-- ZEBRA DATEPICKER START -->
		<%@ include file="../../../includes/carpool/datepicker.jsp" %>
		<!-- ZEBRA DATEPICKER END -->

		<!-- DIALOG START -->
	 	<%@ include file="../../../includes/transport/dialogBox.jsp" %>
		<!-- DIALOG END -->

	</head>
	<body id="home">
	
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>    
		<div id="templatemo_wrapper">
	
		    <%@ include file="../../../includes/common/header.jsp" %>
		    <%@ include file="../../../includes/transport/userMenu.jsp" %>
    
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
		    
    		<div id="templatemo_main">
       			<div id="content" style="width:100%;">        
        			
			        <form:form action="updateUserAccountData.jsp" id="updateUserAccountData" commandName="User" >    
						<div id="wrapper">
							
							<div id="page">	    
								<div id="container">
									<fieldset>   
									  	<legend style="height:88px;width:91px;background-image: url(../../../resources/carpool/images/dl/lock-key.jpg); margin-left:65px;"></legend>
										<table width="98%" style="margin: 10px 10px 10px 10px;" border="0">
											<tr>
												<td width="51%" height="40px" valign="middle">
													Email Id :  
												</td>	
												<td align="left">
													<form:label path="emailId">${User.emailId}</form:label>
												</td>
												<td width="50%" align="right"><a href="changePassword.jsp" id="exampleChangePass1" class="myButton">Change Password</a></td>
											</tr>						
											<tr>	
												<td width="50%">
													Enter User Name *: 
												</td>
												<td align="left" id="userNameTD">
													<form:input path="userName" id="userName" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												<td width="50%" align="right"><a href="profilePictureSettings.jsp" id="exampleChangePass1" class="myButton">Change Profile Picture</a></td>
											</tr>
											<tr>	
												<td width="50%">
													Enter Primary Contact Number *: 
												</td>
												<td align="left" id="primaryContactNumberTD">
													<form:input path="primaryContactNumber" id="primaryContactNumber" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												<td width="50%"></td>
											</tr>											
											<tr>	
												<td width="50%">
													Enter Secondary Contact Number :
												</td>
												<td align="left" id="secondaryContactNumberTD">
													<form:input path="secondaryContactNumber" id="secondaryContactNumber" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												<td width="50%"></td>
											</tr>
											<tr>	
												<td width="50%">
													Gender
												</td>
												<td align="center">
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
												<td width="50%">
													Date of Birth *:
												</td>	
												<td align="left" id="dobTD">
													<c:set var="year" value="${fn:substring(User.dob, 0, 4)}" />
													<c:set var="month" value="${fn:substring(User.dob, 5, 7)}" />
													<c:set var="day" value="${fn:substring(User.dob, 8, 10)}" />
													<c:set var="sep" value="/" />
													<input id="datepicker-example8" name="dob" style="width: 170px;" class="ui-timepicker-hour" value="${year}${sep}${month}${sep}${day}"/>
												</td>
												<td width="50%"></td>
											</tr>							
										</table>
									</fieldset>
									<fieldset>   
										<legend style="height:87px;width:103px;background-image: url(../../../resources/carpool/images/dl/Home.png); margin-left:65px;"></legend>
										<table width="798" style="margin: 10px 10px 10px 10px;" border="0">
											<tr>
												<td valign="top">
													Enter Address :
												</td>
												<td align="left" width="470px">
													  <form:textarea path="address.singleAddress" id="singleAddress" cssStyle="width: 470px; height: 100px;" cssClass="address_textarea"/>
												</td>
																						
											</tr>
											<tr>	
												<td>
													Enter City Name *:
												</td>
												<td align="left" width="170px">
													<form:input path="address.cityName" id="cityName" value="Bangalore" readonly="true" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												
											</tr>	
											<tr>
												<td>
													Enter State Name *:
												</td>	
												<td align="left" width="170px">
													<form:input path="address.stateName" id="stateName" value="Karnataka" readonly="true" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												
											</tr>
											<tr>
												<td>
													Enter Country Name *: 
												</td>	
												<td align="left" width="170px">
													<form:input path="address.countryName" id="countryName" value="India" readonly="true"  cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
												</td>
												
											</tr>												
										</table>
									</fieldset>
									<a href="javascript:void(0)" id="example33341" class="myButton">Submit</a>
								</div> 
								<div style="clear: both;">&nbsp;</div>
							</div>
						</div>
					</form:form>
        		</div>
        		<div class="cleaner"></div>
    		</div>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>

