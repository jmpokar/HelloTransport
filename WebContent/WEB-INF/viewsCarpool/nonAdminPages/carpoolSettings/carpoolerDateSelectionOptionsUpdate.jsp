  <fieldset>   
  	<legend style="height:64px;width:196px;background-image: url(../images/letspoolit/cal.png); margin-left:65px;"  >
	</legend>
	  <center>   
	
		  <table width="798" border="0">
			  	<tr>
			  		<td>
				  		
						<div id="holder">
					 		<div>
								<div class="button-holder">
									I would like to Carpool &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
									
									<input type="radio" name="carpoolingWhen" id="carpoolOnSpecificDays" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null}">checked</c:if>
									 value="carpoolOnSpecificDays" class="regular-radio" onclick="carpoolProvidingOnCheck()">
									<label for="carpoolOnSpecificDays"></label>Always on specific days.
									
									<input type="radio" name="carpoolingWhen" id="carpoolOnSpecificDates" <c:if test="${Carpooler.daysIfCarpoolingOnDays eq null}">checked</c:if> 
									value="carpoolOnSpecificDates" class="regular-radio" onclick="carpoolProvidingOnCheck()">
									<label for="carpoolOnSpecificDates"></label>On specific dates.

								</div>
							</div>
						</div>
							 
			    	</td>
			  	</tr>
			  	
		  </table>
		
		<div id="daysSelectionDiv"  style="display: <c:if test="${Carpooler.daysIfCarpoolingOnDays eq null}">none;</c:if>">
				<p>
					<select name="daysIfCarpoolingOnDays" multiple="multiple" style="width:400px" background-color: yellow;"  id="weekDays123">
						<option value="Mon" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null &&  fn:contains(Carpooler.daysIfCarpoolingOnDays, 'Mon')}">selected="selected"</c:if>>Mon</option>
						<option value="Tue" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null &&  fn:contains(Carpooler.daysIfCarpoolingOnDays, 'Tue')}">selected="selected"</c:if>>Tue</option>
						<option value="Wed" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null &&  fn:contains(Carpooler.daysIfCarpoolingOnDays, 'Wed')}">selected="selected"</c:if>>Wed</option>
						<option value="Thu" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null &&  fn:contains(Carpooler.daysIfCarpoolingOnDays, 'Thu')}">selected="selected"</c:if>>Thu</option>
						<option value="Fri" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null &&  fn:contains(Carpooler.daysIfCarpoolingOnDays, 'Fri')}">selected="selected"</c:if>>Fri</option>
						<option value="Sat" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null &&  fn:contains(Carpooler.daysIfCarpoolingOnDays, 'Sat')}">selected="selected"</c:if>>Sat</option>
						<option value="Sun" <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null &&  fn:contains(Carpooler.daysIfCarpoolingOnDays, 'Sun')}">selected="selected"</c:if>>Sun</option>
					</select>
				</p>
		</div>
		
    </center>
  </fieldset>