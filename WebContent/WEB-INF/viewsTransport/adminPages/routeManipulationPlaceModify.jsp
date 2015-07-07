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
			
		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
			
		<!-- STYLING TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLING TABLE END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
			
		<!-- <style type="text/css">
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
			}
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
 		-->		

				
		<!-- FOR DROPDOWN START -->
  		<!-- <style type="text/css"> 
		    ol li {list-style: decimal outside;}
		    
		    ol li { margin-left: 1.25em; }
		    
		    div.side-by-side { width: 100%; margin-bottom: 1em; }
		    div.side-by-side > div { float: left; width: 50%; }
		    div.side-by-side > div > em { margin-bottom: 10px; display: block; }
		    
		    .clearfix:after {
		      content: "\0020";
		      display: block;
		      height: 0;
		      clear: both;
		      overflow: hidden;
		      visibility: hidden;
		    }
  		</style>
  		<link rel="stylesheet" href="../../../resources/dropdown-charts/chosen.css" /> -->  
  		<!-- FOR DROPDOWN END -->		
  		
		<!-- FOR MULTI PLACE SELECTION START -->
    	<script type="text/javascript" src="../../../resources/carpool/multiPlaceSelection/js/jquery/jquery.sheepItPlugin.js"></script>
    	<script type="text/javascript">
		//<![CDATA[
    		$(document).ready(function() {     
    			var sheepItForm = $('#sheepItForm').sheepIt({
			        separator: '',
			        allowRemoveLast: true,
			        allowRemoveCurrent: true,
			        allowRemoveAll: true,
			        allowAdd: true,
			        allowAddN: false,
			        maxFormsCount: 10,
			        minFormsCount: 0,
			        iniFormsCount: 0,
			        continuousIndex: true,
			        data: [
			               <c:if test="${routePlaceData.listOfRoutePlaceMappingUpdated ne null}"> 
			               <c:forEach var="place" items="${routePlaceData.listOfRoutePlaceMappingUpdated}" varStatus="inner">
				               {
				                   'sheepItForm_#index#_phone': '${ place.place.placeName }',
				                   'sheepItForm_#index#_description0': '<fmt:formatDate value ="${ place.arrivalTime }" pattern="hh"/>',
				                   'sheepItForm_#index#_description1': '<fmt:formatDate value ="${ place.arrivalTime }" pattern="mm"/>'
				               },
						   </c:forEach>
						   </c:if>
			           ]
    			});
    		});
    	//]]>
    	</script>
    	
    	<style type="text/css">
		/*<![CDATA[*/
		    a {
		    	text-decoration:underline;
		    	color:#00F;
		    	cursor:pointer;
		    }
		    #sheepItForm_controls div, #sheepItForm_controls div input {
		    	float:left;    
		    	margin-right: 10px;
		    }
	    /*]]>*/
    	</style>
    
	    <!-- FOR MULTI PLACE SELECTION END -->
	    <style type="text/css">
	 		.bordered {
				border: solid #ccc 1px;
				border-radius: 6px;
			}
			.bordered table{
				border: solid #ccc 1px;
				border-radius: 6px;	
			}    	
			.bordered td {
				/* border-left: 1px solid #ccc; */
				border-top: 1px solid #ccc;
				padding: 5px;
				text-align: left;
			} 
			.bordered th{
				border-left: 0px solid #ccc;
				border-top: 1px solid #ccc;
				padding: 5px;
				text-align: left;
				background-color: gray;
				color: white;
			}	
	 	</style>
 				
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
        			<!-- <h2>Transport Team</h2> -->
					
					<!-- This will be called when person click on modify link for some ROUTE-PLACE-DRIVER-VEHICLE MAPPING -->
					<% if(request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyRoutePlaceDetails")){ %>
						<c:choose>
							<c:when test="${ routePlaceData ne null }">	
								<form action="modifyRoutePlaceData" method="post">
									<input type="hidden" name="routeId" value="${ routePlaceData.route.routeId }" />
									<table border="0" align="center" width="55%">
										<tr height="70px">
		    								<td style="font-weight: bold;">Select Route Name :</td>
		    								<td><input type="text" name="routeName" value="${ routePlaceData.route.routeName }" /></td>
		  								</tr>
		  								<tr height="50px">
		    								<td colspan="2" style="font-weight: bold;">Select Place where Bus has stops :</td>
		  								</tr>	
		  								<tr>
		    								<td colspan="2">
		    									<div>
		      										<table border="0" id="bordered" class="bordered">
			        									<thead>
			         	 									<tr>	
													            <td>&nbsp;</td>
													            <td width="347">Place Name</td>
													            <td width="31">Hour</td>
													            <td width="31">Minute</td>
													            <td>&nbsp;</td>
		          											</tr>
		        										</thead>
	        											<tbody id="sheepItForm">
	          												<tr id="sheepItForm_template">
		            											<td>
		              												<span id="sheepItForm_label"></span>
		            											</td>
	            												<td>
		                 											<select id="sheepItForm_#index#_phone" name="place" type="select">
																		<c:choose>
																			<c:when test="${listOfAllPlaces ne null}">
																				<c:forEach var="place" items="${listOfAllPlaces}">
									  												<option value="${ place.placeId }">${ place.placeName }</option>
																				</c:forEach>
																			</c:when>		
																			<c:otherwise>
																			</c:otherwise>							
																		</c:choose>
		               												</select>
	            												</td>
																<td>
												               		<select name="time_hour" id="sheepItForm_#index#_description0"  type="select1">
													               		<option value="01">01</option>
													               		<option value="02">02</option>
													               		<option value="03">03</option>
													               		<option value="04">04</option>
													               		<option value="05">05</option>
													               		<option value="06">06</option>
													               		<option value="07">07</option>
													               		<option value="08">08</option>
													               		<option value="09">09</option>
													               		<option value="10">10</option>
												               		</select>
													            </td>
													        	<td>
													               	<select name="time_minute" id="sheepItForm_#index#_description1" type="select2">
													               		<option value="01">01</option>
													               		<option value="02">02</option>
													               		<option value="03">03</option>
													               		<option value="04">04</option>
													               		<option value="05">05</option>
													               		<option value="06">06</option>
													               		<option value="07">07</option>
													               		<option value="08">08</option>
													               		<option value="09">09</option>
													               		<option value="10">10</option>
													               	</select>
													            </td> 						
										 						<td>																												
													              	<a id="sheepItForm_remove_current" name="sheepItForm_remove_current"><img class="delete" src="../../../resources/carpool/multiPlaceSelection/images/cross.png" width="16" height="16" border="0" /></a>
													            </td>
		          											</tr>
		          											<tr id="sheepItForm_noforms_template">
		            											<td colspan="4" align="center">
		              												No records
		            											</td>
		          											</tr>
		        										</tbody>
			      									</table>
		      										<div id="sheepItForm_controls">
												        <div id="sheepItForm_add">
												         	<a><span>Add</span></a>
												        </div>
												        <div id="sheepItForm_remove_last">
												          	<a><span>Remove</span></a>
												        </div>
												        <div id="sheepItForm_remove_all">
												          	<a><span>Remove all</span></a>
												        </div>			        			        
													</div>
												</div>
			    							</td>
			  							</tr>
				  						<tr>
								    		<td style="font-weight: bold; padding-top: 30px;">Select Driver for Route :</td>
								    		<td style="padding-top: 30px;">
										        <select size="1" name="driverId" style="width: 180px;"> 
													<c:if test="${ listDriverUpdated ne null }">	
												 		<c:forEach var="driver" items="${listDriverUpdated}">
												 		 	<option value="${ driver.driverId }"  ${ driver.driverName eq routePlaceData.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverName ? 'selected' : ''} >${ driver.driverName }</option>
												 		</c:forEach> 
												  	</c:if>
										 		</select>
								    		</td>
									  	</tr>
				  						<tr>
								    		<td style="font-weight: bold;">Select Vehicle for Route :${routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleNumber}</td>
								    		<td>
										        <select size="1" name="vehicleId" style="width: 180px;"> 
													<c:if test="${ listVehicleUpdated ne null }">	
												 		<c:forEach var="vehicle" items="${listVehicleUpdated}">
												 		 	<option value="${ vehicle.vehicleId }" ${ vehicle.vehicleNumber eq routePlaceData.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleNumber ? 'selected' : ''} >${ vehicle.vehicleNumber } (${ vehicle.vehicleCapacity } Seater)</option>
												 		</c:forEach> 
												  	</c:if>
										 		</select>
								    		</td>
								  		</tr>			  						
		  								<tr>
		    								<td style="font-weight: bold;">Select Route Type:</td>
		    								<td>
				        						<select size="1" name="routeType" style="width: 180px;"> 
													<option value="regular" <c:if test="${ routePlaceData.route.regularCab eq true}">selected="selected"</c:if>>Regular</option>
													<option value="night" <c:if test="${ routePlaceData.route.regularCab eq false}">selected="selected"</c:if>>Night</option>
						 						</select>
		    								</td>
		  								</tr>		  								
		  								<tr>
		    								<td colspan="2" height="60px"  style="padding-top: 20px;">
		    									<input type="submit" name="submit" value="Submit" class="myButton">
		    								</td>
		  								</tr>
									</table>
								</form>
							</c:when>
							<c:otherwise>
								No Vehicle found.
							</c:otherwise>
						</c:choose>
					<% } %>

					<!-- DELETE DRIVER -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("deleteVehicle")){ %>
						<table>
			 				<tr>
			    				<td>Select Driver Name to delete :</td>
							    <td><input type="text" name="driverName"></td>
							</tr>
						</table>
					<% } %>
	        	</div>
	        	<div class="cleaner"></div>
	    	</div>    
			<%@ include file="../../../includes/transport/footer.jsp" %>   
		</div>
	
		<!-- DROPDOWN START -->
	  	<!-- <script src="../../../resources/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
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