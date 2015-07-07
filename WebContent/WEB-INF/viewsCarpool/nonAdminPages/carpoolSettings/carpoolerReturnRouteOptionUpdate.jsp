  <fieldset>   
  	<legend style="width:196px;height:64px;background-image: url(../images/letspoolit/r2l.png); margin-left:65px;"  >
	</legend>
	  <center>
			<table id="wantToBeHiddenFromRouteReturnTableDIV" width="798" border="0" style="margin: 20px 10px 10px 10px; display: <c:if test="${isTwoWayRouteCarpooling eq 'oneWay'}">none;</c:if>  ">
				<tr>
					<td width="798">
	               		<div id="holder">
					 		<div>
								<div class="button-holder">
									Do you wish to hide yourself as Carpooler from this route:
									
									<input type="radio" name="wantToBeHiddenFromRouteReturn" id="carpoolHidingOptionToRouteYes" value="yes" class="regular-radio">
									<label for="carpoolHidingOptionToRouteYes"></label>Yes
									
									<input type="radio" name="wantToBeHiddenFromRouteReturn" id="carpoolHidingOptionToRouteNo" checked value="no" class="regular-radio">
									<label for="carpoolHidingOptionToRouteNo"></label>No
	
								</div>
							</div>
						</div>		
					</td>
				</tr>
			</table>
		
		  <table width="798" border="0" style="margin: 20px 10px 10px 10px;" >
			  	<tr>
			  		<td>
				  		
						<div id="holder">
					 		<div>
								<div class="button-holder">
									You would like to carpool both your way? &nbsp;&nbsp;&nbsp;
									
									<input type="radio" name="carpoolOneWayOrTwoWay" id="carpoolOneWayTwoOptionYes" 
									 	<c:if test="${Carpooler.carpoolOneWayOrTwoWay eq 'twoWay'}">checked</c:if> 
									 	value="true" class="regular-radio" onclick="setShemp()">
									<label for="carpoolOneWayTwoOptionYes"></label>Yes
									
									<input type="radio" name="carpoolOneWayOrTwoWay" id="carpoolOneWayTwoOptionNo" 
										<c:if test="${Carpooler.carpoolOneWayOrTwoWay eq 'oneWay'}">checked</c:if>
										value="false" class="regular-radio" onclick="setShemp()">
									<label for="carpoolOneWayTwoOptionNo"></label>No

								</div>
							</div>
						</div>
							 
			    	</td>
			  	</tr>
		  </table>
		
		<div id="returnRouteSameOptionDiv"  style="display: <c:if test="${isTwoWayRouteCarpooling eq 'oneWay'}">none;</c:if>">
		  <table width="798" border="0">
			  	<tr>
			  		<td>
						<div id="holder">
					 		<div>
								<div class="button-holder">
									Is your return route same? &nbsp;&nbsp;&nbsp;
									<input type="radio" name="carpoolReturnRouteSameOrNot" id="returnRouteSameOptionYes" 
										<c:if test="${(isTwoWayRouteCarpooling eq 'twoWay' && isReturnRouteSame eq true) || (isTwoWayRouteCarpooling eq 'oneWay')}">checked</c:if>
										value="yes" class="regular-radio" onclick="returnRouteChoice()">
									<label for="returnRouteSameOptionYes"></label>Yes
									
									<input type="radio" name="carpoolReturnRouteSameOrNot" id="returnRouteSameOptionNo" 
										<c:if test="${isTwoWayRouteCarpooling eq 'oneWay' && isReturnRouteSame eq false}">checked</c:if>	
										value="no" class="regular-radio" onclick="returnRouteChoice()">
									<label for="returnRouteSameOptionNo"></label>No

								</div>
							</div>
						</div>
			    	</td>
			  	</tr>

			  	</table>
		  		
		  </table>
		</div>
		  
		  
			<div id="officeToHomeRouteDiv" style="display: <c:if test="${(isReturnRouteSame eq true)}">none;</c:if> ">	
				  <center>   
				  	<c:if test="${Carpooler.sourcePLaceReturn ne null}">
		    			<input type="hidden" name="destToSourcePLaceId" id="destToSourcePLaceId" value="jkj" />
		    		</c:if>
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
						            	<c:if test="${isTwoWayRouteCarpooling eq 'twoWay'}"> $("#officeToHomeFrom").tokenInput("add", {id: '${ Carpooler.sourcePLaceReturn }', name: '${ Carpooler.sourcePLaceReturn }'}); </c:if>	
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
						            	<c:if test="${isTwoWayRouteCarpooling eq 'twoWay'}">  $("#officeToHomeTo").tokenInput("add", {id: '${ Carpooler.destinationPLaceReturn }', name: '${ Carpooler.destinationPLaceReturn }'}); </c:if>	
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
							          
							            <c:if test="${isTwoWayRouteCarpooling eq 'twoWay'}">
							            
							            var b = "${ Carpooler.inBetweenPLaceReturn }".split(" --> "); // Delimiter is a string
							            for (var i = 0; i < b.length; i++)
							            {
							            	$("#officeToHomeInBetweenPlaces").tokenInput("add", {id: ''+b[i], name: ''+b[i] });
							            }
							            
							            </c:if>
							            
							        });
							        </script>
							    </td>
				
						  </tr>
				
					</table>
						
			   </center>
		    </div>


		  		<!-- New TimePicker start -->
				<div id="leavingDestinationPlaceDiv" style="display: <c:if test="${isTwoWayRouteCarpooling eq 'oneWay'}">none;</c:if>">				
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
						      	<input name="sourceLeavingTimeReturn" id="timepicker.[2]" style="width: 70px;" readonly="readonly" value="${Carpooler.sourceLeavingTimeReturn }" class="ui-timepicker-hour" autocomplete="off"/> 
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
				
	  			  	<div id="returningDateTR" style="display: <c:if test="${ Carpooler.dateIfCarpoolingOnDatesReturn eq null}">none;</c:if>">
					<table>
				  	<tr>
						<td align="left">
							Journey Returning Date:
						</td>
					</tr>
				  	
				  	<tr>
						<td align="left" id="datepickerDestToSourceDiv">
						
						<c:set var="final" value="" />
								
						<c:choose> 
							<c:when test="${Carpooler.carpoolOneWayOrTwoWay eq 'oneWay'}">
							</c:when> 
							<c:otherwise>
								<c:set var="year" value="${fn:substring(Carpooler.dateIfCarpoolingOnDatesReturn, 0, 4)}" />
								<c:set var="month" value="${fn:substring(Carpooler.dateIfCarpoolingOnDatesReturn, 5, 7)}" />
								<c:set var="day" value="${fn:substring(Carpooler.dateIfCarpoolingOnDatesReturn, 8, 10)}" />
								<c:set var="sep" value="/" />
								<c:set var="final" value="${year}${sep}${month}${sep}${day}" />
							</c:otherwise>
						</c:choose>
						
						<input name="dateIfCarpoolingOnDatesReturn" id="datepicker-example4Copy" style="width: 170px;" class="ui-timepicker-hour" value="${final}"/>
						</td>
					</tr>
					</table>
			  	</div>
    </center>
  </fieldset>