<!-- MODIFY PLACE STARTED -->
<% if(request.getParameter("request")!=null && request.getParameter("request").equals("modifyPlace") || 
	request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyPlace")){ %>
	
	<table border="0" width="50%" align="center" id="bordered" class="bordered">
		<thead>
	  		<tr>
	  			<td width="150px"><b>Place Name</b></td>
	  			<td width="200px"><b>Action</b></td>
	  		</tr>		  	
		</thead>
		<c:choose>
			<c:when test="${ listOfPlaceUpdated ne null }">
 				<c:forEach var="place" items="${listOfPlaceUpdated}">
					<tr>
				    	<td>${ place.placeName }</td>
				    	<td>
				    		<a href="placeManipulation?request=modifyPlaceDetails&placeId=${ place.placeId }" class="myButton">Modify</a> &nbsp; 
				    		<a href="deletePlace?request=delete&placeId=${ place.placeId }" class="myButton">Delete</a>
				    	</td>
				  	</tr>
			   	</c:forEach>
			</c:when>
			<c:otherwise>
				No Found
			</c:otherwise>
		</c:choose>
	</table>
<% } %>
<!-- MODIFY PLACE ENDED -->

<!-- This will be called when person click on modify link for some place -->
<% if(request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyPlaceDetails")){ %>
	<c:choose>
		<c:when test="${ placeUpdated ne null }">	

			<form action="modifyPlace" method="post">
				<input type="hidden" name="placeId" value=${ placeUpdated.placeId }>	
				<table border="0" width="50%" align="center">
					<tr height="40px">
						<td style="font-weight: bold; width: 150px;">Enter place Name :</td>
					  	<td><input type="text" name="placeName" value="${ placeUpdated.placeName }"></td>
					</tr>
				  	<tr height="70px">
				    	<td colspan="2"><input type="submit" name="submit" class="myButton"></td>
				  	</tr>
				</table>  
			</form>

		</c:when>
		<c:otherwise>
			No Place found.				
		</c:otherwise>
	</c:choose>
<% } %>

<!-- DELETE PLACE STARTED -->
<% if(request.getParameter("request")!=null && request.getParameter("request").equals("deletePlace")){ %>
	<table>
		<tr>
	    	<td>Select Driver Name to delete :</td>
			<td>
				<input type="text" name="driverName">
			</td>
	  	</tr>
	</table>
<% } %>
<!-- DELETE PLACE ENDED -->