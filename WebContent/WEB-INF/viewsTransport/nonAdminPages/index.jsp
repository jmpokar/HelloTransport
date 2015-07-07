<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="../../../includes/transport/titleAndMeta.jsp" %>
			
		<!-- JQUERY -->
		<%@ include file="../../../includes/transport/jquery.jsp" %>
 	
		<!-- BOOOTSTRAP -->
		<%@ include file="../../../includes/transport/bootstrap-css.jsp" %>
	
		<!-- MENUBAR STARTED -->
		<%@ include file="../../../includes/transport/menubar.jsp" %>
		<!-- MENUBAR ENDED -->	
	
		<!-- SCROLLING EVENTS STARTED -->
		<%@ include file="../../../includes/transport/scrollingEvents.jsp" %>
		<!-- SCROLLING EVENTS ENDED -->	
	
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->

		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- BUS FARE DIALOG START -->
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
		
		<!-- HOME PAGE JSSOR SLIDER START -->
		<%@ include file="../../../includes/transport/jssorslider.jsp" %>
		<!-- HOME PAGE JSSOR SLIDER END -->
        
    	<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
	
	</head>
	<body id="home">
		
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>
		<div id="templatemo_wrapper">
    
	    	<%@ include file="../../../includes/transport/busFareDialogBody.jsp" %>
		    <%@ include file="../../../includes/common/header.jsp" %>
		    <%@ include file="../../../includes/transport/userMenu.jsp" %>
    
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>

		    <div id="templatemo_main">		        
		        <div id="sidebar" style="float: right;">
		        	<h3>News</h3>    						
					<%@ include file="../../../includes/transport/newsTickerTransportBody.jsp" %>	
		        </div>

		        <div id="content" style="width: 550px;">
					<!-- Jssor Slider Begin -->
					<%@ include file="../../../includes/transport/jssorsliderTransportBody.jsp" %>
				    <!-- Jssor Slider End -->
		        </div> 
		        <div class="cleaner"></div>
		    </div> 
		    
		    <%-- ${totalUserCount} --%>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
		
	</body>
</html>