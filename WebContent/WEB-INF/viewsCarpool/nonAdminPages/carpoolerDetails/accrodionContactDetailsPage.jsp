<li id="page_5">
	<div class="text">Contact Us</div>
	<div class="cont">
		<form id="ContactForm" action="contactCarpooler.jsp" method="post">
			<input type="hidden" name="carpooler" value="${carpooler.emailIdOfCarpooler}">
			<div>
				
				<table width="100%" style="margin: 10px 10px 10px 10px;" border="0">
					<tr height="50px">
						<td width="30%">
							Mail Subject:
						</td>
						<td align="left">
							  <input id="mailSubject" name="mailSubject" style="width: 350px;" class="ui-timepicker-hour"/>
						</td>
					</tr>
					<tr>
						<td>
							 Mail Body:
						</td>	
						<td align="left">
							<textarea id="mailBody" name="mailBody" style="width: 350px; height:170px;" class="ui-timepicker-hour"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							 <a href="javascript:void(0)" id="example3337" class="myButton">Submit</a>
						</td>	
						
					</tr>
				</table>
		
			</div>
		</form>
	</div>
</li>