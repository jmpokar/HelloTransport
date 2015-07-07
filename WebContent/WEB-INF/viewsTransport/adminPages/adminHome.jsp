<%@page import="com.corporate.transportdb.dto.updated.UserRouteMappingUpdated"%>
<%@page import="com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.corporate.transportdb.dto.updated.UserRequestNew"%>
<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
		
		<!-- JS FOR OPENING POPUP ON CLICK OF DETAILS BUTTON IN TABLE START -->
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
		<!-- JS FOR OPENING POPUP ON CLICK OF DETAILS BUTTON IN TABLE END -->
		
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
	  	<link rel="stylesheet" href="../../../resources/dropdown-charts/chosen.css" />  
 		-->	  		
 		<!-- FOR DROPDOWN END -->

		  				
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
				var status = "<%=request.getParameter("status")%>";
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
		        	<h2>Admin Home</h2>
		        	
		    		<%--    	
		         	<h4 style="font-size: 14px; padding-bottom: 10px; border-bottom: 1px solid #ccc; margin: 5px; padding-top: 20px;">
		        		<center><a href="#" id="searchPanelLink">Search Panel View/Hide</a></center>
		        	</h4>
		 			--%>
		         	
		         	<!-- NOT IN USE NOW -->
		        	<div id="searchDiv" style="display: none;">
		        		<form action="">
		        			<table>
							  <tr>
							    <td>Enter Email id:</td>
							    <td><input type="text" name="emailId" id="emailId" /></td>
							  </tr>
							  <tr>
							    <td>Select Status:</td>
							    <td>
							    	<select name="adminStatus" data-placeholder="Status" style="width: 180px;" class="chzn-select" >
										<option value="1">Pending</option>
					    				<option value="2">Closed</option>
									</select>
							    </td>
							  </tr>
							</table>
		        		</form>
		        	</div>
		        	
			    	<%@ include file="../../../includes/transport/admin/adminHomeRequestTable.jsp" %>			
	        	</div>
	        	<div class="cleaner"></div>
	    	</div>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>