<li id="page_2">
	<div class="text">Route Details</div>
	<div class="cont1">
		<div class="wrapper" style="padding-bottom: 15px;">
			<p class="pad_top1">
				<strong>Home to Office</strong>
			
			<c:choose>
				<c:when test="${firstRoute ne null}">
						
						<table border="0" style="border-color: blue; float: left;" width="90%">
							<tr>
								<td width="20%">Source Place : </td>	
								<td width="80%">
									<div class="sourceAndDestination">
										${firstRoute.sourcePlace }
									</div>
								</td>	
							</tr>
						</table>
						
	    				<table border="0" style="border-color: blue; float: left;  margin: 10px;" >
							<tr style="width: 20px;">
								<td style="width: 45px; white-space: wrap;" valign="top"> Via : </td>	
								<td style="width: 600px; white-space: wrap;" valign="top">
									<div class="inBetweenPlaces">

										<c:set var="string1" value="${firstRoute.inBetweenPlaces}"/>
										<c:set var="string2" value="${fn:replace(string1, '-->' , ' &nbsp;|&nbsp; ')}" />	
									
										${ string2 }

									</div>
								</td>
							</tr>	
						</table>
						
						<table border="0" style="border-color: blue; float: left;">
							<tr>
								<td width="120px">Destination Place: </td>
								<td width="">
									<div class="sourceAndDestination">
										${firstRoute.destinationPlace }
									</div>
								</td>	
							</tr>
						</table>
						
						<div style="height: 80px"></div>
						<table border="0" style="border-color: green; float: center;  margin: 10px; "> 
							<tr>
								<td width="120px"><strong>Availability: </strong></td>
								<td >
									<div>
										${firstRoute.availability }
									</div>
								</td>	
							</tr>

							<tr>
								<td height="10px" colspan="2"></td>
									
							</tr>
							
							<tr>
								<td width="120px"><strong>Carpooling on: </strong></td>
								<td >
									<div>
										<c:choose>
			       							<c:when test="${firstRoute.carpoolDate ne null}">
												${ firstRoute.carpoolDate } &nbsp;&nbsp; at  &nbsp;&nbsp; ${ firstRoute.sourceLeavingTime } 
																				       								
			       							</c:when>
			       							<c:otherwise>
												${ firstRoute.carpoolOnDays } &nbsp;&nbsp; at  &nbsp;&nbsp; ${ firstRoute.sourceLeavingTime }
			       							</c:otherwise>
					       				</c:choose>
									</div>
								</td>	
							</tr>

						</table>
						
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>	
			
			</p>
		</div>
		
		<div style="border-bottom: 1px solid #E7EBED; width: 90%;" >
		
		</div>
		
		<div class="wrapper" style="padding-top: 13px;">
		
			<p class="pad_top1">
				<strong>Office To Home</strong>
				
				<c:choose>
					<c:when test="${secondRoute ne null}">
							
							<table border="0" style="border-color: blue; float: left;" width="90%">
								<tr>
									<td width="20%">Source Place : </td>	
									<td width="80%">
										<div class="sourceAndDestination">
											${secondRoute.sourcePlace }
										</div>
									</td>	
								</tr>
							</table>
							
							
							
							<table border="0" style="border-color: blue; float: left;  margin: 10px;" >
								<tr style="width: 20px;">
									<td style="width: 45px; white-space: wrap;" valign="top"> Via : </td>	
									<td style="width: 600px; white-space: wrap;" valign="top">
										<div class="inBetweenPlaces">
	
											<c:set var="string1" value="${secondRoute.inBetweenPlaces}"/>
											<c:set var="string2" value="${fn:replace(string1, '-->' , ' &nbsp; | &nbsp; ')}" />	
										
											${ string2 }
	
										</div>
									</td>
								</tr>	
							</table>
							
					
							
							<table border="0" style="border-color: blue; float: left;" >
								<tr>
									<td width="120px">Destination Place: </td>
									<td>
										<div class="sourceAndDestination">
											${secondRoute.destinationPlace }
										</div>
									</td>
								</tr>
							</table>
							
							
						<div style="height: 80px"></div>
						<table border="0" style="border-color: green; float: center;  margin: 10px; ">
							<tr>
								<td width="120px"><strong>Availability: </strong></td>
								<td >
									<div>
										${secondRoute.availability }
									</div>
								</td>	
							</tr>
							
							<tr>
								<td height="10px" colspan="2"></td>
									
							</tr>
							
							<tr>
								<td width="120px"><strong>Carpooling on: </strong></td>
								<td >
									<div>
										<c:choose>
			       							<c:when test="${secondRoute.carpoolDate ne null}">
												${ secondRoute.carpoolDate } &nbsp;&nbsp; at  &nbsp;&nbsp; ${ secondRoute.sourceLeavingTime } 
																				       								
			       							</c:when>
			       							<c:otherwise>
												${ secondRoute.carpoolOnDays } &nbsp;&nbsp; at  &nbsp;&nbsp; ${ secondRoute.sourceLeavingTime }
			       							</c:otherwise>
					       				</c:choose>
									</div>
								</td>	
							</tr>

						</table>
								
					</c:when>
					<c:otherwise>
						 <br>
						 ${carpooler.nameOfCarpooler} doesn't want to carpool while going back to home.
					</c:otherwise>
				</c:choose>	
				
			
			</p>
		</div>
	</div>
</li>