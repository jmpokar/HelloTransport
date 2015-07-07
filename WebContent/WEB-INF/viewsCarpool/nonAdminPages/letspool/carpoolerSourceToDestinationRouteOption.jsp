  <fieldset>   
  	<legend style="width:196px;height:64px;background-image: url(../../../resources/common/images/misc/l2r.png); margin-left:65px;"  id="myLegend">
	</legend>
  <center>   

		 <table width="798" border="0">
		  	<tr>
			    <td height="41" colspan="2" align="left" valign="bottom">From</td>
			    <td width="146" colspan="2" align="left" valign="bottom">To</td>
		  	</tr>
		  	<tr>
		    	<td height="21" colspan="2" valign="top" id="homeToOfficeFrom_td_id">
		    	
		    		<form:input path="sourcePLace" id="homeToOfficeFromCarpool1" />
		    		
				    <script type="text/javascript">
			        		$(document).ready(function() {
				            	$("#homeToOfficeFromCarpool1").tokenInput("searchPlaces",{
					                tokenLimit: 1,
					                preventDuplicates: true
								});
			        		});
			        </script>
		    	</td>
		    	<td colspan="2" align="left" valign="top" id="homeToOfficeTo_td_id">
		    	
		    		<form:input path="destinationPLace" id="homeToOfficeTo" />
				    <script type="text/javascript">
			        		$(document).ready(function() {
				            	$("#homeToOfficeTo").tokenInput("searchPlaces",{
					                tokenLimit: 1,
					                preventDuplicates: true
								});
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
		<div id="specificDateSelectionDiv" style="display: none;">
			<table border="0">
				<tr>
					<td>
						Journey Start Date:
					</td>	
				</tr>
			</table>
			<table border="0">
				<tr>
					<td align="left" id="datepickerSourceToDestDiv">
						<input name="dateIfCarpoolingOnDates" id="datepicker-example4" style="width: 170px;" class="ui-timepicker-hour"/>
					</td>
				</tr>
			</table>
		</div>
		
    </center>
    </fieldset>
    