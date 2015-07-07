<% if(request.getParameter("request")!=null && request.getParameter("request").equals("modifyRoutePlace") || 
request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyRoutePlace")){ %>
	<table border="0" align="center" id="bordered" class="bordered" width="100%">
		<thead>
			<tr>
		  		<td width="80px"><b>Route Name</b></td>
		  		<td width="150px"><b>Places</b></td>
		  		<td width="80px"><b>Vehicle No.</b></td>
		  		<td width="70px"><b>Driver Name</b></td>
		  		<td width="140px"><b>Action</b></td>
			</tr>		  	
		</thead>
		<c:choose>
			<c:when test="${ listOfAllRouteData ne null }">
				<c:forEach var="route" items="${listOfAllRouteData}">
  					<tr>
    					<td>${ route.route.routeName }</td>
						<td>
							<c:set var="place1" value=""></c:set>
							<% pageContext.setAttribute("newLineChar", "-->"); %>  
	  						<c:choose>
		  						<c:when test="${ route.listOfRoutePlaceMappingUpdated ne null }">
			  						<c:forEach var="place" items="${route.listOfRoutePlaceMappingUpdated}">
				    					<c:set var="place1" value='${ place1 }   ${ place.place.placeName }  ${newLineChar}'></c:set>
			   						</c:forEach>
			   						
			   						 <c:out value="${fn:substring(place1,0,fn:length(place1)-3)}"/>
								</c:when>
								<c:otherwise>
									No Place Found
								</c:otherwise>
							</c:choose>
						</td>
					    <td>${ route.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.vehicle.vehicleNumber }</td>
					    <td>${ route.routeDriverVehicleMappingUpdated.driverVehicleMappingUpdated.driver.driverName }</td>
    					<td>
    						<a href="modifyOrDeleteRoutePlace?request=modifyRoutePlaceRequest&routeId=${ route.route.routeId }" class="myButton">Modify</a> &nbsp; 
    						<a href="modifyOrDeleteRoutePlace?request=deleteRoutePlace&routeId=${ route.route.routeId }" class="myButton">Delete</a>
    					</td>
  					</tr>
 				</c:forEach>
			</c:when>
			<c:otherwise>
				No Route Found
			</c:otherwise>
		</c:choose>
	</table>
<% } %>

<!-- This will be called when person click on modify link for some ROUTE-PLACE-DRIVER-VEHICLE MAPPING START -->
<% if(request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyRoutePlaceDetails")){ %>
	<c:choose>
		<c:when test="${ routePlaceData ne null }">	
			<div style="padding-left: 400px;">		
				<form action="modifyRoute" method="post">
					<table border="0" align="center"> 
								<tr height="70px">
 									<td style="font-weight: bold;">Select Route Name :</td>
 									<td>
 										<select size="1" name="routeId"> 
									<c:if test="${ listOfRoute ne null }">	
											<c:forEach var="route" items="${listOfRoute}">
		 										<option value="${ route.routeId }" ${route.routeId == routePlaceData.route.routeId ? 'selected' : ''} >${ route.routeName }</option>
											</c:forEach> 
 										</c:if>	
								</select>
 									</td>
								</tr>
					</table>  
					<table border="0" align="center">
								<tr height="50px">
 									<td colspan="2" style="font-weight: bold;">Select Place where Bus has stops :</td>
								</tr>
								<tr>
							 			<td colspan="2">
 										<div>
    										<table border="1">
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
       												<c:if test="${routePlaceData.listOfRoutePlaceMappingUpdated ne null}"> 
        													<c:forEach var="place" items="${routePlaceData.listOfRoutePlaceMappingUpdated}">
       														<tr id="sheepItForm_template">
         														<td>
           															<span id="sheepItForm_label"></span>
         														</td>
         														<td>
              														<select id="sheepItForm_#index#_phone" name="place" type="select">
																<c:choose>
																	<c:when test="${listOfAllPlaces ne null}">
																		<c:forEach var="place" items="${listOfAllPlaces}">
																		  	<option>${ place.placeName }</option>
																		</c:forEach>
																	</c:when>		
																	<c:otherwise></c:otherwise>							
																</c:choose>
															</select>			               
         														</td>
															<td>
															<select name="time_hour" id="sheepItForm_#index#_description" name="hour" type="select1">
											               		<option>01</option>
											               		<option>02</option>
											               		<option>03</option>
											               		<option>04</option>
											               		<option>05</option>
											               		<option>06</option>
											               		<option>07</option>
											               		<option>08</option>
											               		<option>09</option>
											               		<option>10</option>
															</select>
											            </td>
														<td>
															<select name="time_minute" id="sheepItForm_#index#_description1" name="minute" type="select2">
																	<option>01</option>
																	<option>02</option>
																	<option>03</option>
																	<option>04</option>
																	<option>05</option>
																	<option>06</option>
																	<option>07</option>
																	<option>08</option>
																	<option>09</option>
																	<option>10</option>																							
															</select>
														</td>
															<td>
           															<a id="sheepItForm_remove_current" name="sheepItForm_remove_current"><img class="delete" src="resources/multiPlaceSelection/images/cross.png" width="16" height="16" border="0" /></a>
         														</td>	
         													</tr>
         												</c:forEach>
         											</c:if>
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
					</table>
					<table border="0" align="center">
						<tr height="30px">
						    <td></td>
						    <td></td>
								</tr>
						<tr>
						    <td style="font-weight: bold;">Select Vehicle for Route :</td>
						    <td>
     									<select size="1" name="vehicle">
									<c:if test="${ listOfDriverVehicleMappingUpdated ne null }">
								 		<c:forEach var="driverVehicleMapping" items="${listOfDriverVehicleMappingUpdated}">
								 		 	<option value="${ driverVehicleMapping.driverVehicleMappingId }" >Driver Name: ${ driverVehicleMapping.driver.driverName } , Vehicle Number: ${ driverVehicleMapping.vehicle.vehicleNumber }</option>
								 		</c:forEach> 
								  	</c:if>
									</select>
 									</td>
								</tr>
								<tr>
 									<td style="font-weight: bold;">Select Route Type:</td>
 									<td>
						        <select size="1" name="routeType"> 
									<option value="regular" >Regular</option>
									<option value="night" >Night</option>
								 </select>			    
 									</td>
								</tr>
						<tr>
 									<td colspan="2" align="center" height="60px"><input type="submit" name="submit" value="Submit"></td>
								</tr>
							</table>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			No Vehicle found.
		</c:otherwise>
	</c:choose>
<% } %>
<!-- This will be called when person click on modify link for some ROUTE-PLACE-DRIVER-VEHICLE MAPPING END -->

<!-- DELETE DRIVER START -->
<% if(request.getParameter("request")!=null && request.getParameter("request").equals("deleteVehicle")){ %>
	<table align="center">
	  <tr>
	    <td>Select Driver Name to delete :</td>
	    <td><input type="text" name="driverName"></td>
	  </tr>
	</table>
<% } %>
<!-- DELETE DRIVER END -->
