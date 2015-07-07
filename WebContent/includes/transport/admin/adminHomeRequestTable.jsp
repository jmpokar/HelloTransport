<c:choose>
				<c:when test="${listOfRouteDetailsHelper ne null && fn:length(listOfRouteDetailsHelper) gt 0}">								
					<div id="buttons" style="padding-top: 50px;">
						<table id="report" border="1" width="100%" class="customers">
							<tr>
								<td>no</td>
							    <td>email id</td>
							    <td>date</td>
							    <td>request type</td>
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
							
									
								<tr class="odd">
									<td>
										<p><em><%=(i+1) %></em></p>
									</td>
									<td width="300px">
										<p>
											<em> 
			        							<%=userRequestNew.getEmailId() %>
											</em>
										</p>
									</td>
									<td>
										<p>
											<em>
		            							<%=userRequestNew.getRequestDate() %>
											</em>
										</p>
									</td>
									<td>
										<p>
											<em>
												<%=message %>   
											</em>
										</p>
									</td>
									<td style="width: 100px;">
										<%-- <a style="text-decoration: none; float: left;" href="#" class="myButton" id="btn_${theCount.count}">Details</a> --%>
										<a style="text-decoration: none; float: left; margin-right: 5px;" href="#" class="myButton" id="btn_<%=userRequestNew.getRequestId()%>">Details</a>
									</td>
								</tr>
							<% } }else{ %> <tr class="odd"><td colspan="5">No Entries Found</td></tr> <% }  %>	
						</table>	
					</div>
							
					<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG START -->
					<%
						//List<UserRequestNew> listOfUserRequestNew1 = (List<UserRequestNew>)request.getAttribute("listOfUserRequestNew");
						
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
						<form action="adminResponse" method="get" id="signinform<%=userRequestNew.getRequestId()%>">
							<%
								String routeName = json.getString("routeName");
								String placeName = json.getString("placeName");
							%>    
							
							<input type="hidden" value="<%=userRequestNew.getRequestId() %>" name="requestId">
							
							<table width="100%" border="0">
								
								<tr>
							    	<td colspan="2" style="padding-top: 10px; padding-bottom: 5px;"><b>User details</b></td>
								</tr>
								
								<tr>
							    	<td width="160px">Requested By : </td>
							    	<td>
							    		<input type="hidden" value="<%=userRequestNew.getEmailId() %>" name="emailId">
							    		<%=userRequestNew.getEmailId() %>
							    	</td>
								</tr>

								<tr>
							    	<td colspan="2" style="padding-top: 10px; padding-bottom: 5px;"><b>Request details</b></td>
								</tr>
								
								<tr>
							    	<td width="160px">Request : </td>
							    	<td>
							    		<%=message %>&nbsp;on&nbsp;<%=userRequestNew.getRequestDate() %>
							    		<input type="hidden" value="<%=userRequestNew.getRequestDate() %>" name="requestDate">
							    	</td>
								</tr>
								
							  	<tr>
							    	<td width="160px">Route Name : </td>
							    	<td>
							    		<%=routeName %>
							    		<input type="hidden" value="<%=routeName %>" name="routeName">
							    	</td>
								</tr>
								<tr>
							    	<td>Get In Place : </td>
							    	<td>
							    		<%=placeName %>
							    		<input type="hidden" value="<%=placeName %>" name="placeName">
							    	</td>
							  	</tr>
							  	
							  	<tr>
							    	<td colspan="2" style="padding-top: 10px; padding-bottom: 5px;"><b>Statitistics for Route:</b></td>
								</tr>
								
								
							  	<tr>
							    	<td>Bus Capacity : </td>
								    <%

									String busCapacity=null;
									List<RouteDriverVehicleMappingUpdated> listOfRouteDriverVehicleMappingUpdated = (List<RouteDriverVehicleMappingUpdated>)request.getAttribute("listOfRouteDriverVehicleMappingUpdated");
									if(listOfRouteDriverVehicleMappingUpdated!=null && listOfRouteDriverVehicleMappingUpdated.size()>0){
										for(int j=0; j<listOfRouteDriverVehicleMappingUpdated.size(); j++){
											RouteDriverVehicleMappingUpdated routeDriverVehicleMappingUpdated = listOfRouteDriverVehicleMappingUpdated.get(j);
											if(routeDriverVehicleMappingUpdated.getRoute().getRouteName().equals(routeName)){
												busCapacity = routeDriverVehicleMappingUpdated.getDriverVehicleMappingUpdated().getVehicle().getVehicleCapacity();
											}
										}
									}
									
									%>
							 	   <td>	
								    	<% 
								    	if(busCapacity==null){
								    		out.write(0);
								    	}else{
								    		out.write(busCapacity);
								    	}%>
								    	Persons
							    	</td>
								</tr>
								<tr>
									<td>Regsitered Users: </td>
									<%
									int count=0;
									List<List<UserRouteMappingUpdated>> listOfUserRouteMappingUpdated = (List<List<UserRouteMappingUpdated>>)request.getAttribute("listOfUserRouteMappingUpdated");
									if(listOfUserRouteMappingUpdated!=null && listOfUserRouteMappingUpdated.size()>0){
										for(int j=0; j<listOfUserRouteMappingUpdated.size(); j++){
											List<UserRouteMappingUpdated> listOfUserRouteMapping = listOfUserRouteMappingUpdated.get(j);
									
											if(listOfUserRouteMapping!=null && listOfUserRouteMapping.size()>0){
												for(int k=0; k<listOfUserRouteMapping.size(); k++){
													UserRouteMappingUpdated userRouteMapping = listOfUserRouteMapping.get(k);
													if(userRouteMapping.getRoute().getRouteName().equals(routeName)){
														count++;
													}
													
												}
											}
										}
									}
									%>
									<td><%=count %>&nbsp;Persons</td>
							  </tr>
							  								
								<tr>
							    	<td style="padding-top: 30px; padding-bottom: 5px;">
							    		<b>Select Status:</b>
							    	</td>
							    	<td style="padding-top: 30px; padding-bottom: 5px;"> 
								    	<select name="adminStatus" data-placeholder="Status"
								    		 style="width: 240px;" class="chzn-select" >
													<option value="1">Pending</option>
								    				<option value="2">Closed</option>
								    				<option value="3">On Hold</option>
										</select>
							    	</td>
								</tr>
							  	<tr>
							    	<td colspan="2" style="padding-top: 10px; padding-bottom: 5px;"><b>Comments</b></td>
								</tr>
								<tr>
							    	<td colspan="2" style="padding-top: 10px; padding-bottom: 5px;" align="center">
							    		<textarea rows="5" cols="60" name="adminComment"></textarea>
							    	</td>
								</tr>
<!-- 								<tr>  
									<td align="center" colspan="2">
										<input type="submit" class="myButton" value="Approve"  />
										<input type="submit" class="myButton" value="Reject"  />
									</td>
									
								</tr> -->	
							</table>
						</form>		
						</div>
						
					<% }} %>
					<!-- ITERATE AND FILL DIV, SO THAT IT CAN BE DISPLAYED AS DIALOG END -->
		
				</c:when>
				<c:otherwise>
					Sorry, No records found.
				</c:otherwise>
			</c:choose>    				
