  <fieldset>   
  	<legend style="width:196px;height:64px;background-image: url(../../../resources/common/images/misc/r2l.png); margin-left:65px;"  >
	</legend>
	  <center>   
	
		  <table width="798" border="0" style="margin: 20px 10px 10px 10px;" >
			  	<tr>
			  		<td>
				  		
						<div id="holder">
					 		<div>
								<div class="button-holder">
									You would like to carpool both your way? &nbsp;&nbsp;&nbsp;
									
									<input type="radio" name="carpoolOneWayOrTwoWay" checked id="carpoolOneWayTwoOptionYes" value="true" class="regular-radio" onclick="setShemp()">
									<label for="carpoolOneWayTwoOptionYes"></label>Yes
									
									<input type="radio" name="carpoolOneWayOrTwoWay" id="carpoolOneWayTwoOptionNo" value="false" class="regular-radio" onclick="setShemp()">
									<label for="carpoolOneWayTwoOptionNo"></label>No

								</div>
							</div>
						</div>
							 
			    	</td>
			  	</tr>
		  </table>
		
		<div id="returnRouteSameOptionDiv"  style="display: visible;">
		  <table width="798" border="0">
			  	<tr>
			  		<td>
						<div id="holder">
					 		<div>
								<div class="button-holder">
									Is your return route same? &nbsp;&nbsp;&nbsp;
									<input type="radio" name="carpoolReturnRouteSameOrNot" checked id="returnRouteSameOptionYes" value="yes" class="regular-radio" onclick="returnRouteChoice()">
									<label for="returnRouteSameOptionYes"></label>Yes
									
									<input type="radio" name="carpoolReturnRouteSameOrNot" id="returnRouteSameOptionNo" value="no" class="regular-radio" onclick="returnRouteChoice()">
									<label for="returnRouteSameOptionNo"></label>No

								</div>
							</div>
						</div>
			    	</td>
			  	</tr>
			  	

			  	
			  	</table>


			 				
				
		  </table>
		</div>
		  
			<div id="officeToHomeRouteDiv" style="display: none;">	
				  <center>   
				  <table width="798" border="0">
					  	<tr>
						    <td height="41" colspan="2" align="left" valign="bottom">From</td>
						    <td width="146" colspan="2" align="left" valign="bottom">To</td>
					  	</tr>
					  	<tr>
					    	<td height="21" colspan="2" valign="top" id="officeToHomeFrom_td_id">
					    		
								<form:input path="sourcePLaceReturn" id="officeToHomeFrom" />
							    <script type="text/javascript">
						        		$(document).ready(function() {
						            	$("#officeToHomeFrom").tokenInput("searchPlaces",{
						                tokenLimit: 1			
									});
						        });
						        </script>
					    	</td>
					    	<td colspan="2" align="right" valign="top" id="officeToHomeTo_td_id">
					    		
					    		<form:input path="destinationPLaceReturn" id="officeToHomeTo" />
							    <script type="text/javascript">
						        		$(document).ready(function() {
						            	$("#officeToHomeTo").tokenInput("searchPlaces",{
						                tokenLimit: 1			
									});
						        });
						        </script>
					    	</td>
					  	</tr>
				  </table>
				  
				
					<table width="400" style="margin: 10px 10px 20px 10px;" border="0">
						  <tr align="center" width="400px">
				
							    <td height="118" colspan="2" id="officeToHomeInBetPlaces_td_id" width="400px">
							    	In Between Places
							    	
							    	<form:input path="inBetweenPLaceReturn" id="officeToHomeInBetweenPlaces" />
							        <script type="text/javascript">
							        $(document).ready(function() {
							            $("#officeToHomeInBetweenPlaces").tokenInput("searchPlaces", {
							                theme: "facebook",
							                preventDuplicates: true
							            });
							        });
							        </script>
							    </td>
				
						  </tr>
				
					</table>
						
			   </center>
		    </div>
		    
		    				
		  		<!-- New TimePicker start -->
				<div id="leavingDestinationPlaceDiv">				
					<table style="margin: 10px 10px 0px 10px;" border="0" width="200px">
						<tr align="center">
					
						   <td colspan="2">
								Leaving Destination Place at :
							</td>
							
						</tr>
					</table>
					
					<table border="0" width="80px">
						<tr align="center">
			
					 	   <td height="28" colspan="2" id="sourceLeavingTimeOtherWay">			        
						       <form:input path="sourceLeavingTimeReturn" id="timepicker.[2]" cssStyle="width: 70px;" readonly="readonly" cssClass="ui-timepicker-hour" autocomplete="off"/> 
						        <script type="text/javascript">
						            $(document).ready(function() {
						                $('#timepicker\\.\\[2\\]').timepicker();
						            });
						  	    </script>
							</td>
			
						</tr>
					</table>
				</div>
				<!-- New TimePicker end -->
	  
	  			  	<div id="returningDateTR" style="display: none;">
					<table border="0">
				  	<tr>
						<td align="left">
							Journey Returning Date:
						</td>
					</tr>
				  	
				  	<tr>
						<td align="left" id="datepickerDestToSourceDiv">
							<form:input path="dateIfCarpoolingOnDatesReturn" id="datepicker-example4Copy" cssStyle="width: 170px;" cssClass="ui-timepicker-hour"/>
						</td>
					</tr>
					</table>
			  	</div>
    </center>
  </fieldset>