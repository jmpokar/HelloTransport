<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	
		<!-- JQUERY -->
		<%@ include file="../../../includes/transport/jquery.jsp" %>
 	
		<!-- BOOOTSTRAP -->
		<%@ include file="../../../includes/transport/bootstrap-css.jsp" %>
		
		<!-- MENUBAR STARTED -->
		<%@ include file="../../../includes/transport/menubar.jsp" %>
		<!-- MENUBAR ENDED -->	
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->

		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
		
		
		<!-- MULTISELECT DAYS START -->
		<link rel="stylesheet" type="text/css" href="../../resources/carpool/multiselectDaysSelection/jquery.multiselect.css" />
		<script type="text/javascript" src="../../resources/carpool/multiselectDaysSelection/jquery.multiselect.js"></script>	
		<script type="text/javascript">
		$(function(){
		
			$("#weekDays123").multiselect({
				selectedList: 7
			});
		});
		</script> 
		<!-- MULTISELECT DAYS END -->
		
		
		<!-- ZEBRA DATEPICKER START -->
	      <!--   <link rel="stylesheet" href="../../resources/datepicker/zebra_datepicker.css" type="text/css" />
	  		<link rel="stylesheet" href="../../resources/datepicker/style.css" type="text/css" />
	        <script type="text/javascript" src="../../resources/datepicker/zebra_datepicker_for_letspool.js"></script>
	        <script type="text/javascript" src="../../resources/datepicker/functions.js"></script>	 -->
		<!-- ZEBRA DATEPICKER END -->
		<!-- ZEBRA DATEPICKER START -->
		<%@ include file="../../../includes/carpool/datepicker.jsp" %>
		<style>
			.Zebra_DatePicker{
		    	position: absolute;
		    } 
	
			</style>
		<!-- ZEBRA DATEPICKER END -->
		
						 
		<!-- FIELDSET START -->
		<link rel="stylesheet" href="../../../resources/carpool/fieldset/fieldset.css" type="text/css" />
		<!-- FIELDSET END -->
				
		<!-- TIMEPICKER START -->
	    <%@ include file="../../../includes/carpool/timepicker.jsp" %>
		<!-- TIMEPICKER END -->
		
		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
		
		<!-- CUSTOM FORM VALIDATION FUNCTIONS START -->
		<SCRIPT LANGUAGE="JavaScript">
			function setShemp() {
				var inputElements1 = document.getElementById("carpoolOneWayTwoOptionYes");
				if (inputElements1.checked) {
					var mydiv = document.getElementById("returnRouteSameOptionDiv");
					mydiv.style.display = 'block';
					mydiv.style.visibility = 'visible';
					
					var leavingDestinationPlaceDiv = document.getElementById("leavingDestinationPlaceDiv");
					leavingDestinationPlaceDiv.style.display = 'block';
					leavingDestinationPlaceDiv.style.visibility = 'visible';
					
					
					var inputElements2 = document.getElementById("returnRouteSameOptionNo");
					if (inputElements2.checked) {
						var mydiv2 = document.getElementById("officeToHomeRouteDiv");
						mydiv2.style.display = 'block';
						mydiv2.style.visibility = 'visible';
					}else{
						var mydiv1 = document.getElementById("officeToHomeRouteDiv");
						mydiv1.style.display = 'none';			
					}

					var carpoolOnSpecificDates = document.getElementById("carpoolOnSpecificDates");					
					if(carpoolOnSpecificDates.checked){
						var returningDateTR = document.getElementById("returningDateTR");
						returningDateTR.style.display = 'block';
						returningDateTR.style.visibility = 'visible';
					}
					
				}else{
					var mydiv = document.getElementById("returnRouteSameOptionDiv");
					mydiv.style.display = 'none';
					var mydiv2 = document.getElementById("officeToHomeRouteDiv");
					mydiv2.style.display = 'none';
					var leavingDestinationPlaceDiv = document.getElementById("leavingDestinationPlaceDiv");
					leavingDestinationPlaceDiv.style.display = 'none';	
					var returningDateTR = document.getElementById("returningDateTR");
					returningDateTR.style.display = 'none';	
				}
			}
		</SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
			function compensate() {
				var inputElements2 = document.getElementById("compensationPrice");
				if (inputElements2.checked) {
					var mydiv = document.getElementById("compensationPriceDiv");
					mydiv.style.display = 'block';
					mydiv.style.visibility = 'visible';
				}else{
					var mydiv = document.getElementById("compensationPriceDiv");
					mydiv.style.display = 'none';
				}
			}
		</SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
			function returnRouteChoice() {
				var inputElements1 = document.getElementById("returnRouteSameOptionYes");
					
				if (!inputElements1.checked) {
					var mydiv1 = document.getElementById("officeToHomeRouteDiv");
					mydiv1.style.display = 'block';
					mydiv1.style.visibility = 'visible';
				}else{
					var mydiv1 = document.getElementById("officeToHomeRouteDiv");
					mydiv1.style.display = 'none';
				}
			}
		</SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
			function carpoolProvidingOnCheck() {
				var carpoolOnSpecificDays = document.getElementById("carpoolOnSpecificDays");
				if (carpoolOnSpecificDays.checked) {
					
					var daysSelectionDiv = document.getElementById("daysSelectionDiv");
					daysSelectionDiv.style.display = 'block';
					daysSelectionDiv.style.visibility = 'visible';
					
					var specificDateSelectionDiv = document.getElementById("specificDateSelectionDiv");
					specificDateSelectionDiv.style.display = 'none';	
					
					var returningDateTR = document.getElementById("returningDateTR");
					returningDateTR.style.display = 'none';	
					
									
				}else{
					
					var specificDateSelectionDiv = document.getElementById("specificDateSelectionDiv");
					specificDateSelectionDiv.style.display = 'block';
					specificDateSelectionDiv.style.visibility = 'visible';
					
					var carpoolOneWayTwoOptionYesByUser = document.getElementById("carpoolOneWayTwoOptionYes");
					if (carpoolOneWayTwoOptionYesByUser.checked) {
						var returningDateTR = document.getElementById("returningDateTR");
						returningDateTR.style.display = 'block';
						returningDateTR.style.visibility = 'visible';
					}	
					var daysSelectionDiv = document.getElementById("daysSelectionDiv");
					daysSelectionDiv.style.display = 'none';
				}
			}
		</SCRIPT>
		
		<SCRIPT LANGUAGE="JavaScript">
			function carpoolContactCheck() {
				var emailCheck = document.getElementById("checkbox-1-3");
				if (emailCheck.checked) {

					var emailIdDifferent = document.getElementById("emailIdDifferent");
					emailIdDifferent.style.display = 'none';

				}else{
					var emailIdDifferent = document.getElementById("emailIdDifferent");
					emailIdDifferent.style.display = 'block';
					emailIdDifferent.style.visibility = 'visible';
				}
			}
		</SCRIPT>
		<!-- CUSTOM FORM VALIDATION FUNCTIONS END -->
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
	        	<div id="content" style="width: 96%;">
	        		<h2>Lets Carpool</h2>
					<form:form action="submitPool.jsp" id="testconfirmJQ" commandName="LetsPoolIt" >    
						<div id="wrapper">
							<div id="page">	    
								<div id="container">
									
									<!-- CARPOOLER START AND END DATE START -->
									<%@include file="letspool/carpoolerDateSelectionOptions.jsp" %>
									<!-- CARPOOLER START AND END DATE END -->
				
									<!-- CARPOOLER START AND END TIMING DETAILS START -->
									<%@include file="letspool/carpoolerSourceToDestinationRouteOption.jsp" %>
									<!-- CARPOOLER START AND END TIMING DETAILS END -->
				   	
									<!-- CARPOOLER RETURN ROUTE DETAILS START -->
									<%@include file="letspool/carpoolerReturnRouteOption.jsp" %>
									<!-- CARPOOLER RETURN ROUTE DETAILS END -->
									 
					    			<!-- CARPOOLER PREFERENCE START -->
									<%@include file="letspool/carpoolerPreference.jsp" %>
									<!-- CARPOOLER PREFERENCE END -->
	
					    			<!-- T&C AGRREMENT START -->
									<%@include file="letspool/termsAndAgreement.jsp" %>
									<!-- T&C AGRREMENT END -->
			
	   								<a href="javascript:void(0)" id="example31" class="myButton">Submit</a>
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