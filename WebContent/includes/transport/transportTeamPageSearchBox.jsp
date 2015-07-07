<form action="searchMatchingRoutes" method="get">
	<table border="0" align="center">
		<tr>
	  		<td>
	  			<h5>Search Places:</h5>
	  		</td>
	    	<td>
	    		<input type="text" name="searchTextFieldFrom" id="homeToOfficeFrom1" />
		    	<script type="text/javascript">
			    	$(document).ready(function() {
	            			$("#homeToOfficeFrom1").tokenInput("searchPlaces",{
	            	    	tokenLimit: 1			
						});
		        	});
	        	</script>
	    	</td>
	    	<td>
				<input type="image" name="submit" src="../resources/common/images/misc/search.png" height="32px" width="30px"/>  	
	    	</td>
	  	</tr>
	</table>
</form>

<!-- SEARCH RESULT START -->
<input type="hidden" name="hiddenElem" id="hiddenElem" />
<div id="searchResults" style="padding-top: 50px;">
	<c:set var="headerFlag" value="1" scope="page" />
	<% int flag=0; %>
	
	<c:if test="${searchFlag eq true}">
		<div id="buttons1" style="border: 1px; border-width: 1px; border-color: #252544; border-style: solid; ">
		 		<c:choose>
				<c:when test="${listOfRouteDetailsHelper ne null && fn:length(listOfRouteDetailsHelper) gt 0}">				
			 		<c:forEach var="routeDetailsHelper" items="${listOfRouteDetailsHelper}" varStatus="theCount" >
			 			<c:forEach var="routePlaceMapping" items="${routeDetailsHelper.listOfRoutePlaceMappingUpdated}" varStatus="theCount1" >
			 				<c:if test="${routePlaceMapping.place.placeId eq searchPlaceId}">
								<table align="center" width="90%" >
									<c:if test="${headerFlag eq 1}">
								  		<tr>
								  			<td colspan="3" align="right" >
								  				<input type="image" value="close" onclick="closeDiv()" src="../resources/images/images/general/close_hover.png"/>
								  			</td>
								  		</tr>
									  	<tr style="background-color: gray; color: white;">
									    	<th width="50px;">Route Name</th>
									    	<th>Place passes by</th>
									    	<th width="50px;">Action</th>
										</tr>
										<c:set var="headerFlag" value="2"/>
									</c:if>	
									<tr style="height: 40px;">
										<td width="100px;">
											<p><em>${routeDetailsHelper.route.routeName}</em></p>											
										</td>
										<td>
											<c:forEach var="routePlaceMappingCSV" items="${routeDetailsHelper.listOfRoutePlaceMappingUpdated}" >
												<em>
													<c:choose>
														<c:when test="${routePlaceMappingCSV.place.placeId eq searchPlaceId}">
															<% if(flag==1){ %>
																-->
															<% } %>
															&nbsp;<b style="font-weight: bold;">${routePlaceMappingCSV.place.placeName}</b> 
															<% flag=1; %>
														</c:when>
														<c:otherwise>
															<% if(flag==1){ %>
																-->
															<% } %>
															&nbsp; ${routePlaceMappingCSV.place.placeName}
															<% flag=1; %>
														</c:otherwise>
													</c:choose> 
												</em>
											</c:forEach>	
										</td>
										<td style="width: 200px;"> 
											<a style="text-decoration: none; float: left; margin-right: 5px;" href="#" class="myButton" id="btn_${routeDetailsHelper.route.routeId}">Details</a>
											<a style="text-decoration: none; float: left;" href="getInPlaceSelection?route=${ routeDetailsHelper.route.routeName }" class="myButton">Book</a>
										</td>
									</tr>
								</table>
							</c:if>
							<% flag=0; %>
						</c:forEach> 					
					</c:forEach>
				</c:when>
				<c:otherwise>
					No Results Found...
				</c:otherwise>
			</c:choose>
		</div>
	</c:if>	 	
</div>
<!-- SEARCH RESULT END -->
