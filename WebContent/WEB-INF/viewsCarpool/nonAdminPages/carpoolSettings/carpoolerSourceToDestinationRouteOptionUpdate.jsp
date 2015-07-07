  <fieldset>   
  	<legend style="width:196px;height:64px;background-image: url(../../images/letspoolit/l2r.png); margin-left:65px;"  id="myLegend">
	</legend>
  <center>   

		 <table width="798" border="0">
			
			
			<tr>
			
				<td colspan="3">
        
               		<div id="holder">
				 		<div>
							<div class="button-holder">
								Do you wish to hide yourself as Carpooler from this route:
								
								<input type="radio" name="wantToBeHiddenFromRoute" id="carpoolHidingOptionFromRouteYes" value="yes" class="regular-radio">
								<label for="carpoolHidingOptionFromRouteYes"></label>Yes
								
								<input type="radio" name="wantToBeHiddenFromRoute" id="carpoolHidingOptionFromRouteNo" checked value="no" class="regular-radio">
								<label for="carpoolHidingOptionFromRouteNo"></label>No

							</div>
						</div>
					</div>
		
				</td>
				
			</tr>
		  	<tr>
			    <td height="41" colspan="2" align="left" valign="bottom">From</td>
			    <td width="146" colspan="2" align="left" valign="bottom">To</td>
		  	</tr>
		  	<tr>
		    	<td height="21" colspan="2" valign="top" id="homeToOfficeFrom_td_id">
		    		
		    		<c:if test="${Carpooler.sourcePLace ne null}">
		    			<input type="hidden" name="sourceToDestPLaceId" id="sourceToDestPLaceId" value="jjj" />
		    		</c:if>
		    		<form:input path="sourcePLace" id="homeToOfficeFrom" value="${ Carpooler.sourcePLace }" />
		    		
				    <script type="text/javascript">
			       	$(document).ready(function() {
			            	$("#homeToOfficeFrom").tokenInput("searchPlaces",{
			                tokenLimit: 1
						});
			            $("#homeToOfficeFrom").tokenInput("add", {id: '${ Carpooler.sourcePLace }', name: '${ Carpooler.sourcePLace }'});
			        });
			        </script>
		    	</td>
		    	<td colspan="2" align="right" valign="top" id="homeToOfficeTo_td_id">
		    	
		    		<form:input path="destinationPLace" id="homeToOfficeTo" cssStyle="text-align: right;" value="${ Carpooler.destinationPLace }" />
				    <script type="text/javascript">
			        		$(document).ready(function() {
			            	$("#homeToOfficeTo").tokenInput("searchPlaces",{
			                tokenLimit: 1			
						});
			           	$("#homeToOfficeTo").tokenInput("add", {id: '${ Carpooler.destinationPLace }', name: '${ Carpooler.destinationPLace }'});	
			        });
			        </script>
		    	</td>
		  	</tr>
		 </table>
	  

		<table width="400" style="margin: 10px 10px 10px 10px;" border="0">
			  <tr align="center" width="400px">
	
				    <td height="118" colspan="2" id="homeToOfficeInBetPlaces_td_id" width="400px">
				    	In Between Places<!--  <textarea id='suggest4' rows="5"></textarea> -->
				    	
				    	<form:input path="inBetweenPLace" id="demo-input-facebook-theme" />
				        <script type="text/javascript">
				        $(document).ready(function() {
				            $("#demo-input-facebook-theme").tokenInput("searchPlaces", {
				                theme: "facebook",
				                preventDuplicates: true
				            });
				            
				            
				            var a = "${ Carpooler.inBetweenPLace }".split(" --> "); // Delimiter is a string
				            for (var i = 0; i < a.length; i++)
				            {
				            	$("#demo-input-facebook-theme").tokenInput("add", {id: ''+a[i], name: ''+a[i] });
				            }
				            
				        });
				        </script>
				    </td>
	
			  </tr>
	
		</table>

		<!-- New TimePicker start -->
		<table style="margin: 10px 10px 0px 10px;" border="0" width="200px">
			<tr align="center">
			   <td colspan="2">
					Leaving Source PLace at :
				</td>
				
			</tr>
		</table>
		
		<table border="0" width="80px">
			<tr align="center">

		 	   <td height="28" colspan="2" id="sourceLeavingTimeOneWay">
			        
			        <form:input path="sourceLeavingTime" id="timepicker.[1]" cssStyle="width: 70px;" readonly="readonly" cssClass="ui-timepicker-hour" autocomplete="off"/>
			        <script type="text/javascript">
			            $(document).ready(function() {
			                $('#timepicker\\.\\[1\\]').timepicker();
			            });
			        </script>
				</td>
			</tr>
		</table>
		<!-- New TimePicker end -->			
		<br/>
		<div id="specificDateSelectionDiv" style="display: <c:if test="${Carpooler.daysIfCarpoolingOnDays ne null}">none;</c:if>">
			<table border="0">
				<tr>
					<td>
						Journey Start Date:
					</td>	
				</tr>
			</table>
						
			<table border="0">
				<tr>
					<td align="center" id="datepickerSourceToDestDiv">
						<c:set var="year1" value="${fn:substring(Carpooler.dateIfCarpoolingOnDates, 0, 4)}" />
						<c:set var="month1" value="${fn:substring(Carpooler.dateIfCarpoolingOnDates, 5, 7)}" />
						<c:set var="day1" value="${fn:substring(Carpooler.dateIfCarpoolingOnDates, 8, 10)}" />
						<c:set var="sep1" value="/" />
						
						<jsp:useBean id="today" class="java.util.Date" scope="page" />
						<c:set var="sep11" value="${year1}${sep1}${month1}${sep1}${day1}" />
						<fmt:formatDate var="todaysDate" value="${today}" pattern="yyyy-MM-dd" />
						
						<input name="dateIfCarpoolingOnDates" id="datepicker-example4" style="width: 170px;" class="ui-timepicker-hour" value="${sep11}"/>
						
					</td>
				</tr>
				<tr style="display: <c:if test="${(Carpooler.dateIfCarpoolingOnDates ne null) and (Carpooler.dateIfCarpoolingOnDates gt todaysDate)}"> none; </c:if>">
						<td>Your Carpooling date is expired :${sep11}</td>
				</tr>
			</table>
		</div>
		
    </center>
    </fieldset>
    