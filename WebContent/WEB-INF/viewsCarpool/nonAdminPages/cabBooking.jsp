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
		<%@ include file="../../resources/includes/titleAndMeta.jsp" %>
		<link href="../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />
		
		<link rel="stylesheet" type="text/css" href="../resources/css/ddsmoothmenu.css" />
		
		<!-- <script type="text/javascript" src="../resources/js/jquery.min.js"></script> -->
		<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->
		<script type="text/javascript" src="../resources/dialogBox/jquery-1.7.2.js"></script> 
		<script type="text/javascript" src="../resources/js/ddsmoothmenu.js">
			/***********************************************
			* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
			* This notice MUST stay intact for legal use
			* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
			***********************************************/		
		</script>

		<script type="text/javascript">
			ddsmoothmenu.init({
				mainmenuid: "templatemo_menu", //menu DIV id
				orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
				classname: 'ddsmoothmenu', //class added to menu's outer DIV
				//customtheme: ["#1c5a80", "#18374a"],
				contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
			})
			
			function clearText(field)
			{
			    if (field.defaultValue == field.value) field.value = '';
			    else if (field.value == '') field.value = field.defaultValue;
			}
		</script>

		<!-- FEEDBACK PLUGIN START -->
		<!-- 	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript" charset="utf-8"></script> -->
			<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
			<script>
			$(document).ready(function() {
			      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
			});
			</script>
			<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
		<!-- FEEDBACK PLUGIN END -->
		
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> -->
	    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
	    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
	    <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" />
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->

		 <!-- DIALOG START -->			
		    
			<!-- <script type="text/javascript" src="../resources/dialogBox/highlight.js"></script> -->			
			<link rel="stylesheet" href="../resources/dialogBox/zebra_dialog.css" type="text/css" />
			<script type="text/javascript" src="../resources/dialogBox/zebra_dialog.js"></script>
			<script type="text/javascript" src="../resources/dialogBox/functions.js"></script>
		<!-- DIALOG END -->
		
		
		<!-- STYLISH BUTTON START -->
		<style>
			.myButton {
				-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
				-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
				box-shadow: inset 0px 1px 0px 0px #ffffff;
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff
					), color-stop(1, #f6f6f6) );
				background: -moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',
					endColorstr='#f6f6f6', GradientType=0 );
				background-color: #ffffff;
				-moz-border-radius: 6px;
				-webkit-border-radius: 6px;
				border-radius: 6px;
				border: 1px solid #dcdcdc;
				display: inline-block;
				color: #666666;
				font-family: arial;
				font-size: 15px;
				font-weight: bold;
				padding: 6px 24px;
				text-decoration: none;
				text-shadow: 0px 1px 0px #ffffff;
			}
			
			.myButton:hover {
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6
					), color-stop(1, #ffffff) );
				background: -moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6',
					endColorstr='#ffffff', GradientType=0 );
				background-color: #f6f6f6;
			}
			
			.myButton:active {
				position: relative;
				top: 1px;
			}
		</style>
		<!-- STYLISH BUTTON END -->
		
		<!-- STYLISH TABLE START -->
		<style type="text/css">	
			.customers {
				margin:0px;padding:0px;
				width:100%;
				box-shadow: 10px 10px 5px #888888;
				border:1px solid #11110a;
				
				-moz-border-radius-bottomleft:4px;
				-webkit-border-bottom-left-radius:4px;
				border-bottom-left-radius:4px;
				
				-moz-border-radius-bottomright:4px;
				-webkit-border-bottom-right-radius:4px;
				border-bottom-right-radius:4px;
				
				-moz-border-radius-topright:4px;
				-webkit-border-top-right-radius:4px;
				border-top-right-radius:4px;
				
				-moz-border-radius-topleft:4px;
				-webkit-border-top-left-radius:4px;
				border-top-left-radius:4px;
			}.customers table{
				width:100%;
				height:100%;
				margin:0px;padding:0px;
			}.customers tr:last-child td:last-child {
				-moz-border-radius-bottomright:4px;
				-webkit-border-bottom-right-radius:4px;
				border-bottom-right-radius:4px;
			}
			.customers table tr:first-child td:first-child {
				-moz-border-radius-topleft:4px;
				-webkit-border-top-left-radius:4px;
				border-top-left-radius:4px;
			}
			.customers table tr:first-child td:last-child {
				-moz-border-radius-topright:4px;
				-webkit-border-top-right-radius:4px;
				border-top-right-radius:4px;
			}.customers tr:last-child td:first-child{
				-moz-border-radius-bottomleft:4px;
				-webkit-border-bottom-left-radius:4px;
				border-bottom-left-radius:4px;
			}.customers tr:hover td{
				
			}
			.customers tr:nth-child(odd){ background-color:#cccccc; }
			.customers tr:nth-child(even)    { background-color:#ffffff; }.customers td{
				vertical-align:middle;
				
				
				border:1px solid #11110a;
				border-width:0px 1px 1px 0px;
				text-align:center;
				padding:9px;
				color:#000000;
			}.customers tr:last-child td{
				border-width:0px 1px 0px 0px;
			}.customers tr td:last-child{
				border-width:0px 0px 1px 0px;
			}.customers tr:last-child td:last-child{
				border-width:0px 0px 0px 0px;
			}
			.customers tr:first-child td{
					background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
				background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
			
				background-color:#252544;
				border:0px solid #11110a;
				text-align:center;
				border-width:0px 0px 1px 1px;
				color:#ffffff;
			}
			.customers tr:first-child:hover td{
				background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
				background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
			
				background-color:#252544;
			}
			.customers tr:first-child td:first-child{
				border-width:0px 0px 1px 0px;
			}
			.customers tr:first-child td:last-child{
				border-width:0px 0px 1px 1px;
			}
		</style>
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
		
		<!-- STYLE FOR BMTC BUS ROUTE SCROLLABLE TABLE START -->
		<style type="text/css">		
			
			/* define height and width of scrollable area. Add 16px to width for scrollbar          */
			div.tableContainer {
				clear: both;
				border: 1px solid #963;
				height: 200px;
				overflow: auto;
				/* width: 756px */
			}
			
			/* Reset overflow value to hidden for all non-IE browsers. */
			html>body div.tableContainer {
				overflow: hidden;
				/* width: 756px */
			}
			
			/* define width of table. IE browsers only                 */
			div.tableContainer table {
				float: left;
				/* width: 740px; */
			}
			
			/* define width of table. Add 16px to width for scrollbar.           */
			/* All other non-IE browsers.                                        */
			html>body div.tableContainer table {
				/* width: 756px */
			}
			
			/* set table header to a fixed position. WinIE 6.x only                                       */
			/* In WinIE 6.x, any element with a position property set to relative and is a child of       */
			/* an element that has an overflow property set, the relative value translates into fixed.    */
			/* Ex: parent element DIV with a class of tableContainer has an overflow property set to auto */
			thead.fixedHeader tr {
				position: relative
			}
			
			/* set THEAD element to have block level attributes. All other non-IE browsers            */
			/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
			html>body thead.fixedHeader tr {
				display: block
			}
			
			/* make the TH elements pretty */
			thead.fixedHeader th {
				background: gray;
			/* 	border-left: 1px solid #EB8;
				border-right: 1px solid #B74;
				border-top: 1px solid #EB8;
			 */	font-weight: normal;
				padding: 4px 3px;
				text-align: left
			}
			
			/* make the A elements pretty. makes for nice clickable headers                */
			thead.fixedHeader a, thead.fixedHeader a:link, thead.fixedHeader a:visited {
				color: #FFF;
				display: block;
				text-decoration: none;
				width: 100%
			}
			
			/* make the A elements pretty. makes for nice clickable headers                */
			/* WARNING: swapping the background on hover may cause problems in WinIE 6.x   */
			thead.fixedHeader a:hover {
				color: #FFF;
				display: block;
				text-decoration: underline;
				width: 100%
			}
			
			/* define the table content to be scrollable                                              */
			/* set TBODY element to have block level attributes. All other non-IE browsers            */
			/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
			/* induced side effect is that child TDs no longer accept width: auto                     */
			html>body tbody.scrollContent {
				display: block;
				height: 190px;
				overflow: auto;
				width: 100%
			}
			
			/* make TD elements pretty. Provide alternating classes for striping the table */
			/* http://www.alistapart.com/articles/zebratables/                             */
			tbody.scrollContent td, tbody.scrollContent tr.normalRow td {
				background: #FFF;
				border-bottom: none;
				border-left: none;
				border-right: 1px solid #CCC;
				border-top: 1px solid #DDD;
				padding: 2px 3px 3px 4px
			}
			
			tbody.scrollContent tr.alternateRow td {
				background: #EEE;
				border-bottom: none;
				border-left: none;
				border-right: 1px solid #CCC;
				border-top: 1px solid #DDD;
				padding: 2px 3px 3px 4px
			}
			
			/* define width of TH elements: 1st, 2nd, and 3rd respectively.          */
			/* Add 16px to last TH for scrollbar padding. All other non-IE browsers. */
			/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
			html>body thead.fixedHeader th {
				width: 200px
			}
			
			html>body thead.fixedHeader th + th {
				width: 240px
			}
			
			html>body thead.fixedHeader th + th + th {
				width: 316px
			}
			
			/* define width of TD elements: 1st, 2nd, and 3rd respectively.          */
			/* All other non-IE browsers.                                            */
			/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
			html>body tbody.scrollContent td {
				width: 200px
			}
			
			html>body tbody.scrollContent td + td {
				width: 240px
			}
			
			html>body tbody.scrollContent td + td + td {
				width: 300px
			}		
		</style>
		<!-- STYLE FOR BMTC BUS ROUTE SCROLLABLE TABLE END -->
		
		<!-- BUS FARE DIALOG START -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script type="text/javascript">
		$(function(){			
			$("#dialog").dialog({ autoOpen: false });
			$("#busFare").click(function(){
				 $("#dialog").dialog('open');
	                return false;
			});		    
		});
		</script>
		<!-- BUS FARE DIALOG END -->

		
	</head>
	<body id="subpage">
	
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
		
		<%@ include file="../../resources/includes/busFareDialog.jsp" %>
		<div id="templatemo_wrapper">
		    <%@ include file="../../resources/includes/header.jsp" %>
		    <%@ include file="../../resources/includes/userMenu.jsp" %>
	        
		    <div class="cleaner h20"></div>
		    <div id="templatemo_main_top"></div>
		    <div id="templatemo_main">
        
	        	<div id="content" style="width: 96%;">
	        		<!-- <h2>Cab Booking</h2> -->
	
		        	<!-- SEARCH BOX START -->
		        <!--  	<form action="searchMatchingRoutes" method="get">
						<table border="0" align="center">
							<tr>
						  		<td>
						  			<h5>Search Places:</h5>
						  		</td>
						    	<td>
						    		<input type="text" name="searchTextFieldFrom" id="homeToOfficeFrom1" />
							    	<script type="text/javascript">
								    	$(document).ready(function() {
						            			$("#homeToOfficeFrom1").tokenInput("searchPlaces",{
						            	    	tokenLimit: 1			
											});
							        	});
						        	</script>
						    	</td>
						    	<td>
									<input type="image" name="submit" src="../resources/images/images/search/search12.png" height="32px" width="30px"/>  	
						    	</td>
						  	</tr>
						</table>
					</form> -->
					<!-- SEARCH BOX END -->
            
					<!-- SEARCH RESULT START -->
					<%-- <input type="hidden" name="hiddenElem" id="hiddenElem" />
					<div id="searchResults" style="padding-top: 50px;">
						<c:set var="headerFlag" value="1" scope="page" />
						<% int flag=0; %>
						
						<c:if test="${searchFlag eq true}">
							<div id="buttons1" style="border: 1px; border-width: 1px; border-color: #252544; border-style: solid; ">
				 		 		<c:choose>
									<c:when test="${listOfRouteDetailsHelper ne null && fn:length(listOfRouteDetailsHelper) gt 0}">				
								 		<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCount" >
								 			<c:forEach var="routePlaceMapping" items="${routeDetailsHelper.listOfRoutePlaceMappingUpdated}" varStatus="theCount1" >
								 				<c:if test="${routePlaceMapping.place.placeId eq searchPlaceId}">
													<table align="center" width="90%" >
														<c:if test="${headerFlag eq 1}">
													  		<tr>
													  			<td colspan="3" align="right" >
													  				<input type="image" value="close" onclick="closeDiv()" src="../resources/images/images/general/close_hover.png"/>
													  			</td>
													  		</tr>
														  	<tr style="background-color: gray; color: white;">
														    	<th width="50px;">Route Name</th>
														    	<th>Place passes by</th>
														    	<th width="50px;">Action</th>
															</tr>
															<c:set var="headerFlag" value="2"/>
														</c:if>	
														<tr style="height: 40px;">
															<td width="100px;">
																<p><em>${routeDetailsHelper.route.routeName}</em></p>											
															</td>
															<td>
																<c:forEach var="routePlaceMappingCSV" items="${routeDetailsHelper.listOfRoutePlaceMappingUpdated}" >
																	<em>
																		<c:choose>
																			<c:when test="${routePlaceMappingCSV.place.placeId eq searchPlaceId}">
																				<% if(flag==1){ %>
																					-->
																				<% } %>
																				&nbsp;<b style="font-weight: bold;">${routePlaceMappingCSV.place.placeName}</b> 
																				<% flag=1; %>
																			</c:when>
																			<c:otherwise>
																				<% if(flag==1){ %>
																					-->
																				<% } %>
																				&nbsp; ${routePlaceMappingCSV.place.placeName}
																				<% flag=1; %>
																			</c:otherwise>
																		</c:choose> 
																	</em>
																</c:forEach>	
															</td>
															<td style="width: 200px;"> 
																<a style="text-decoration: none; float: left; margin-right: 5px;" href="#" class="myButton" id="btn_${routeDetailsHelper.route.routeId}">Details</a>
																<a style="text-decoration: none; float: left;" href="getInPlaceSelection?route=${ routeDetailsHelper.route.routeName }" class="myButton">Book</a>
															</td>
														</tr>
													</table>
												</c:if>
												<% flag=0; %>
											</c:forEach> 					
										</c:forEach>
									</c:when>
									<c:otherwise>
										No Results Found...
									</c:otherwise>
								</c:choose>
							</div>
						</c:if>	 	
					</div> --%>
					<!-- SEARCH RESULT END -->
							
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
											<td style="width: 220px;">
												
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
        		</div> <!-- END of content -->
        		
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->

    		<%@ include file="../../resources/includes/footer.jsp" %>
		</div>
	</body>
</html>