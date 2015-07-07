					<div id="quotes">
						<c:forEach var="feedback" items="${listOfPraiseFeedback}">
							<div class="textItem">
								<table width="152" border="0" height="100px">
									<tr>
										<td width="60px"> <img width="30" height="30" src="../../../resources/common/images/misc/cl1.png" /> </td>
										<td width="90px"> <img class="image1" width="50" height="50" src="../../resources/common/images/profilePicture/${ feedback.user.userProfilePic }" /></td>
										<td> <label> ${ feedback.feedbackContents } </label> </td>
										<td width="60px"> <img width="30" height="30" src="../../../resources/common/images/misc/cl2.png" /> </td>
									</tr>
									<tr>
										<td colspan="4" height="30px" align="center"><img src="../../../resources/common/images/misc/quote-shelf.png" /></td>
									</tr>
									<tr>
										<td align="center" colspan="4">
											<c:choose>
												<c:when test="${feedback.user ne null and feedback.user.userName ne null}">
													<rideBy> ${ feedback.user.userName }, </rideBy>
												</c:when>
												<c:otherwise>
													<rideBy> Anonymous, </rideBy>
												</c:otherwise>
											</c:choose>
											
											<rideBy1> 
												<a href="testimonials.jsp"> More Stories <img  src="../../../resources/common/images/misc/arrow.png" /> </a> 
											</rideBy1>
										</td>
									</tr>	
								</table>
							</div>
						</c:forEach>
					</div>