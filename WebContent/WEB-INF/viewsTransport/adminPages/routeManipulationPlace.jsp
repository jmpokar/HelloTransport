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
  		<link rel="stylesheet" href="../../../resources/dropdown-charts/chosen.css" />  
 		-->
   		<!-- FOR DROPDOWN END -->		
  		  		
	 	<!-- DIALOG START -->
	 	<%@ include file="../../../includes/transport/dialogBox.jsp" %>
		<!-- DIALOG END -->
		
				
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
			        continuousIndex: true
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
	        	<div id="content" style="width: 100%;">
        			<h2>Add Complete Route</h2>
					<div style="padding-bottom: 30px;"></div>
						
					<!-- ADD ROUTE-PLACE-DRIVER-VEHICLE MAPPING STARTED -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("addRoutePlace") || 
							request.getAttribute("request")!=null && request.getAttribute("request").equals("addRoutePlace")){ %>
						<%@ include file="../../../includes/carpool/addRoute.jsp" %>
					<% } %>
					<!-- ADD ROUTE-PLACE-DRIVER-VEHICLE MAPPING STARTED -->
						
					<!-- MODIFY/DELETE ROUTE-PLACE-DRIVER-VEHICLE MAPPING STARTED -->
					<%@ include file="../../../includes/carpool/modifyRoute.jsp" %>
					<!-- MODIFY/DELETE ROUTE-PLACE-DRIVER-VEHICLE MAPPING ENDED -->
							
					</div>
        		<div class="cleaner"></div>
    		</div>
    		<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>