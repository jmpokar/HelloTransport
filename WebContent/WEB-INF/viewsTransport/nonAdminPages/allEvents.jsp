<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	
		<!-- BUS FARE DIALOG START -->
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
			
		<script type="text/javascript">
			$(document).ready(function(){	 
			    $('#viewAllNews').click(function(){
			    	$("#allNews").slideToggle();			    	 	
			    	var str=$("#viewAllNews").html();  
			    	
			        if(str == "View All News/Events."){
			        	$("#singleNews").hide();
			        	$("#viewAllNews").text("Hide All News/Events."); 
			        /* 	$("#viewAllNews").hide(); */
			        }
			        if(str == "Hide All News/Events."){
			        	$("#singleNews").show();
			        	$("#viewAllNews").text("View All News/Events.");
			        }
		    	});			 
			});
		</script>
		
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
		        <div id="content" style="width: 96%;">
		        	<h2>News & Events</h2>
    				<c:if test="${eventId ne null}">
  						<div id="singleNews" style="padding: 50px;">	
	  						<c:forEach var="news1" items="${listOfNews}">
	  							<c:if test="${ news1 ne null }">
	  								<c:if test="${ news1.newsId eq eventId }">		
										<table width="90%" border="0" align="center">
										  	<tr >
										    	<td width="67" rowspan="3" valign="top">
										    		<img src="../resources/common/images/misc/news.png" width="60px" height="60px"></img>
										    	</td>
										    	<td><b>Subject : </b>${ news1.newsSubject }</td>
										  	</tr>
										  	<tr>
										   	 	<td>${ news1.newsContent }</td>
										  	</tr>
										  	<tr>
										    	<td>&nbsp;</td>
											</tr>
										</table>
									</c:if>											
								</c:if>		
							</c:forEach>
						</div>
						<center><a href="#" id="viewAllNews">View All News/Events.</a></center>
					</c:if>
					<c:if test="${ listOfNews ne null}">
						<div id="allNews" style="padding: 50px; display: <c:if test="${eventId ne null}">none;</c:if>">
			        		<c:choose>
			    				<c:when test="${listOfNews ne null && fn:length(listOfNews) gt 0}">
			  						<c:forEach var="news1" items="${listOfNews}">
			  							<c:if test="${ news1 ne null }">		
											<table width="90%" border="0" align="center">
											  	<tr >
											    	<td width="67" rowspan="3" valign="top">
											    		<img src="../resources/common/images/misc/news.png" width="60px" height="60px"></img>
											    	</td>
											    	<td><b>Subject : </b>${ news1.newsSubject }</td>
											  	</tr>
											  	<tr>
											   	 	<td>${ news1.newsContent }</td>
											  	</tr>
											  	<tr>
											    	<td>&nbsp;</td>
												</tr>
											</table>
										</c:if>
											<hr></hr>							
									</c:forEach>
								</c:when>
								<c:otherwise>
									No News Found
								</c:otherwise>
							</c:choose>	 			
						</div>
					</c:if>
        		</div>
        		<div class="cleaner"></div>
    		</div>
    		<%@ include file="../../../includes/transport/footer.jsp" %>   
		</div> 
	</body>
</html>