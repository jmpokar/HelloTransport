<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
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
		
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
				
		<!-- CSS USED FOR STYLING HOME PAGE Start -->
		<!-- <link rel="stylesheet" type="text/css" href="../css/stylingCarpoolerDetailsPage.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->

		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
		
	

		<!-- CSS FOR HEADER MENU END -->	
			<link rel="stylesheet" href="../../resources/carpool/accordionAtCarpoolerdetails/css/reset.css" type="text/css" media="all">
			<link rel="stylesheet" href="../../resources/carpool/accordionAtCarpoolerdetails/css/layout.css" type="text/css" media="all">
			<link rel="stylesheet" href="../../resources/carpool/accordionAtCarpoolerdetails/css/style.css" type="text/css" media="all">
			<script type="text/javascript" src="../../resources/carpool/accordionAtCarpoolerdetails/js/atooltip.jquery.js"></script>
			<script type="text/javascript" src="../../resources/carpool/accordionAtCarpoolerdetails/js/kwicks-1.5.1.pack.js"></script>
			<script type="text/javascript" src="../../resources/carpool/accordionAtCarpoolerdetails/js/script.js"></script>
		<!-- CSS FOR HEADER MENU END -->

		
		<!-- CSS USED FOR STYLING HOME PAGE Start -->
		<!-- <link rel="stylesheet" type="text/css" href="../css/body.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->

		<!-- CSS FOR HEADER MENU START -->	
	  		<!-- <link rel="stylesheet" type="text/css" href="../css/header_menu_css.css" media="screen" /> -->
		<!-- CSS FOR HEADER MENU END -->
		
		
		<script type="text/css">
		#footer {position: relative;
    		margin-top: -150px; /* negative value of footer height */
    		height: 150px;
    		clear:both;
    	} 
    	</script>
    	
    	
		
    	<style type="text/css">
    		
    		.sourceAndDestination{
    			font-style:oblique;
				font-size:14px;
				
    		}
    		
    		.inBetweenPlaces{
    			font-style:oblique;
				font-size:10px;	    		
    		}
    		
    	</style>
    	
    	<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->	
		
	 	<!-- DIALOG START -->
	 	<%@ include file="../../../includes/transport/dialogBox.jsp" %>
		<!-- DIALOG END -->
    	
		<!-- FOR FIELD VALIDATION AND SUBMIT START -->
			<script type="text/javascript" src="../../resources/carpool/accordionAtCarpoolerdetails/js/functions.js"></script>
    	<!-- FOR FIELD VALIDATION AND SUBMIT END -->
    	
    	<!-- CSS USED FOR STYLING HOME PAGE Start -->
			<!-- <link rel="stylesheet" type="text/css" href="../css/footer.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->
		
		
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
	
		<c:choose>
			<c:when test="${carpooler ne null}">
				<div class="body11">
					<div class="body21">
						<div class="main">
							<!-- THIS BLANK HEADER IS KEPT FOR SPACING BETWEEN HEADER AND BODY ACCORDION START --> 
								<header></header>
							<!-- THIS BLANK HEADER IS KEPT FOR SPACING BETWEEN HEADER AND BODY ACCORDION END -->
				
							<section id="content1">
								<div class="cont_bot_left"></div>
								<div class="cont_bot_right"></div>
								<div class="cont_top_left"></div>
								<div class="cont_top_right"></div>
								<div class="inner">
									<div class="kwiks_wrap">
										<ul class="kwicks horizontal">
											<!-- ACCORDION MAIN PAGE START -->
												  <%@include file="carpoolerDetails/accordianMainPage.jsp" %>
											<!-- ACCORDION MAIN PAGE END -->
											
											<!-- ACCORDION ROUTE DETAILS PAGE START -->
												  <%@include file="carpoolerDetails/accrodionRouteDetailsPage.jsp" %>
											<!-- ACCORDION ROUTE DETAILS PAGE END -->
																				
											<!-- ACCORDION CONTACT DETAILS PAGE START -->
												  <%@include file="carpoolerDetails/accrodionContactDetailsPage.jsp" %>
											<!-- ACCORDION CONTACT DETAILS PAGE END -->
										</ul>
									</div>
								</div>
							</section>
					    </div>
				    </div>
				</div>
			</c:when>
			<c:otherwise>
				<center> No Data found </center>
			</c:otherwise>
		</c:choose>

			<!-- FOOTER TEXT START -->
			<%@ include file="../../../includes/transport/footer.jsp" %>
			<!-- FOOTER TEXT START -->

	</body>
</html>
