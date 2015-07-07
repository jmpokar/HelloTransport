<form action="renderChart" method="get">
	<center>
		<table border="0">
					<tr>
						<td colspan="3"><em>Please choose the data and type of chart you want to see ... </em></td>
					</tr>		
 				<tr>
   				<td>
			    </td>
			    <td>				    
   					<div>
						<select name="choiceOfDataAndChart" data-placeholder="Click Me ..." style="width: 550px;" class="chzn-select" multiple tabindex="6">
							<option value=""></option>
							<optgroup label="Data you want to see in chart">
								<option value="emp-bus">Employee-Bus Data</option>
							</optgroup>
							<optgroup label="Chart Type">
								<option value="bar">Bar Chart</option>
								<option value="pie">Pie Chart</option>
							</optgroup>
						</select>
					</div>
			    </td>
			    <td>
   					<input class="myButton" type="submit" name="submit" value="submit" />
   				</td>
 				</tr>
		</table>
	</center>
</form>

<!-- DROPDOWN START -->		 
<script src="${pageContext.request.contextPath}/resources/transport/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
<script type="text/javascript"> 
	var config = {
	  '.chzn-select'           : {},
	  '.chzn-select-deselect'  : {allow_single_deselect:true},
	  '.chzn-select-no-single' : {disable_search_threshold:10},
	  '.chzn-select-no-results': {no_results_text:'Oops, nothing found!'},
	  '.chzn-select-width'     : {width:"95%"}
	}
	for (var selector in config) {
	  $(selector).chosen(config[selector]);
	}
</script>
<!-- DROPDOWN END -->