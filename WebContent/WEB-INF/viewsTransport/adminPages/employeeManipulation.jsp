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
  		
  		<script type="text/javascript">
			$(function(){
				$("#requestAndEmailId").change(function() {
					var selected =  $(this).attr('value');
				    var contact = <%=request.getAttribute("listOfUserRequestNewJson") %>;
				   	for (key in contact) {
				     	console.log(key+':'+JSON.stringify(contact[key]));
				   }
				   	update(selected);
				});	
		
				$("#routeId").change(function(){
					var selected =  $(this).attr('value');
				    var contact = <%=request.getAttribute("listOfRoutePlaceMappingUpdatedJson") %>;
				    $("#placeId").find('option').remove();
				    
				   	for (key in contact) {
				   		if(contact[key].route.routeId == selected){
				   			$("#placeId").append('<option value='+contact[key].place.placeId+'>'+contact[key].place.placeName+'</option>');
				   		}
				   	}
				});		
			});
	
			function inita(){
				var selected =  $("#routeId").attr('value');				
			    var contact = <%=request.getAttribute("listOfRoutePlaceMappingUpdatedJson") %>;
			    $("#placeId").find('option').remove();
			   	for (key in contact) {
			   		if(contact[key].route.routeId == selected){
			   			$("#placeId").append('<option value='+contact[key].place.placeId+'>'+contact[key].place.placeName+'</option>');
			   		}
			   	}			   
			   	var listOfUserRequestNewJson = <%=request.getAttribute("listOfUserRequestNewJson") %>;
			   	var placeName1 = JSON.parse(listOfUserRequestNewJson[0].action);
			   	$("#requestedPlace").text("Requested Place is :"+placeName1.placeName);
				
			 	var routeName1 = JSON.parse(listOfUserRequestNewJson[0].action);
			   	$("#requestedRoute").text("Requested route is :"+routeName1.routeName);				
			}
		
			function update(requestAndEmailId){
		   		var stringArray = requestAndEmailId.split(',');
				var listOfUserRequestNewJson = <%=request.getAttribute("listOfUserRequestNewJson") %>;
			   	for (key in listOfUserRequestNewJson) {
			   		
			   		if(listOfUserRequestNewJson[key].requestId == stringArray[0]){
			   		   var placeName1 = JSON.parse(listOfUserRequestNewJson[key].action);
			   		   $("#requestedPlace").text("Requested Place is :"+placeName1.placeName);
			   			
			   		   var routeName1 = JSON.parse(listOfUserRequestNewJson[key].action);
			   		   $("#requestedRoute").text("Requested route is :"+routeName1.routeName);
			   		}
			   	}
			}
		
			$(function(){
				<%	
				String requestFor = (String)request.getAttribute("request");
				if(requestFor!=null && requestFor.equals("selectEmployee")){%>
					inita();
				<%}%>
			});
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
        			<h2>Employee-Route Manipulation</h2>
						
					<!-- ADD EMPLOYEE-ROUTE MAPPING START -->
					<c:if test="${ request ne null and request eq 'selectEmployee'}">
						<form action="addEmployeeEntryAsPassHolder">		
							<c:choose>
								<c:when test="${ listOfUserRequestNew ne null and fn:length(listOfUserRequestNew) > 0}">
									<br></br>
									<table border="0" width="65%" align="center">
										<tr height="50px">
									    	<td style="font-weight: bold; width: 120px;" valign="top">Select Email Id :</td>
									    	<td width="220px;" valign="top">
									    		<select size="1" name="requestAndEmailId" id="requestAndEmailId" style="width: 200px;"> 
													<c:forEach var="userRequestNew" items="${listOfUserRequestNew}">
												 		<option value="${userRequestNew.requestId},${userRequestNew.emailId}">${userRequestNew.emailId}</option>
													</c:forEach>
												</select>
									    	</td>
										   	<td width="300px;" valign="top"></td>
										 </tr>
										 <tr height="50px">
									   		<td style="font-weight: bold;" valign="top">Enter Route:</td>
									    	<td valign="top">
										    	<select size="1" name="routeId" id="routeId" style="width: 200px;"> 
													<c:forEach var="route" items="${listOfAllRoute}">
													 	<option value="${route.routeId}">${route.routeName}</option>
													</c:forEach>
												</select>
										    </td>
											<td style="font-weight: bold;" id="requestedRoute" valign="top"></td>
										</tr>
										<tr height="50px">
										    <td style="font-weight: bold;" valign="top">Select Place:</td>
										    <td valign="top">
										    		<select size="1" name="placeId" id="placeId" style="width: 200px;"></select>							 
									    	</td>
									    	<td style="font-weight: bold;" id="requestedPlace" valign="top"></td>
										</tr>
										<tr height="70px">
									    	<td colspan="3">
										   		<input type="submit" name="submit" value="submit" class="myButton">
										   	</td>
										</tr>
									</table>  
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
						</form>
					</c:if>
					<!-- ADD EMPLOYEE-ROUTE MAPPING END -->	
		
					<!-- REMOVE EMPLOYEE-ROUTE MAPPING START -->
					<c:if test="${ request ne null and request eq 'removeEmployee'}">
						<form action="removeEmployeeEntryAsPassHolder">		
							<c:choose>
								<c:when test="${ listOfUserUpdated ne null and fn:length(listOfUserUpdated) > 0}">
									<br></br>
									<table border="0" width="65%" align="center">
										<tr height="50px">
										    <td style="font-weight: bold; width: 250px;" valign="top">Select Email Id/User Name :</td>
										    <td width="220px;" valign="top">
										    	<select size="1" name="userId" style="width: 200px;" class="chzn-select"> 
													<c:forEach var="userUpdated" items="${listOfUserUpdated}">
														<c:choose>
															<c:when test="${userUpdated.emailId ne null}">
														 		<option value="${userUpdated.userId}">${userUpdated.emailId}</option>
														 	</c:when>
													 		<c:otherwise>
													 			<option value="${userUpdated.userId}">${userUpdated.userName}</option>
													 		</c:otherwise>
										 				</c:choose>	
													</c:forEach>
												</select>
							    			</td>
									    	<td width="300px;" valign="top"></td>
									 	</tr>
										<tr height="70px">
									   		<td colspan="3">
									   			<input type="submit" name="submit" value="submit" class="myButton">
									   		</td>
										</tr>
									</table>  
								</c:when>
								<c:otherwise>
									No User Found
								</c:otherwise>
							</c:choose>
						</form>
					</c:if> 
					<!-- REMOVE EMPLOYEE-ROUTE MAPPING END -->
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