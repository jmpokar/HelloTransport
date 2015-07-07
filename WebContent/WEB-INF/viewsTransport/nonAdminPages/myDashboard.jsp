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
		
		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
		
		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
		
		<!-- DIALOG START -->
	 	<%@ include file="../../../includes/transport/dialogBox.jsp" %>
		<!-- DIALOG END -->
		
		<!-- STYLE FOR BMTC BUS ROUTE SCROLLABLE TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLE FOR BMTC BUS ROUTE SCROLLABLE TABLE END -->
		
		<!-- DIALOG AFTER CLICKING DETAILS BUTTON START -->
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
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
		
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
    
	    	<%@ include file="../../../includes/transport/busFareDialogBody.jsp" %>
		    <%@ include file="../../../includes/common/header.jsp" %>
		    <%@ include file="../../../includes/transport/userMenu.jsp" %>
	        
		    <div class="cleaner h20"></div>
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
		
        		</div>
        		<div class="cleaner"></div>
    		</div>
    
			<%@ include file="../../../includes/transport/footer.jsp" %>
   
		</div>
	</body>
</html>