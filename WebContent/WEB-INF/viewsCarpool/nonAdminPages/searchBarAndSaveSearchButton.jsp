<div id="container" style="float: center;">
	<form action="result.jsp" method="get">
	 	  <table width="100%" border="0">
		  	<tr>
			    <td width="10" height="41" colspan="2" align="left" valign="bottom">From</td>
			    <td width="10" colspan="2" align="left" valign="bottom">To</td>
			    <td width="16" colspan="2" align="left" valign="bottom"></td>
			    <td width="196" colspan="2" align="left" valign="bottom"></td>
			    
		  	</tr>
		  	<tr>
		    	<td height="61" colspan="2" valign="top">
		    		<input type="text" name="searchTextFieldFrom" id="homeToOfficeFrom1" />
				    <script type="text/javascript">
			        		$(document).ready(function() {
			            	$("#homeToOfficeFrom1").tokenInput("listInBetweenPlaces.jsp",{
			                tokenLimit: 1			
						});
			        });
			        </script>
		    	</td>
		    	<td colspan="2" align="left" valign="top">
		    		<input type="text" name="searchTextFieldTo" id="homeToOfficeTo1" />
				    <script type="text/javascript">
			        		$(document).ready(function() {
			            	$("#homeToOfficeTo1").tokenInput("listInBetweenPlaces.jsp",{
			                tokenLimit: 1			
						});
			        });
			        </script>
		    	</td>
		    	
		    	<td colspan="2" valign="top"><input type="image" name="submit" src="../../../resources/common/images/misc/search.png" height="20px" width="20px"/></td>
			    <!--  <td valign="top"><a href="letspoolit.jsp" class="classname1" title=" If you are not finding the match you are looking for then please save your search and will notify you if any carpooler get added to your Route.">Save your Search</a></td> -->
		  	</tr>
		 </table>
	</form>
</div> 