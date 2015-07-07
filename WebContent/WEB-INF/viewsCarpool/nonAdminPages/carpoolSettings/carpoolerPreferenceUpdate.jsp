<fieldset>   
  	<legend style="width:161px;height:64px;background-image: url(../../images/letspoolit/thumb.jpg); margin-left:65px;"></legend>
	  <center>   
		  <table width="798" border="0">
			  	<tr>
			  		<td>
						<div id="holder">
					 		<div>
								<div class="button-holder">
									<table border="0">
										<tr>
											<td width="250px">You would like Carpooler to contact you by :</td>
											<td>
												<input type="radio" name="contactPreference" id="preferedWayOfContactEmail" 
													<c:if test="${Carpooler.contactPreference eq 'preferedWayOfContactEmail'}">checked</c:if>
													value="preferedWayOfContactEmail" class="regular-radio" >
												<label for="preferedWayOfContactEmail"></label> Email
											</td>
											<td>
												<input type="radio" name="contactPreference" id="preferedWayOfContactCall" 
													<c:if test="${Carpooler.contactPreference eq 'preferedWayOfContactCall'}">checked</c:if>
													value="preferedWayOfContactCall" class="regular-radio" >
												<label for="preferedWayOfContactCall"></label> Call
											</td>
											<td>
												<input type="radio" name="contactPreference" id="preferedWayOfContactAny" 
													<c:if test="${Carpooler.contactPreference eq 'preferedWayOfContactAny'}">checked</c:if>
													value="preferedWayOfContactAny" class="regular-radio" > 
												<label for="preferedWayOfContactAny"></label> I don't mine.
											</td>
										</tr>
										<tr>
											<td width="250px">Your Prefered Carpooler:</td>
											<td>
												<input type="radio" name="genderPreference" id="preferedTravelGenderMale" 
													<c:if test="${Carpooler.genderPreference eq 'm'}">checked</c:if>
													value="m" class="regular-radio" >
												<label for="preferedTravelGenderMale"></label> Male
											</td>
											<td>
												<input type="radio" name="genderPreference" id="preferedTravelGenderFemale" 
													<c:if test="${Carpooler.genderPreference eq 'f'}">checked</c:if>
													value="f" class="regular-radio" >
												<label for="preferedTravelGenderFemale"></label> Female
											</td>
											<td>
												<input type="radio" name="genderPreference" id="preferedTravelGenderAny" 
													<c:if test="${Carpooler.genderPreference eq 'a'}">checked</c:if>
													value="a" class="regular-radio" > 
												<label for="preferedTravelGenderAny"></label> I don't mine.
											</td>
										</tr>
										<tr>
											<td width="300px">What you would like carpooler to compensate</td>
											<td>
												<input type="radio" name="compensation" id="compensationFuelSharing" 
													<c:if test="${Carpooler.compensation eq 'compensationFuelSharing'}">checked</c:if>	
													value="compensationFuelSharing" class="regular-radio" onclick="compensate()">
												<label for="compensationFuelSharing"></label> Fuel Sharing
											</td>
											<td>
												<input type="radio" name="compensation" id="compensationPrice" 
													<c:if test="${Carpooler.compensation ne 'compensationFuelSharing' && compensation ne 'compensationFree'}">checked</c:if>
													value="compensationPrice" class="regular-radio" onclick="compensate()">
												<label for="compensationPrice"></label> Price
											</td>
											<td>
												<input type="radio" name="compensation" id="compensationFree" 
													<c:if test="${Carpooler.compensation eq 'compensationFree'}">checked</c:if>
													value="compensationFree" class="regular-radio" onclick="compensate()"> 
												<label for="compensationFree"></label> Free
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
			    	</td>
			  	</tr>
		  </table>
		  
	
			<div id="compensationPriceDiv" style="display: <c:if test="${not fn:contains(Carpooler.compensation, 'compensationPrice')}">none;</c:if>">	
				 <center>   
					<table width="190px" style="margin: 10px 10px 10px 10px;" border="0">
						<tr>
							<td align="left">
								<center> Enter amount: <input type="text" name="compensationAmount" 
									value="${fn:substring(Carpooler.compensation, 18, fn:length(Carpooler.compensation))}"
									id="compensationAmount" style="width: 190px;" class="ui-timepicker-hour"/> </center>
							</td>
						</tr>	
					</table>
		   		</center>
		   	</div>			
    </center>
  </fieldset>