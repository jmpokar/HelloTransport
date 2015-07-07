<form action="addRoutePlace" method="get">
	<table border="0" align="center" width="55%">
		<tr>
			<td style="font-weight: bold;" width="200px">Enter Route Name :</td>
			<td>
				<input type="text" name="routeName" />
    		</td>
		</tr>
		<tr height="50px">
			<td colspan="2" style="font-weight: bold;">
				Select Place where Bus has stops :
			</td>
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
        							<select id="sheepItForm_#index#_phone" name="place">
										<c:choose>
											<c:when test="${listOfAllPlaces ne null}">
												<c:forEach var="place" items="${listOfAllPlaces}">
												  	<option>${ place.placeName }</option>
												</c:forEach>
											</c:when>									
										</c:choose>
			               			</select>
       							</td>			            
								<td>
									<select name="time_hour" id="sheepItForm_#index#_description" name="hour">
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
				               		<select name="time_minute" id="sheepItForm_#index#_description1" name="minute">
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
    						<br><br><br> 
	 			        <div id="sheepItForm_add_n">
				        	<input id="sheepItForm_add_n_input" type="text" size="4" />
				          	<div id="sheepItForm_add_n_button">
				            	<a><span>Add</span></a>
				          	</div>
				        </div> 
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td style="font-weight: bold;">Select Driver for Route :</td>
	   		<td>
		        <select size="1" name="driverId" style="width: 180px;"> 
					<c:if test="${ listOfDriverUpdated ne null }">	
				 		<c:forEach var="driver" items="${listOfDriverUpdated}">
				 		 	<option value="${ driver.driverId }">${ driver.driverName }</option>
				 		</c:forEach> 
				  	</c:if>
		 		</select>
	    	</td>
	 	</tr>	  						
		<tr>
    		<td style="font-weight: bold;">Select Vehicle for Route :</td>
    		<td>
		        <select size="1" name="vehicleId" style="width: 180px;"> 
					<c:if test="${ listOfVehicleUpdated ne null }">	
				 		<c:forEach var="vehicle" items="${listOfVehicleUpdated}">
				 		 	<option value="${ vehicle.vehicleId }" >${ vehicle.vehicleNumber } (${ vehicle.vehicleCapacity } Seater)</option>
				 		</c:forEach> 
				  	</c:if>
		 		</select>
    		</td>
  		</tr>
		<tr>
			<td style="font-weight: bold;">Select Route Type:</td>
			<td>
   				<select size="1" name="routeType" style="width: 180px;"> 
					<option value="regular" >Regular</option>
					<option value="night" >Night</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2" height="60px"  style="padding-top: 30px;">
				<input type="submit" name="submit" value="Submit" class="myButton">
			</td>
		</tr>
	</table>							
</form>