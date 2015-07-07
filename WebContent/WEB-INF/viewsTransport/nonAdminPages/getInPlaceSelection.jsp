<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@ include file="../../../includes/transport/titleAndMeta.jsp" %>
			
		<!-- JQUERY -->
		<%@ include file="../../../includes/transport/jquery.jsp" %>
 	
		<!-- BOOOTSTRAP -->
		<%@ include file="../../../includes/transport/bootstrap-css.jsp" %>
	
		<!-- MENUBAR STARTED -->
		<%@ include file="../../../includes/transport/menubar.jsp" %>
		<!-- MENUBAR ENDED -->	
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->

		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- BUS FARE DIALOG START -->
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
		
		<!-- STYLING TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLING TABLE END -->

		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
				
		<script type="text/javascript">
			$(function() {
				$('#buttons').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 
			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: $(window).width()-50, 
				        height: $(window).height()-50 
			        });
				});
			});
	
			$(function() {	
				$('#buttons1').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        // find out clicked id and open dialog
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 
			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: $(window).width()-50, 
				        height: $(window).height()-50 				        
			        });
			    });
			});
		</script>

<!-- 		<style type="text/css">
			.slidingDiv {
			    height:300px;
			    padding:20px;
			    margin-top:10px;
			}			 
			.show_hide {
			    display:none;
			}			
		</style>
		
		<script type="text/javascript">
			function closeDiv(){
				var div = document.getElementById('searchResults');
				div.style.display='none';
			}
		</script>

		<script type="text/javascript">
			$(document).ready(function(){
		        $(".slidingDiv").hide();
		        $(".show_hide").show();			 
			    $('.show_hide').click(function(){
			    	$(".slidingDiv").slideToggle();			    	 	
			    	var str=$(".show_hide").html();        
			        if(str == "Show Passenger Details"){
			        	$(".show_hide").text("Hide Passenger Details");
			        }
			        if(str == "Hide Passenger Details"){
			        	$(".show_hide").text("Show Passenger Details");
			        }
		    	});			 
			});
		</script>
 -->		
		
		<!-- FOR DROPDOWN START -->
<!--   		<style type="text/css"> 
		    ol li {list-style: decimal outside;}
		    ul li { list-style: disc; margin-left: 1em; }
		    ol li { margin-left: 1.25em; }
		    
		    div.side-by-side { width: 100%; margin-bottom: 1em; }
		    div.side-by-side > div { float: left; width: 50%; }
		    div.side-by-side > div > em { margin-bottom: 10px; display: block; }
		    
		    .clearfix:after {
		      content: "\0020";
		      display: block;
		      height: 0;
		      clear: both;
		      overflow: hidden;
		      visibility: hidden;
		    }
  		</style> -->
  		<link rel="stylesheet" href="../resources/transport/dropdown-charts/chosen.css" />  
  		<!-- FOR DROPDOWN END -->
  		
  		<!-- PLACING COMPONENTS WITHING DIV AT CENTER START -->
		<style type="text/css">
		.centre{
			width: 500px;	
		  	display: block;
		 	margin-left: auto;
		  	margin-right: auto;
		}
		</style>
		<!-- PLACING COMPONENTS WITHING DIV AT CENTER END -->
  		
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
		
	</head>
	<body id="home">
		
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>
		<div id="templatemo_wrapper">
    
	    	<%@ include file="../../../includes/transport/busFareDialogBody.jsp" %>
		    <%@ include file="../../../includes/common/header.jsp" %>
		    <%@ include file="../../../includes/transport/userMenu.jsp" %>
    
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
	
		    <div id="templatemo_main">
        
	        	<div id="content" style="width: 96%;">
	        		<h2>Transport Team</h2>
					
		        	<c:if test="${ (routeDetailsUpdated ne null)}">		
						<div class="centre" style="height: 300px;">
							<form action="saveBusPassRequest" method="get">
								<table width="471px" border="0">
									<tr style="height: 40px;">
								    	<td colspan="4" align="center"><em><b>Avaya Monthly Bus Pass</b></em></td>
								  	</tr>
								  	<tr style="height: 30px;">
								  		<td colspan="4" align="center" valign="top"><hr style="width: 100%;"></hr></td>
								  	</tr>
								  	<tr style="height: 30px;">
								    	<td colspan="2" rowspan="4" valign="top"><img src="../resources/common/images/misc/default.png" width="100" height="100" /></td>
								    	<td width="105px"><em>Name:</em></td>
								    	<td width="130px"><%= request.getUserPrincipal().getName() %></td>
								  	</tr>
								  <!-- 
								  	<tr style="height: 30px;">
								    	<td>Emp No:</td>
								    	<td>2955</td>
								  	</tr> 
								  -->
								  	<tr style="height: 30px;">
								    	<td><em>Route No:</em></td>
								    	<td>
								    		${ routeDetailsUpdated.route.routeName }
									    	<input type="hidden" value="${ routeDetailsUpdated.route.routeName }" name="routeName"></input>
								   		</td>
								  	</tr>
									<tr style="height: 30px;">
								    	<td><em>Get In Place</em></td>
									    <td>
											<select name="getInPlace" data-placeholder="Select Place you will get in ..." style="width: 220px;" class="chzn-select" tabindex="6">
												<option value=""></option>
												<c:choose>					
													<c:when test="${routeDetailsUpdated.listOfRoutePlaceMappingUpdated ne null && fn:length(routeDetailsUpdated.listOfRoutePlaceMappingUpdated) gt 0}">
								 						<c:forEach var="place" items="${routeDetailsUpdated.listOfRoutePlaceMappingUpdated}">
															<c:if test="${ place.place.placeId ne 6}">													
																<option value="${ place.place.placeName }">${ place.place.placeName }</option>
															</c:if>
														</c:forEach>
													</c:when>
													<c:otherwise>
														No Stops Found
													</c:otherwise>	
												</c:choose>
											</select> 
										</td>
								  	</tr>
								  	<tr style="height: 30px;">
								    	<td><em>Buss Pass No:</em></td>
								    	<td>******</td>
								  	</tr>
								  	<tr style="height: 80px;">
								    	<td colspan="4" align="center">
								    		<input type="submit" name="submit" class="myButton" height="32px" width="30px" value="Submit Request"/>
								    	</td>
								  	</tr>
								</table>
							</form>
						</div>
					</c:if>
			
        		</div> <!-- END of content -->
        		
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->

    		<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
		
		<!-- DROPDOWN START -->
	  	<script src="../resources/transport/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
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
		
	</body>
</html>