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
		<%@ include file="../../../includes/transport/titleAndMeta.jsp" %>
			
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

		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
		
		<!-- BUS FARE DIALOG START -->
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
		
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
		
		<!-- STYLISH TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLISH TABLE END -->

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#buttons').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 
			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: $(window).width()-50, 
				        height: $(window).height()-50 
			        });
				});
			});
	
			$(function() {	
				$('#buttons1').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        // find out clicked id and open dialog
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 
			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: $(window).width()-50, 
				        height: $(window).height()-50 				        
			        });
			    });
			});
		</script>

<!-- 		<style type="text/css">
			.slidingDiv {
			    height:300px;
			    padding:20px;
			    margin-top:10px;
			}			 
			.show_hide {
			    display:none;
			}			
		</style>
		
		<script type="text/javascript">
			function closeDiv(){
				var div = document.getElementById('searchResults');
				div.style.display='none';
			}
		</script>
 
		<script type="text/javascript">
			$(document).ready(function(){
		        $(".slidingDiv").hide();
		        $(".show_hide").show();			 
			    $('.show_hide').click(function(){
			    	$(".slidingDiv").slideToggle();			    	 	
			    	var str=$(".show_hide").html();        
			        if(str == "Show Passenger Details"){
			        	$(".show_hide").text("Hide Passenger Details");
			        }
			        if(str == "Hide Passenger Details"){
			        	$(".show_hide").text("Show Passenger Details");
			        }
		    	});			 
			});
		</script>
