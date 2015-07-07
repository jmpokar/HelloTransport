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
				        width: 600, 
				        height: 600,
					    buttons: {
							"Close": function() {
							    $(this).dialog("close");
							},
							"Submit": function() {
				                window.temp = false;
							   $('#signinform'+nr).submit();
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
		
		<!--
		<style type="text/css">
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
		
		<!-- FOR DROPDOWN START -->
		<!--
		<style type="text/css"> 
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
				
 	    	<%@ include file="../../../includes/common/header.jsp" %>
	    	<%@ include file="../../../includes/transport/adminMenu.jsp" %>
	        
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
		    	
    		<div id="templatemo_main">
        		<div id="content" style="width: 96%;">
        			<h2>Vehicle Add/Modify</h2>
      
					<!-- ADD VEHICLE STARTED -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("addVehicle") || request.getAttribute("request")!=null && request.getAttribute("request").equals("addVehicle")){ %>
							
						<form action="addVehicle" method="post">
							<table border="0" align="center">				
							  	<tr height="40px">
							    	<td style="font-weight: bold;">Enter Vehicle Number :</td>
							    	<td><input type="text" name="vehicleNumber"></td>
							  	</tr>
						  		<tr height="40px">
						    		<td style="font-weight: bold;">Enter Vehicle Capacity :</td>
							    	<td>
								    	<select name="vehicleCapacity">
								    		<option value="10">10</option>
								    		<option value="15">15</option>
								    		<option value="20">20</option>
								    		<option value="25">25</option>
								    		<option value="30">30</option>
								    		<option value="35">35</option>
								    		<option value="40">40</option>
								    		<option value="45">45</option>
								    		<option value="50">50</option>
								    		<option value="55">55</option>
								    		<option value="60">60</option>
								    	</select>
						    		</td>
						  		</tr>
							  	<tr height="70px">
							    	<td colspan="2">
							    		<input type="submit" name="submit" class="myButton">
							    	</td>
							  	</tr>
							</table>    
						</form>
						
					<% } %>
					<!-- ADD VEHICLE ENDED -->
		
					<!-- MODIFY VEHICLE STARTED -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("modifyVehicle") || 
						request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyVehicle")){ %>

						<table border="0" align="center" width="60%" id="bordered" class="bordered">
		  					<thead>
		  						<tr>
							  		<td width="150px"><b>Vehicle Number</b></td>
							  		<td width="100px"><b>Capacity</b></td>
							  		<td width="230px"><b>Action</b></td>
							  	</tr>		  	
							</thead>
		  					<c:choose>
			  					<c:when test="${ listOfVehicleUpdated ne null }">
				  					<c:forEach var="vehicle" items="${listOfVehicleUpdated}">
					  					<tr>
					    					<td>${ vehicle.vehicleNumber }</td>
					    					<td>${ vehicle.vehicleCapacity } Seater</td>
					    					<td>
					    						<a href="vehicleManipulation?request=modifyVehicleDetails&vehicleId=${ vehicle.vehicleId }" class="myButton">Modify</a> &nbsp;
					    						<a href="deleteVehicle?request=delete&vehicleId=${ vehicle.vehicleId }" class="myButton">Delete</a>
					    					</td>
					  					</tr>
				   					</c:forEach>
								</c:when>
								<c:otherwise>
									No Vehicle Found
								</c:otherwise>
							</c:choose>
						</table>
					<% } %>

					<!-- This will be called when person click on modify link for some Vehicle -->
					<% if(request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyVehicleDetails")){ %>
						<c:choose>
							<c:when test="${ vehicleUpdated ne null }">	
										
								<form action="modifyVehicle" method="post">
									<input type="hidden" name="vehicleId" value=${ vehicleUpdated.vehicleId }>
				
									<table border="0" width="50%" align="center">
										<tr height="40px">
										    <td style="font-weight: bold;" width="180px">Enter Vehicle Number :</td>
										    <td><input type="text" name="vehicleNumber" value="${ vehicleUpdated.vehicleNumber }"></td>
										  </tr>
										  <tr height="50px">
										    <td style="font-weight: bold;">Enter Vehicle Capacity :</td>
										    <td>
										    	<select name="vehicleCapacity">
										    		<option value="10" <c:if test="${ vehicleUpdated.vehicleCapacity eq '10'}"> selected="selected" </c:if>>10</option>
										    		<option value="15" <c:if test="${ vehicleUpdated.vehicleCapacity eq '15'}"> selected="selected" </c:if>>15</option>
										    		<option value="20" <c:if test="${ vehicleUpdated.vehicleCapacity eq '20'}"> selected="selected" </c:if>>20</option>
										    		<option value="25" <c:if test="${ vehicleUpdated.vehicleCapacity eq '25'}"> selected="selected" </c:if>>25</option>
										    		<option value="30" <c:if test="${ vehicleUpdated.vehicleCapacity eq '30'}"> selected="selected" </c:if>>30</option>
										    		<option value="35" <c:if test="${ vehicleUpdated.vehicleCapacity eq '35'}"> selected="selected" </c:if>>35</option>
										    		<option value="40" <c:if test="${ vehicleUpdated.vehicleCapacity eq '40'}"> selected="selected" </c:if>>40</option>
										    		<option value="45" <c:if test="${ vehicleUpdated.vehicleCapacity eq '45'}"> selected="selected" </c:if>>45</option>
										    		<option value="50" <c:if test="${ vehicleUpdated.vehicleCapacity eq '50'}"> selected="selected" </c:if>>50</option>
										    		<option value="55" <c:if test="${ vehicleUpdated.vehicleCapacity eq '55'}"> selected="selected" </c:if>>55</option>
										    		<option value="60" <c:if test="${ vehicleUpdated.vehicleCapacity eq '60'}"> selected="selected" </c:if>>60</option>
										    	</select>
											</td>
										</tr>
										<tr height="30px">
											<td colspan="2">
												<input type="submit" name="submit" class="myButton">
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

					<!-- DELETE VEHICLE STARTED -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("deleteVehicle")){ %>
						<table>
						 	<tr>
						    	<td>Select Vehicle Number to delete :</td>
						    	<td><input type="text" name="vehicleNumber"></td>
						  	</tr>
						</table>
					<% } %>
					<!-- DELETE VEHICLE ENDED -->
				
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