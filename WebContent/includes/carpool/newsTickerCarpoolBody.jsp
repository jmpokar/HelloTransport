<div id="newsticker-demo">    
	<div class="newsticker-jcarousellite">
		<ul>
			<c:choose>
				<c:when test="${listOfAllCarpooler ne null and fn:length(listOfAllCarpooler) > 0}">
 					<c:forEach var="carpooler" items="${listOfAllCarpooler}">
 	   					<c:forEach var="sourceToDestinationDetails" items="${carpooler.listOfSourceToDestinationDetails}">						
							<li>
								<table width="90%" height="80px" border="0">
									<tr>
										<td width="65" rowspan="4" valign="top">
									    	<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><img class="image2" height="50px" width="50px" src="../../resources/common/images/profilePicture/${carpooler.user.userProfilePic}" /></a>
									    </td>
									    <td width="48" height="15px" colspan="2" valign="top">
									    	<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><insidelabel valign="top" style="font-weight: bold;">${carpooler.user.userName}</insidelabel></a>
									    </td>					    
									</tr>
									<tr>
										<td width="10px" valign="top"><a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"><insidelabel style="font-weight: bold;"></insidelabel></a></td>
									    <td valign="top" height="40px">
									    	<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}">
										    	<insidelabel>
										    		${sourceToDestinationDetails.sourcePlace}  
										    		<br>
										    		<img style="padding-left: 3px; padding-right: 3px;" height="10px" width="15px" 
										    		src="../../../resources/common/images/misc/arrow.png" />  
										    		<br>
										    		${sourceToDestinationDetails.destinationPlace}
										    	</insidelabel>
											</a>
									   	</td>
									</tr>
								</table>				
							</li>
						</c:forEach>
					</c:forEach>
				</c:when>
		 	   	<c:otherwise>
					<center>
						<br><br>
						No Rides Found yet, Let's start from you.
						<br><br>
						<img alt="" width="200px" height="200px" src="../images/car/carpool1.jpg">
					</center>	
			  	</c:otherwise>
			</c:choose>
   		</ul>
	</div>
	<div class="title"><!-- <a href="allEvents">View all Events</a> --></div>
</div>