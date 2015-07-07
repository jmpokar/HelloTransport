<%@page import="com.corporate.transportdb.dto.updated.UserRouteMappingUpdated"%>
<%@page import="com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.corporate.transportdb.dto.updated.UserRequestNew"%>
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
	
	 	<!-- DIALOG START -->
	 	<%@ include file="../../../includes/transport/dialogBox.jsp" %>
		<!-- DIALOG END -->
	
	 	<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
			
		<!-- STYLING TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLING TABLE END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->

		<script type="text/javascript">
			$(function() {
				$('#buttons').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        // find out clicked id and open dialog
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 
			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: $(window).width()-50, 
				        height: $(window).height()-50,
					    buttons: {
							"Close": function() {
							    $(this).dialog("close");
							}
					    }
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
			/* 	
			#search-box {
			    position: relative;
			    width: 100%;
			    margin: 0;
			}
			#search-form {
			    height: 40px;
			    border: 1px solid #999;
			    -webkit-border-radius: 5px;
			    -moz-border-radius: 5px;
			    border-radius: 5px;
			    background-color: #fff;
			    overflow: hidden;
			}
			
			#search-text {
			    font-size: 14px;
			    color: #ddd;
			    border-width: 0;
			    background: transparent;
			}
			
			#search-box input[type="text"] {
			    width: 90%;
			    padding: 11px 0 12px 1em;
			    color: #333;
			    outline: none;
			}
			
			#search-button {
			    position: absolute;
			    top: 0;
			    right: 0;
			    height: 42px;
			    width: 80px;
			    font-size: 14px;
			    color: #fff;
			    text-align: center;
			    line-height: 42px;
			    border-width: 0;
			    background-color: #999;
			    -webkit-border-radius: 0px 5px 5px 0px;
			    -moz-border-radius: 0px 5px 5px 0px;
			    border-radius: 0px 5px 5px 0px;
			    cursor: pointer;
			} */
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
	</head>
	<body id="home">

		<!-- NOTIFICATION STARTED -->
		<% if(request.getAttribute("status")!=null){ %>	
			<script type="text/javascript">
				var status = "<%=request.getAttribute("status")%>";
				alert(status);
			</script>  
		<% } %>
		<% if(request.getParameter("status")!=null){ %>	
			<script type="text/javascript">
				var status = "<%=request.getParameter("status")%>";
				alert(status);
			</script>  
		<% } %>
		<!-- NOTIFICATION ENDED -->
	
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>
		<div id="templatemo_wrapper">
				
 	    	<%@ include file="../../../includes/common/header.jsp" %>
	    	<%@ include file="../../../includes/transport/adminMenu.jsp" %>
	        
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
			
			<div id="templatemo_main">
        		<div id="content" style="width: 96%;">
         			<h2>Charging Module</h2> 
        								
					<div class="horizon_divider"></div>
					<c:choose>
						<c:when test="${listOfRouteDetailsHelper ne null && fn:length(listOfRouteDetailsHelper) gt 0}">								
							<div id="buttons" style="padding-top: 50px;">
								<table id="report" border="1" width="100%" class="customers">
									<tr>
										<td>Route</td>
										<td>Member Count</td>
										<td>Total Amount</td>
										<td>Action</td>
									</tr>
									<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCount" >
										<tr class="odd">
											<td>
												<p><em>${routeDetailsHelper.route.routeName}</em></p>
											</td>
											<td>
												<p><em>${ fn:length(routeDetailsHelper.listOfUserRouteMappingUpdated ) } Employee</em></p>
											</td>
											<td>
												<p>
													<em> 
										            	${ fn:length(routeDetailsHelper.listOfUserRouteMappingUpdated ) * busFare.busFareAmount } Rs
													</em>
												</p>
											</td>
											<td style="width: 200px;">
												<a style="text-decoration: none; float: left; margin-right: 5px;" href="#" class="myButton" id="btn_${routeDetailsHelper.route.routeId}">Employee List</a>
											</td>
										</tr>
									</c:forEach>	
								</table>	
							</div>
							
							<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG START -->
							<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCounter">
								<%-- <div id="dialog_${theCounter.count}" class="dialogbox" style="display:none;"> --%>
								<div id="dialog_${routeDetailsHelper.route.routeId}" class="dialogbox" style="display:none;">
								
									<b>Passenger Details:</b>
									<center><a href="#" class="show_hide">Show Passenger Details</a></center>
									<div class="slidingDiv">
										<table width="100%" border="0" style="overflow-y: scroll; display: block;" id="passengerDetailsDiv">
											<tr>
												<td width="10%" style="background-color: gray;">SL No</td>
												<td width="30%" style="background-color: gray;">Employee</td>
												<td width="30%" style="background-color: gray;">Pick Up Point</td>
												<td width="15%" style="background-color: gray;">Time</td>
												<td width="15%" style="background-color: gray;">Amount</td>
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
																				<td>${ busFare.busFareAmount } Rs</td>
																				<td></td>
																			</tr>
																			<c:set var="count" value="${count + 1}" />
																		</c:if>
																	</c:forEach>
																</c:forEach>
															</c:when>
															<c:otherwise>
															
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>
														<tr class="odd">
															<td colspan="6">
																No Members Found
															</td>
														</tr>
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

		<!-- DROPDOWN START -->
	  	<!-- 
	  	<script src="../../../resources/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
	  	<script type="text/javascript"> 
		    var config = {
		      '.chzn-select'           : {},
		      '.chzn-select-deselect'  : {allow_single_deselect:true},
		      '.chzn-select-no-single' : {disable_search_threshold:10},
		      '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
		      '.chzn-select-width'     : {width:"95%"}
		    }
		    for (var selector in config) {
		      $(selector).chosen(config[selector]);
		    }
	  	</script> -->
		<!-- DROPDOWN END -->
	</body>
</html>