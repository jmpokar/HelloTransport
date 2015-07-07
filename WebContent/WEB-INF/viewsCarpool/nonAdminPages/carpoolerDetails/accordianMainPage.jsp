<li id="page_1">
	<div class="text">Main Page</div>
		<div class="cont">
			<p class="pad_top1">
				<div class="welcomeText">${carpooler.nameOfCarpooler}'s Profile</div>
			</p>
		
			<div class="wrapper">
				<figure class="left marg_right1"><img width="80px" height="150px" src="../../resources/common/images/profilePicture/${carpooler.photoOfCarpooler}" alt="" class="image1"></figure>
				<p class="pad_top1" style="display: <c:if test="${userTestimonial eq null}">none;</c:if>">
					<c:choose>
						<c:when test="${userTestimonial ne null}"><br>
							${userTestimonial.testimonial.testimonial}
						</c:when>									
						<c:otherwise>
							
						</c:otherwise>
					</c:choose>	
				</p>	
				<br>
						
					
				<table border="0">
					<tr>
						<td width="100px">Name :</td>
						<td>${carpooler.nameOfCarpooler}</td>
						
					</tr>
					<tr>
						<td>Gender :</td>
						<td> <c:choose> <c:when test="${carpooler.gender eq 1}">Male</c:when> <c:otherwise>Female</c:otherwise></c:choose> </td>
					</tr>
					<tr>
						<td>DOB :</td>
						<td> ${carpooler.dob} </td>
					</tr>										
					<tr>
						<td colspan="2" height="15px"> </td>
					</tr>
					
				</table>
												
							
				<table border="0">
					<tr>
						<td width="200px" valign="top">
							Contact Details :
						</td>
						<td>
							<c:choose>
								<c:when test="${carpooler.carpoolerPreference.wayOfContact eq 'preferedWayOfContactCall'}">
									${carpooler.primaryContactNumber} , ${carpooler.secondarContactNumber} 
									<br/>
								</c:when>									
							</c:choose>				
							<c:choose>
								<c:when test="${carpooler.carpoolerPreference.wayOfContact eq 'preferedWayOfContactEmail'}">
									${carpooler.emailIdOfCarpooler}.
									<br/> 
								</c:when>									
							</c:choose>
							<c:choose>
								<c:when test="${carpooler.carpoolerPreference.wayOfContact eq 'preferedWayOfContactAny'}">
									${carpooler.primaryContactNumber} &nbsp;&nbsp; ${carpooler.secondarContactNumber}
									${carpooler.emailIdOfCarpooler}.
									<br/>
								</c:when>									
							</c:choose>
						</td>											
					</tr>
					<tr>
						<td colspan="2" height="10px"></td>
					</tr>
					<tr>
						<td>Compensation :</td>
						<td> 
							<c:choose>
								<c:when test="${carpooler.carpoolerPreference.compensation eq 'compensationFree'}">
										Free
								</c:when>									
							</c:choose>
							<c:choose>
								<c:when test="${carpooler.carpoolerPreference.compensation eq 'compensationFuelSharing'}">
									Fuel Sharing
								</c:when>									
							</c:choose>
							<c:if test="${fn:containsIgnoreCase(carpooler.carpoolerPreference.compensation, 'compensationPrice')}">
									<c:set var="end" value="${fn:length(carpooler.carpoolerPreference.compensation)}" />
									<c:set var="string2" value="${fn:substring(carpooler.carpoolerPreference.compensation, 18, end)}" />
									${ string2 } Rs/Seat. 						       								
				       		</c:if>					
						</td>
					</tr>	
					<tr>
						<td colspan="2" height="10px"></td>
					</tr>	
					<tr>
						<td valign="top">Preferred Travel Companion :</td>
						<td valign="top"> 
							<c:choose>
								<c:when test="${carpooler.carpoolerPreference.genderPreference eq 'm'}">
										Male
								</c:when>
								<c:when test="${carpooler.carpoolerPreference.genderPreference eq 'f'}">
										Female 
								</c:when>
								<c:when test="${carpooler.carpoolerPreference.genderPreference eq 'a'}">
										Don't mine, I am fine with Male and Female both.
								</c:when>
							</c:choose>
											
						</td>
					</tr>	
										
			</table>
	</div>
</li>