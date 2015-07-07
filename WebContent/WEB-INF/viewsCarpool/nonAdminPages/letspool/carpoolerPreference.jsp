<fieldset>   
  	<legend style="width:161px;height:64px;background-image: url(../../../resources/common/images/misc/thumb.jpg); margin-left:65px;"></legend>
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
												<input type="radio" name="contactPreference" id="preferedWayOfContactEmail" value="preferedWayOfContactEmail" class="regular-radio" >
												<label for="preferedWayOfContactEmail"></label> Email
											</td>
											<td>
												<input type="radio" name="contactPreference" id="preferedWayOfContactCall" value="preferedWayOfContactCall" class="regular-radio" >
												<label for="preferedWayOfContactCall"></label> Call
											</td>
											<td>
												<input type="radio" name="contactPreference" checked id="preferedWayOfContactAny" value="preferedWayOfContactAny" class="regular-radio" > 
												<label for="preferedWayOfContactAny"></label> I don't mine.
											</td>
										</tr>
										<tr>
											<td width="250px">Your Prefered Carpooler:</td>
											<td>
												<input type="radio" name="genderPreference" id="preferedTravelGenderMale" value="m" class="regular-radio" >
												<label for="preferedTravelGenderMale"></label> Male
											</td>
											<td>
												<input type="radio" name="genderPreference" id="preferedTravelGenderFemale" value="f" class="regular-radio" >
												<label for="preferedTravelGenderFemale"></label> Female
											</td>
											<td>
												<input type="radio" name="genderPreference" checked id="preferedTravelGenderAny" value="a" class="regular-radio" > 
												<label for="preferedTravelGenderAny"></label> I don't mine.
											</td>
										</tr>
										<tr>
											<td width="300px">What you would like carpooler to compensate</td>
											<td>
												<input type="radio" name="compensation" id="compensationFuelSharing" value="compensationFuelSharing" class="regular-radio" onclick="compensate()">
												<label for="compensationFuelSharing"></label> Fuel Sharing
											</td>
											<td>
												<input type="radio" name="compensation" id="compensationPrice" value="compensationPrice" class="regular-radio" onclick="compensate()">
												<label for="compensationPrice"></label> Price
											</td>
											<td>
												<input type="radio" name="compensation" checked id="compensationFree" value="compensationFree" class="regular-radio" onclick="compensate()"> 
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
	
			<div id="compensationPriceDiv" style="display: none;">	
				 <center>   
					<table width="190px" style="margin: 10px 10px 10px 10px;" border="0">
						<tr>
							<td align="left" id="compensationPriceTD" width="190px">
								<center> Enter amount: <input type="text" name="compensationAmount" id="compensationAmount" style="width: 190px;" class="ui-timepicker-hour"/> </center>
							</td>
						</tr>	
					</table>
		   		</center>
		   	</div>			
    </center>
  </fieldset>