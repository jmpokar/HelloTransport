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


		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
		    <!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>  -->
 		    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" />
 		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->


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


  		<!-- DIALOG START -->			
			 
			<script type="text/javascript" src="../resources/dialogBox/highlight.js"></script>
			
			<link rel="stylesheet" href="../resources/dialogBox/zebra_dialog.css" type="text/css" />
			<script type="text/javascript" src="../resources/dialogBox/zebra_dialog.js"></script>
			<script type="text/javascript" src="../resources/dialogBox/functions.js"></script>
		<!-- DIALOG END -->
		
		
		<!-- BUTTON CSS START -->
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
		<!-- BUTTON CSS END -->
		
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
		<!-- STYLISH TABLE START -->
		
		<!-- DIALOG AFTER CLICKING DETAILS BUTTON START -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
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
				        width: $(window).width()-400, 
				        height: $(window).height()-200,
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
				        width: $(window).width()-400, 
				        height: $(window).height()-300 
			        });
			    });
			});
		</script>		
		<!-- DIALOG AFTER CLICKING DETAILS BUTTON START -->
		
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
	
		<%@ include file="../../resources/includes/busFareDialog.jsp" %>
		<div id="templatemo_wrapper">	
		    <%@ include file="../../resources/includes/header.jsp" %> 
		    <%@ include file="../../resources/includes/userMenu.jsp" %>
   			<div style="margin: 20px;"></div>    
		    <div id="templatemo_main_top"></div>
    		<div id="templatemo_main">
    	                
        		<div id="content" style="width: 96%;">
        			<h2>Inbox</h2>
			       	<span>	
						<!-- <label style="float: left; font-size: 25px;">Transport Team Members</label> --> 
						<!-- <h4 style="font-size: 14px; padding-bottom: 10px; border-bottom: 1px solid #ccc; margin: 20px;">Details</h4> -->
						<!-- <a style="text-decoration: none; float: right;" href="printAllPassengerList" class="myButton">Print All Passenger List</a> -->
					</span>

					<c:choose>
						<c:when test="${listOfUserRequestNew ne null && fn:length(listOfUserRequestNew) gt 0}">								
							<div id="buttons" style="padding-top: 50px;">
								<table  border="1" width="100%" class="customers">
									<tr>
										<td>No</td>
										<td>Subject</td>
										<td>Date</td>
										<td>Status</td>
										<td>Action</td>								
									</tr>
									<%	
										List<UserRequestNew> listOfUserRequestNew = (List<UserRequestNew>)request.getAttribute("listOfUserRequestNew");
										if(listOfUserRequestNew!=null && listOfUserRequestNew.size()>0){
											for(int i=0; i<listOfUserRequestNew.size();i++){ 
												UserRequestNew userRequestNew = listOfUserRequestNew.get(i);
												JSONObject json = new JSONObject(userRequestNew.getAction());
												String action = json.getString("action");
												String message=null;
												if(action.equals("newPass")){
													message="New Bus Pass Request";
												}
									%>				
									<tr>
										<td><p><em>	<%=(i+1) %></em></p></td>
										<td><p><em><%=message %></em></p></td>
										<td><p><em><%=userRequestNew.getRequestDate() %></em></p></td>
										<td>
											<p><em>
												<%
													if(userRequestNew.getRequestStatus()==1){
														out.write("Pending");
													}else
													if(userRequestNew.getRequestStatus()==2){
														out.write("Closed");
													}else
													if(userRequestNew.getRequestStatus()==3){
														out.write("Hold");
													}else
													if(userRequestNew.getRequestStatus()==4){
														out.write("Please Collect Bus Pass.");
													}else
													if(userRequestNew.getRequestStatus()==5){
														out.write("Bus Pass Collected");
													}
												%>    
											</em></p>
										</td>
										<td style="width: 200px;">
											<a style="text-decoration: none; float: left; margin-right: 5px;" href="#" class="myButton" 
												id="btn_<%=userRequestNew.getRequestId()%>">Details</a>
										</td>
									</tr>
									<% } } %>
								</table>	
							</div>
						
							<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG START -->
							<%	
								if(listOfUserRequestNew!=null && listOfUserRequestNew.size()>0){
									for(int i=0; i<listOfUserRequestNew.size();i++){ 
										UserRequestNew userRequestNew = listOfUserRequestNew.get(i);
										JSONObject json = new JSONObject(userRequestNew.getAction());
										String action = json.getString("action");
										String message=null;
										if(action.equals("newPass")){
											message="New Bus Pass Request";
										}
							%>
							<div id="dialog_<%=userRequestNew.getRequestId()%>" class="dialogbox" style="display:none;">
								<br></br>
								<b>Request Details</b>
								<br></br>
								<table width="80%" border="0" align="center">
									<tr>
										<td width="150px;" height="30px;">
											Request Subject :
										</td>
										<td>
											<%=message %>
										</td>
									</tr>
									<tr>
										<td height="30px;">
											Request Date :
										</td>
										<td>
											<%=userRequestNew.getRequestDate() %>
										</td>
									</tr>
									<tr>
										<td height="30px;">
											Status :
										</td>
										<td>
											<%	
												if(userRequestNew.getRequestStatus()==1){
													out.write("Pending");
												}else
												if(userRequestNew.getRequestStatus()==2){
													out.write("Closed");
												}else
												if(userRequestNew.getRequestStatus()==3){
													out.write("Hold");
												}else
												if(userRequestNew.getRequestStatus()==4){
													out.write("Please Collect Bus Pass.");
												}else
												if(userRequestNew.getRequestStatus()==5){
													out.write("Bus Pass Collected");
												}
											%>    
										</td>
									</tr>
									<tr height="30px;">
										<td valign="top">
											Admin Comment :
										</td>
										<td>
											<%
												if(userRequestNew.getAdminComment() != null){ 
													out.write(userRequestNew.getAdminComment());
												}else{
													out.write("No Comment Yet");
												}
											%>
										</td>
									</tr>
								</table>							
							</div>
							<% }} %>
							<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG END -->
						</c:when>
						<c:otherwise>
							No records found.
						</c:otherwise>
					</c:choose>
		
        		</div> <!-- END of content -->
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->
    
			<%@ include file="../../resources/includes/footer.jsp" %>
   
		</div>
	</body>
</html>