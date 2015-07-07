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
	
		<!-- BUS FARE DIALOG START -->
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
		
		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
		
	 	<!-- DIALOG START -->
	 	<%@ include file="../../../includes/transport/dialogBox.jsp" %>
		<!-- DIALOG END -->
		
		<!-- STYLING TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLING TABLE END -->

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

		<style type="text/css">
			.slidingDiv {
			    height:300px;
			   /*  background-color: #99CCFF; */
			    padding:20px;
			    margin-top:10px;
			    /* border-bottom:5px solid #3399FF; */
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
				
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
	
		<!-- 	
			<script type="text/javascript">
		    $(document).ready(function(){
				if($("#appSelection").val()==0){
					$("#menuCarpool").css("display","none");
			    	$("#menuTransport").css("display","block");
				}else{
					$("#menuCarpool").css("display","block");
			    	$("#menuTransport").css("display","none");
				}
		    });
			</script>
		 -->	
		
	</head>
	<body id="home">
	
		<!-- NOTIFICATION STARTED -->		
		<% if(request.getAttribute("status")!=null){ %>	
			<script type="text/javascript">
				var status = "<%=request.getAttribute("status")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+status, {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
			</script>  
		<% } %>
	
		<% if(request.getParameter("status")!=null){ %>	
			<script type="text/javascript">
				var feedbackSavingResult = "<%=request.getParameter("status")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+status, {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
			</script>  
		<% } %>	
		<!-- NOTIFICATION ENDED -->
		
		    
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
	        		<h2>Cab Booking</h2> 
					<div class="horizon_divider"></div>

					<span>	
						<!-- <label style="float: left; font-size: 25px;">Transport Team Members</label> --> 
					<!-- 	<h4 style="font-size: 14px; padding-bottom: 10px; border-bottom: 1px solid #ccc; margin: 5px;">Details</h4> -->
						<a style="text-decoration: none; float: right;" href="printAllPassengerList" class="myButton">Print All Passenger List</a>
					</span>

					<c:choose>
						<c:when test="${listOfRouteDetailsHelper ne null && fn:length(listOfRouteDetailsHelper) gt 0}">								
							<div id="buttons" style="padding-top: 50px;">
								<table id="report" border="1" width="100%" class="customers">
									<tr>
										<td>Route</td>
										<td>From</td>
										<td>To</td>
										<td>Start Time</td>
										<td>Passenger</td>
										<td>Action</td>
									</tr>
									<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCount" >
										<tr class="odd">
											<td>
												<p><em>${routeDetailsHelper.route.routeName}</em></p>
											</td>
											<td>
												<p>
													<em> 
														<c:if test="${routeDetailsHelper.listOfRoutePlaceMappingUpdated ne null && fn:length(routeDetailsHelper.listOfRoutePlaceMappingUpdated) gt 0}">
										            		${ routeDetailsHelper.listOfRoutePlaceMappingUpdated[0].place.placeName}
									    				</c:if>
													</em>
												</p>
											</td>
											<td>
												<p>
													<em>
														<c:if test="${routeDetailsHelper.listOfRoutePlaceMappingUpdated ne null && fn:length(routeDetailsHelper.listOfRoutePlaceMappingUpdated) gt 0}">
							            					${ routeDetailsHelper.listOfRoutePlaceMappingUpdated[fn:length(routeDetailsHelper.listOfRoutePlaceMappingUpdated)-1].place.placeName}
														</c:if>
													</em>
												</p>
											</td>
											<td>
												<p>
													<em>
														<c:if test="${routeDetailsHelper.listOfRoutePlaceMappingUpdated ne null && fn:length(routeDetailsHelper.listOfRoutePlaceMappingUpdated) gt 0}">
															<fmt:formatDate pattern="HH:mm:ss" value="${ routeDetailsHelper.listOfRoutePlaceMappingUpdated[0].arrivalTime }" />
														</c:if>
													</em>
												</p>
											</td>
											<td>
												<p>
													<em>
														<a href="printTransportTeamDetails?cabType=night&route=${ routeDetailsHelper.route.routeName }">Print All Passenger</a>		
													</em>
												</p>
											</td>
											<td style="width: 230px;">
												
												<a style="text-decoration: none; float: left; margin-right: 5px;" href="#" class="myButton" id="btn_${routeDetailsHelper.route.routeId}">Details</a>
												
												<c:choose>
													<c:when test="${ routeBooked ne null and routeBooked eq routeDetailsHelper.route.routeName }">
														<a style="text-decoration: none; float: left;" href="unBookCabForUser?route=${ routeDetailsHelper.route.routeId }" class="myButton">UnBook</a>
													</c:when>
													<c:otherwise>
														<a style="text-decoration: none; float: left;" href="bookCabForUser?route=${ routeDetailsHelper.route.routeId }" class="myButton">Book</a>
													</c:otherwise>
												</c:choose>												
											</td>
										</tr>
									</c:forEach>	
								</table>	
							</div>
							
							<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG START -->
							<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCounter">
								<%-- <div id="dialog_${theCounter.count}" class="dialogbox" style="display:none;"> --%>
								<div id="dialog_${routeDetailsHelper.route.routeId}" class="dialogbox" style="display:none;">
								
									<table width="100%" border="0" style="height: 40px; display: block;">
										<tr>
											<td colspan="5" align="left" style="background-color: transparent;" width="83%" >
												<b> Route Name: </b> 
												<!-- ROUTE NAME -->${ routeDetailsHelper.route.routeName } 
												<!-- ROUTE BUS CAPACITY -->(${routeDetailsHelper.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleCapacity} SEATER)
											</td>
										</tr>
									</table>
								
									<b>Vehicle Details:</b>
									<table width="100%" border="0" style="display: block; padding-bottom: 10px;">
										<tr>
											<td width="150px" style="background-color: gray;">VEHICLE NUMBER</td>
											<td width="540px" style="background-color: gray;">DRIVER NAME</td>
											<td width="140px" style="background-color: gray;">MOB NUMBER</td>
										</tr>
										<tr>
											<td style="background-color: white;">
												${routeDetailsHelper.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleNumber}
											</td>
											<td style="background-color: white;">
												${routeDetailsHelper.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverName}
											</td>
											<td style="background-color: white;">
												${routeDetailsHelper.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverMobileNumber}
											</td>
										</tr>
									</table>
		
									<b>Bus Stop Details:</b>
									<table style="width:100%;" border="0">
										<tr valign="top">
											<td width="40%">
												<table width="100%" border="0">
													<tr class="odd">
											    		<td style="background-color: gray;">Place Name</td>
											        	<td style="background-color: gray;">Arrival Time</td>
											 		</tr>
													<c:if test="${ (routeDetailsHelper.listOfRoutePlaceMappingUpdated ne null)}">	
														<c:forEach var="place" items="${routeDetailsHelper.listOfRoutePlaceMappingUpdated}">
													      	<tr class="odd">
														        <td>${ place.place.placeName }</td>
														        <td><fmt:formatDate pattern="HH:mm:ss" value="${ place.arrivalTime }" /></td>
													    	</tr>
														</c:forEach>
													</c:if>	      
												</table>	
											</td>
											<td width="40%" height="127" valign="top">
												<!-- <table width="100%" border="0">
										    		<tr class="odd" valign="top">
											        	<td style="background-color: gray;">Place Name</td>
											        	<td style="background-color: gray;">Depart Time</td>
													</tr>
											    	<tr class="odd">
														<td>EC City</td>
												    	<td>18.45</td>
													</tr>
												</table> -->
											</td>
											
										</tr>
									</table>
									
									<!-- ROUTE ON MAP START -->
									<table width="100%" border="0" style="margin-bottom: 10px;">
										<tr>
											<td width="58%">  
												<!-- <img width="150px" height="150px" src="../resources/table/p1161556380-3.jpg" alt="Flag of USA" /> -->
												
													${ routeDetailsHelper.route.routeMapUrl }
												
											</td>
											<td width="42%" valign="top">
															
												<div id="tableContainer" class="tableContainer">
													<table class="scrollTable" width="100%" border="0" cellpadding="0" cellspacing="0">
														<thead class="fixedHeader">
															<tr class="alternateRow" align="left" >
																<th style="width: 500px;"><center><a href="#">BMTC Bus Details</a><center></th>
															</tr>
														</thead>
														<tbody class="scrollContent">
															<tr class="normalRow">
																<td style="width: 100%; padding-bottom: 20px;" align="center">
																	
																	<table border="0" width="80%" style="float:center;">
																		<tr>
																			<td><em>Bus Route No:</em></td>
																			<td>600FB</td>
																		</tr>	
																		<tr>
																			<td><em>From:</em></td>
																			<td>BTM Layout Bus Stop</td>
																		</tr>	
																		<tr>
																			<td><em>To:</em></td>
																			<td>EC City (Wipro Gate)</td>
																		</tr>	
																		<tr>
																			<td><em>Distance:</em></td>
																			<td>13.25 km</td>
																		</tr>	
																		<tr>
																			<td><em>Time:</em></td>
																			<td>00hrs 27min</td>
																		</tr>	
																		<tr align="center">
																			<td colspan="2">
																				<a href="http://www.mybmtc.com/route/schedule/576/U/2850/BTM%20Layout%20Bus%20Stop?width=600&height=550&iframe=true">Route Timings</a>
																				<a href="http://www.mybmtc.com/tripplanner/route/busstops/576/20/31/U/600FB/print?width=550&height=600&iframe=true">Bus Stops</a>
																				<a href="http://www.mybmtc.com/tripplanner/route/location_via/576/20/31/U/0/print?width=1000&height=700&iframe=true">Map</a>
																			</td>
																		</tr>	
																	</table>
			
																</td>
															</tr>
				
															<tr class="alternateRow">
																<td style="width: 100%; padding-bottom: 20px;" align="center">
																
																	<table border="0" width="80%" style="float:center;">
																		<tr>
																			<td><em>Bus Route No:</em></td>
																			<td>600FB</td>
																		</tr>	
																		<tr>
																			<td><em>From:</em></td>
																			<td>BTM Layout Bus Stop</td>
																		</tr>	
																		<tr>
																			<td><em>To:</em></td>
																			<td>EC City (Wipro Gate)</td>
																		</tr>	
																		<tr>
																			<td><em>Distance:</em></td>
																			<td>13.25 km</td>
																		</tr>	
																		<tr>
																			<td><em>Time:</em></td>
																			<td>00hrs 27min</td>
																		</tr>	
																		<tr align="center">
																			<td colspan="2">
																				<a href="http://www.mybmtc.com/route/schedule/576/U/2850/BTM%20Layout%20Bus%20Stop?width=600&height=550&iframe=true">Route Timings</a>
																				<a href="http://www.mybmtc.com/tripplanner/route/busstops/576/20/31/U/600FB/print?width=550&height=600&iframe=true">Bus Stops</a>
																				<a href="http://www.mybmtc.com/tripplanner/route/location_via/576/20/31/U/0/print?width=1000&height=700&iframe=true">Map</a>
																			</td>
																		</tr>	
																	</table>
																		
																</td>
															</tr>
															<tr class="normalRow">
																<td style="width: 100%; padding-bottom: 20px;" align="center">
																	
																	<table border="0" width="80%" style="float:center;">
																		<tr>
																			<td><em>Bus Route No:</em></td>
																			<td>600FB</td>
																		</tr>	
																		<tr>
																			<td><em>From:</em></td>
																			<td>BTM Layout Bus Stop</td>
																		</tr>	
																		<tr>
																			<td><em>To:</em></td>
																			<td>EC City (Wipro Gate)</td>
																		</tr>	
																		<tr>
																			<td><em>Distance:</em></td>
																			<td>13.25 km</td>
																		</tr>	
																		<tr>
																			<td><em>Time:</em></td>
																			<td>00hrs 27min</td>
																		</tr>	
																		<tr align="center">
																			<td colspan="2">
																				<a href="http://www.mybmtc.com/route/schedule/576/U/2850/BTM%20Layout%20Bus%20Stop?width=600&height=550&iframe=true">Route Timings</a>
																				<a href="http://www.mybmtc.com/tripplanner/route/busstops/576/20/31/U/600FB/print?width=550&height=600&iframe=true">Bus Stops</a>
																				<a href="http://www.mybmtc.com/tripplanner/route/location_via/576/20/31/U/0/print?width=1000&height=700&iframe=true">Map</a>
																			</td>
																		</tr>	
																	</table>
			
																</td>
															</tr>
															
															
														</tbody>
													</table>
		
												</div>
												<div style="background-color: gray;">
													<center>
														More Info : <a href="http://www.mybmtc.com/trip-planner/BTM%20Layout%20Bus%20Stop%28522%29/Electronic%20City%20Wipro%20Gate%280%29/0/0/0/0/D/0/0">BMTC Website</a>
													</center>
												</div>
														
											</td>
										</tr>
									</table>
									<!-- ROUTE ON MAP END -->
		
									
									<!-- <b>Passenger Details:</b> -->
									<!-- <input type="button" class="myButton" value="Show Passenger Details" onclick="showHidePassengerDetails()" /> -->
									<center><a href="#" class="show_hide">Show Passenger Details</a></center>
									<div class="slidingDiv">
										<table width="100%" border="0" style="overflow-y: scroll; display: block;" id="passengerDetailsDiv">
											<tr>
												<td width="20%" style="background-color: gray;">SL No</td>
												<td width="35%" style="background-color: gray;">Employee</td>
												<td width="40%" style="background-color: gray;">Pick Up Point</td>
												<td width="20%" style="background-color: gray;">Time</td>
											</tr>
											<tr>
												<c:choose>
													<c:when test="${routeDetailsHelper.listOfUserRouteMappingUpdated ne null && fn:length(routeDetailsHelper.listOfUserRouteMappingUpdated) gt 0}">
														<c:set var="count" value="1" scope="page" />
														<c:choose>
															<c:when test="${routeDetailsHelper.listOfRoutePlaceMappingUpdated ne null && fn:length(routeDetailsHelper.listOfRoutePlaceMappingUpdated) gt 0}">
																<c:forEach var="routePlace" items="${routeDetailsHelper.listOfRoutePlaceMappingUpdated}">
																	<c:forEach var="user" items="${routeDetailsHelper.listOfUserRouteMappingUpdated}">
																		<c:if test="${ (user.place.placeName eq routePlace.place.placeName)}">
																			<tr class="odd">
																				<td height="20">${count}</td>
																				<td>${ user.user.userName }</td>
																				<td>${ user.place.placeName }</td>
																				<td><fmt:formatDate pattern="HH:mm:ss" value="${ routePlace.arrivalTime }" /></td>
																			</tr>
																			<c:set var="count" value="${count + 1}" />
																		</c:if>
																	</c:forEach>
																</c:forEach>
															</c:when>
														</c:choose>
													</c:when>
													<c:otherwise>
														<td colspan="4" align="center">
															No Passenger Found
														</td>	
													</c:otherwise>
												</c:choose>
											</tr>
										</table>
										<!-- <a href="#" class="show_hide">Hide Passenger Details</a> -->
									</div>
									
								</div>
							</c:forEach>
							<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG END -->
						</c:when>
						<c:otherwise>
							Sorry, No records found.
						</c:otherwise>
					</c:choose>
        		</div>
        		
        		<div class="cleaner"></div>
    		</div> 

    		<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>