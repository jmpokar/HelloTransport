  <fieldset>   
    <legend style="height:64px;width:196px;background-image: url(../../../resources/common/images/misc/cal.png); margin-left:65px;"  >
	</legend>
    
	  <center>   
		  <table width="798" border="0">
			  	<tr>
			  		<td>
				  		
						<div id="holder">
					 		
								<div class="button-holder">
									I would like to Carpool &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
									<input type="radio" name="carpoolingWhen" id="carpoolOnSpecificDays" checked value="carpoolOnSpecificDays" class="regular-radio" onclick="carpoolProvidingOnCheck()">
									<label for="carpoolOnSpecificDays"></label>Always on specific days.
									
									<input type="radio" name="carpoolingWhen" id="carpoolOnSpecificDates" value="carpoolOnSpecificDates" class="regular-radio" onclick="carpoolProvidingOnCheck()">
									<label for="carpoolOnSpecificDates"></label>On specific dates.
								</div>
							
						</div>
							 
			    	</td>
			  	</tr>
			  	
		  </table>
		
		<div id="daysSelectionDiv" >
				<p id="daysSelectionP" style="width: 376px; height: 28px; padding: 0px 20px 2px 2px;">
					<select name="daysIfCarpoolingOnDays" multiple="multiple" style="width:400px; background-color: yellow;"  id="weekDays123">
						<option value="Mon" selected="selected">Mon</option>
						<option value="Tue" selected="selected">Tue</option>
						<option value="Wed" selected="selected">Wed</option>
						<option value="Thu" selected="selected">Thu</option>
						<option value="Fri" selected="selected">Fri</option>
						<option value="Sat">Sat</option>
						<option value="Sun">Sun</option>
					</select>
				</p>
		</div>
		
    </center>
  </fieldset>