-->
 		
		
		
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
	        		<h2>Transport Team</h2>

						<input type="button" class="myButton" id="myB" onClick="window.print()" value="Print This Page" style="float: right;"/>
						<br></br>
			
						<c:choose>
							<c:when test="${ (requestPrintingFor eq 'particularRoute')}">
								<c:if test="${ (routeDetailsUpdated ne null)}">	
								
									<br><br>
									<table border="1" class="customers">
										<tr>
											<td colspan="5">
												<p>
										    		<em style="color: #E1EBF0;"> 
										    			${ routeDetailsUpdated.route.routeName } (${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleCapacity } SEATER)
										    			<br><br>
										    			<c:choose>
									            			<c:when test="${routeDetailsUpdated.listOfRoutePlaceMappingUpdated ne null && fn:length(routeDetailsUpdated.listOfRoutePlaceMappingUpdated) gt 0}">
								            					From: ${ routeDetailsUpdated.listOfRoutePlaceMappingUpdated[0].place.placeName}  &nbsp; &nbsp;  
								            					To: ${ routeDetailsUpdated.listOfRoutePlaceMappingUpdated[fn:length(routeDetailsUpdated.listOfRoutePlaceMappingUpdated)-1].place.placeName}
							    							</c:when>
							    						</c:choose>
										    		</em>
										    	</p>
											</td>	
										</tr>
										<tr style="background: gray;">
										    <td colspan="2">VEHICLE NUMBER</td>
										    <td>DRIVER NAME</td>
										    <td colspan="2">MOB NUMBER</td>
										</tr>
										<tr>
											<td colspan="2">${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleNumber }</td>
											<td>${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverName }</td>
											<td colspan="2">${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverMobileNumber }</td>
										</tr>
										<tr style="background: gray;">
											<td>SL No.</td>
											<td>Employee</td>
											<td>Pick Up Point</td>
											<td colspan="2">Time</td>
										</tr>
										<c:choose>
				 							<c:when test="${routeDetailsUpdated.listOfUserRouteMappingUpdated ne null && fn:length(routeDetailsUpdated.listOfUserRouteMappingUpdated) gt 0 &&  cabType eq 'regular_cab'}">
												<c:set var="count" value="1" scope="page" />
												<c:forEach var="place" items="${routeDetailsUpdated.listOfRoutePlaceMappingUpdated}" >
													<c:forEach var="user" items="${routeDetailsUpdated.listOfUserRouteMappingUpdated}" >  
											   			<c:choose>						  									  			
											  				<c:when test="${user.place.placeName eq place.place.placeName}">	
														  		<tr>
															    	<td>${count}</td>
																    <td>${ user.user.userName }</td>
																    <td>${ user.place.placeName }</td>
															    	<c:if test="${ (place.place.placeName eq user.place.placeName)}">	
															    		<td colspan="2"><fmt:formatDate pattern="HH:mm:ss" value="${ place.arrivalTime }" /></td>
															    	</c:if>	
																</tr>
														  		<c:set var="count" value="${count + 1}" />	
											  				</c:when>
											  				<c:otherwise>
											  				</c:otherwise>
											  			</c:choose>
										    		</c:forEach>  
										    	</c:forEach>
									    	</c:when>
											<c:otherwise>
												<c:set var="count" value="1" scope="page" />
												<c:forEach var="place" items="${routeDetailsUpdated.listOfRoutePlaceMappingUpdated}" >
													<c:forEach var="user" items="${routeDetailsUpdated.listOfUserRouteMappingForNightCabUpdated}" >  
														<tr>
													  		<c:if test="${ (place.place.placeName eq user.place.placeName)}">	
																<td>${count}</td>
															    <td>${ user.user.userName }</td>
															    <td>EC Office</td>
														    	<td><fmt:formatDate pattern="HH:mm:ss" value="${ place.arrivalTime }" /></td>
															    <!-- <td>&nbsp;</td> -->
															</c:if>
														</tr>
												  		<c:set var="count" value="${count + 1}" />	
											    	</c:forEach>  
										    	</c:forEach>
									    	</c:otherwise>
										</c:choose>
									</table>
								</c:if>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
							
						<c:choose>
							<c:when test="${ (requestPrintingFor eq 'allRoute')}">
								<c:if test="${ (routeDetailsUpdated ne null)}">	
				 					<c:forEach var="routeDetailsUpdated" items="${routeDetailsUpdated}" >
				  						<br><br>
				  						<div class="print">
											<table border="0" class="customers">
									  			<tr>
									    			<td colspan="5">
									    	 			${ routeDetailsUpdated.route.routeName } 
									    				(${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleCapacity } SEATER)
									    			</td>
									  			</tr>
												<tr style="background: gray;">
												  	
													<td colspan="2">VEHICLE NUMBER</td>
													<td>DRIVER NAME</td>
													<td colspan="2">MOB NUMBER</td>
													
												</tr>
												<tr style="background: white;">
													<td colspan="2">${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleNumber }</td>
													<td>${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverName }</td>
													<td colspan="2">${ routeDetailsUpdated.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverMobileNumber }</td>
												</tr>
												<tr style="background: gray;">
													<td>SL No</td>
													<td>Employee</td>
													<td>Pick Up Point</td>
													<td colspan="2">Time</td>
												</tr>
												<c:choose> 
				 									<c:when test="${routeDetailsUpdated.listOfUserRouteMappingUpdated ne null && fn:length(routeDetailsUpdated.listOfUserRouteMappingUpdated) gt 0 && cabType eq 'regular_cab'}">
										   				<c:set var="count" value="1" scope="page" />
														<c:forEach var="place" items="${routeDetailsUpdated.listOfRoutePlaceMappingUpdated}" >
															<c:forEach var="user" items="${routeDetailsUpdated.listOfUserRouteMappingUpdated}" >  
											   					<c:choose>
											  						<c:when test="${user.place.placeName eq place.place.placeName}">	
														  				<tr>
																		    <td>${count}</td>
																		    <td>${ user.user.userName }</td>
																		    <td>${ user.place.placeName }</td>										    
																	    	<c:if test="${ (place.place.placeName eq user.place.placeName)}">	
																	    		<td colspan="2"><fmt:formatDate pattern="HH:mm:ss" value="${ place.arrivalTime }" /></td>
																	    	</c:if>	
														  				</tr>
														  				<c:set var="count" value="${count + 1}" />	
											  						</c:when>
											  						<c:otherwise>
														  			</c:otherwise>
																</c:choose>
															</c:forEach>  
										    			</c:forEach>
									    			</c:when>
									    			<c:otherwise>
									    			</c:otherwise>
									  			</c:choose>
											</table>
										</div>
										<br><br>
										<hr>
										<br>
									</c:forEach>
								</c:if>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>	
							
        		</div> 
        		
        		<div class="cleaner"></div>
    		</div>

    		<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>