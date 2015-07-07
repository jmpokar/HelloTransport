<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		
		<!-- JQUERY -->
		<%@ include file="../../../includes/transport/jquery.jsp" %>
 	
		<!-- BOOOTSTRAP -->
		<%@ include file="../../../includes/transport/bootstrap-css.jsp" %>
		
		<!-- MENUBAR STARTED -->
		<%@ include file="../../../includes/transport/menubar.jsp" %>
		<!-- MENUBAR ENDED -->	

		<!-- CSS USED FOR STYLING HOME PAGE Start -->
			<!-- <link rel="stylesheet" type="text/css" href="../../../css/body.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->		
	
		<!-- CSS USED FOR STYLING HOME PAGE Start -->
			<!-- <link rel="stylesheet" type="text/css" href="../../css/footer.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->
	
		<!-- CSS USED FOR STYLING HOME PAGE Start -->
			<!-- <link rel="stylesheet" type="text/css" href="../../css/stylingResultPage.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->
	
		<!-- CSS FOR HEADER MENU START -->	
	  		<!-- <link rel="stylesheet" type="text/css" href="../../css/header_menu_css.css" media="screen" /> -->
		<!-- CSS FOR HEADER MENU END -->
				
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
		

		<!-- TABLE START -->
		<script type='text/javascript' src='../../resources/carpool/table/scripts/jquery.dataTables.min.js'></script>
		<script type='text/javascript' src='../../resources/carpool/table/scripts/jquery.dataTables.columnFilter.js'></script>
		<script type='text/javascript' src='../../resources/carpool/table/scripts/jquery.dataTables.pagination.js'></script>
		<link type='text/css' href='../../resources/carpool/table/css/demo_table_jui.css' rel='stylesheet'/>		
		<style type="text/css">
		@import url("../../resources/carpool/table/css/custom/blitzer/jquery.ui.all.css");
			#dataTable {padding: 0;margin:0;width:100%;}
			#dataTable_wrapper{width:100%;}
			#dataTable_wrapper th {cursor:pointer} 
			#dataTable_wrapper tr.odd {color:#666666; background-color:#ffffff}
			#dataTable_wrapper tr.odd:hover {color:#ffffff; background-color:#b2e4e7}
			#dataTable_wrapper tr.odd td.sorting_1 {color:#666666; background-color:#ffffff; line-height:25px}
			#dataTable_wrapper tr.odd:hover td.sorting_1 {color:#ffffff; background-color:#b2e4e7}
			#dataTable_wrapper tr.even {color:#666666; background-color:#f2f2f2}
			#dataTable_wrapper tr.even:hover, tr.even td.highlighted{color:#ffffff; background-color:#b2e4e7}
			#dataTable_wrapper tr.even td.sorting_1 {color:#666666; background-color:#f2f2f2; line-height:25px}
			#dataTable_wrapper tr.even:hover td.sorting_1 {color:#ffffff; background-color:#b2e4e7}
		</style>
		<!-- TABLE END -->

	
		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->	
	
		<!-- TOOL TIP START -->
		<!-- <link rel="stylesheet" href="../../resources/tooltip/tooltip.css" /> 
	    <script src="../../resources/tooltip/tooltip.js"></script>
	    <style>
	    label {
	        display: inline-block;
	        width: 5em;
	    }
	    </style>
	    <script>
	    $(function() {
	        $( document ).tooltip({
	            track: true
	        });
	    });
	    </script> -->
		<!-- TOOL TIP END -->
		
	</head>
	<body id="home">
	
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>
		<div id="templatemo_wrapper">
	
		    <%@ include file="../../../includes/common/header.jsp" %>
		    <%@ include file="../../../includes/transport/userMenu.jsp" %>
    
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
		    <div id="templatemo_main">

				<!-- SEARCH BAR AND LETS POOL IT BUTTON START -->
				<%@include file="searchBarAndSaveSearchButton.jsp" %>
				<!-- SEARCH BAR AND LETS POOL IT BUTTON END -->
				
				<%! int searchResult=0; %>  
			    
			    <script type="text/javascript">
				$(document).ready(function() {
					oTable = $('#dataTable').dataTable({
					"bJQueryUI": true,
					"bScrollCollapse": false,
					"sScrollY": "420px",
					"bAutoWidth": true,
					"bPaginate": true,
					"sPaginationType": "full_numbers", //full_numbers,two_button
					"bStateSave": false,
					"bInfo": true,
					"bFilter": true,
					"iDisplayLength": 6,
					"bLengthChange": true,
					"aLengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "All"]]
					});
				} );
				</script>

			 	<table cellpadding="0" cellspacing="0" border="0" id="dataTable">
					<thead>
						<tr>
							<th width="80px">Photo</th>
							<th width="80px">Name</th>
							<th width="180px">From</th>
							<th width="180px">To</th>
						    <th width="80px">Timing</th>
							<th width="80px">Condition</th>
							<th width="80px">Availability</th>
							<th width="80px">Contact</th>
						</tr>
					</thead>		
					<tbody>
						<!--Loop start, you could use a repeat region here-->
						<jsp:useBean id="today" class="java.util.Date" scope="page" />
						<fmt:formatDate var="todaysDate" value="${today}" pattern="yyyy-MM-dd" />
						<c:choose>
					       <c:when test="${listOfExactMatchCarpooler ne null && fn:length(listOfExactMatchCarpooler) gt 0}">
								<% searchResult=1; %>
								<c:forEach var="carpooler" items="${listOfExactMatchCarpooler}">
									<c:forEach var="data" items="${carpooler.listOfSourceToDestinationDetails}">
										<c:if test="${ (data.carpoolDate eq null)  or (data.carpoolDate ne null and data.carpoolDate ge todaysDate)}">						
											<tr>										
												<td align="center" height="70px">											  	
												  <img class="image2" height="50px" width="50px" src="../../../resources/common/images/profilePicture/${carpooler.photoOfCarpooler}" />
												</td>
												<td align="center"> <a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"> ${carpooler.nameOfCarpooler} </a></td>
												<td align="center"> <a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"> ${data.sourcePlace} </a></td>
												<td align="center"> <a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"> ${data.destinationPlace} </a></td>
											    <td align="center"> <a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"> ${data.sourceLeavingTime} </a></td> 
												<td align="center"> 
													<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"> 
														<c:if test="${carpooler.carpoolerPreference.compensation eq 'compensationFree'}">
															<img class="image2" height="30px" width="40px" src="../../../resources/common/images/misc/free1.png" />								       								
						       							</c:if>
						       							<c:if test="${carpooler.carpoolerPreference.compensation eq 'compensationFuelSharing'}">
															<img class="image2" height="30px" width="30px" src="../../images/misc/fuel.png" />								       								
						       							</c:if>	
						       							
						       							<c:if test="${fn:containsIgnoreCase(carpooler.carpoolerPreference.compensation, 'compensationPrice')}">
															<img class="image2" height="25px" width="25px" src="../../../images/misc/rupee.png" />								       								
						       							</c:if>
												 	</a>
											 	</td>
												<td align="center"> 
													<a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"> 
														<c:choose>
							       							<c:when test="${data.availability eq true}">
																<img class="image2" height="30px" width="30px" src="../../../resources/common/images/misc/available.png" />								       								
							       							</c:when>
							       							<c:otherwise>
																<img class="image2" height="20px" width="20px" src="../../images/misc/not_available1.png" />
							       							</c:otherwise>
							       						</c:choose>
													</a>
												</td>
												<td align="center"> <a href="carpoolerDetails.jsp?id=${carpooler.carpoolerId}"> Details </a></td>
											</tr>
										</c:if>
									</c:forEach>
								</c:forEach>	
						  </c:when>
					      <c:otherwise>				
					      </c:otherwise>
						</c:choose>
					</tbody>
	 			</table>
				<div id="content">	
					<center>
						<table border="0">
							<tr>
								<td><img class="image2" height="30px" width="40px" src="../../../resources/common/images/misc/free1.png" /></td>
								<td>Free</td>
								<td width="20px"></td>
								
								<td><img class="image2" height="20px" width="20px" src="../../../resources/carpool/images/misc/rupee.png" /> </td>
								<td>Money</td>
								<td width="20px"></td>
								
								<td><img class="image2" height="25px" width="25px" src="../../../resources/carpool/images/misc/fuel.png" /></td>
								<td>Fuel Sharing</td>
								<td width="20px"></td>
							</tr>
						</table>
					</center>
				</div>
				<!-- end #sidebar -->
				<div style="clear: both;">&nbsp;</div>
			</div>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>
