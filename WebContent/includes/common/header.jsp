	<div id="templatemo_header">
    	 <div id="site_title">
    	 
	    	 <c:if test="${fn:contains(pageContext.request.requestURI, 'admin')}">
			    <img src="${pageContext.request.contextPath}/resources/common/images/logo/activeCorporate.png" alt="" /> 
			</c:if>
			
			<c:if test="${not fn:contains(pageContext.request.requestURI, 'admin')}">
			    <img src="${pageContext.request.contextPath}/resources/common/images/logo/activeCorporate.png" alt="" />  
			</c:if>
	    	 	
    	</div>
        
        <div id="header_right_transport">
            <div id="templatemo_search">
                  
	                  <!-- SEARCH BOX START -->
		               <form action="${pageContext.request.contextPath}/jsp/transport/searchMatchingRoutes" method="get">
						<table border="0">
							<tr>
						  		<td colspan="2" align="right">
						  		</td>
						  	</tr>
							<tr>
						  		<td align="right" colspan="2">
						  			
						  		</td>
						  	</tr>
							<tr>
						  		<td style="width: 50px;">
						  			Search Bus which pass by your place:
						  		</td>
						  		<td >						  		
						  		</td>
						  	</tr>
						  	<tr>	
						    	<td>
						    		<input type="text" name="searchTextFieldFrom" id="homeToOfficeFrom" />
							    	<script type="text/javascript">
								    	$(document).ready(function() {
						            			$("#homeToOfficeFrom").tokenInput("searchPlaces",{
						            	    	tokenLimit: 1			
											});
							        	});
						        	</script>
						    	</td>
						    	<td>
						    	
						    		<c:if test="${fn:contains(pageContext.request.requestURI, 'admin')}">
									   <input type="image" name="submit" src="${pageContext.request.contextPath}/resources/common/images/misc/search.png" height="32px" width="30px"/>
									</c:if>
									
									<c:if test="${not fn:contains(pageContext.request.requestURI, 'admin')}">
									   <input type="image" name="submit" src="${pageContext.request.contextPath}/resources/common/images/misc/search.png" height="32px" width="30px"/>
									</c:if>
									  	
						    	</td>
						  	</tr>
						</table>
					</form>
					<!-- SEARCH BOX END -->
            </div>
         </div> <!-- END -->
       
         <div id="header_right_carpool" style="display: none;">
            <div id="templatemo_search">
                  
                  <form action="result.jsp" method="get">


			<div style="width:100%;margin10;padding:0;border:none;">
			
				<div style="float:left;width:85%; border: 9px; border-color: gray;">
			 	  <table border="0" style="width: 100%">
			 	  	<tr height="10px">
			 	  		<td colspan="3" align="center"></td>
			 	  	</tr>
				  	<tr>
				    	<td height="41" valign="top">From</td>
				    	<td valign="top">
				    		<input type="text" name="searchTextFieldFrom" id="homeToOfficeFromCarpool" />
						    <script type="text/javascript">
						    $(document).ready(function() {
					            	$("#homeToOfficeFromCarpool").tokenInput("searchPlaces",{
					                tokenLimit: 1			
								});
					        });
					        </script>
				    	</td>
				    	<td rowspan="2" valign="top"><input type="image" name="submit" src="${pageContext.request.contextPath}/resources/common/images/misc/search.png" height="32px" width="30px"/></td>
				    </tr>
				    <tr>
				    	
				    	<td height="41" valign="top">To</td>
				    	<td valign="top">
				    		<input type="text" name="searchTextFieldTo" id="homeToOfficeToCarpool" />
						    <script type="text/javascript">
					        		$(document).ready(function() {
					            	$("#homeToOfficeToCarpool").tokenInput("searchPlaces",{
					                tokenLimit: 1			
								});
					        });
					        </script>
				    	</td>
				    </tr>
				 </table>
				</div>
				
			</div>
				  
			</form>
            </div>
         </div> <!-- END -->
    </div> <!-- END of header -->
