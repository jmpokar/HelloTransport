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
<%@ include file="../../resources/includes/titleAndMeta.jsp" %>
<link href="../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../resources/css/ddsmoothmenu.css" />

<!-- <script type="text/javascript" src="../resources/js/jquery.min.js"></script> -->
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../resources/js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>


		<!-- FEEDBACK PLUGIN START -->
			<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js" type="text/javascript" charset="utf-8"></script>
			<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
			<script>
			$(document).ready(function() {
			      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
			});
			</script>
			<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
		<!-- FEEDBACK PLUGIN END -->
		
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
		    <!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> -->
		    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" />
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
		
			
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/jquery-ui.min.js"></script>
		<script type="text/javascript">
		$(function(){			
			$("#dialog").dialog({ autoOpen: false });
			$("#busFare").click(function(){
				 $("#dialog").dialog('open');
	                return false;
			});
/* 			$("#viewAllNews").click(function(){
				$("#allNews").css("display","block");
				$("#singleNews").css("display","hidden");
			}); */
		});
		</script>

		<script type="text/javascript">
			$(document).ready(function(){	 
			    $('#viewAllNews').click(function(){
			    	$("#allNews").slideToggle();			    	 	
			    	var str=$("#viewAllNews").html();  
			    	
			        if(str == "View All News/Events."){
			        	$("#singleNews").hide();
			        	$("#viewAllNews").text("Hide All News/Events."); 
			        /* 	$("#viewAllNews").hide(); */
			        }
			        if(str == "Hide All News/Events."){
			        	$("#singleNews").show();
			        	$("#viewAllNews").text("View All News/Events.");
			        }
		    	});			 
			});
		</script>
		
		
</head>

<body id="subpage">

	<%@ include file="../../resources/includes/busFareDialog.jsp" %>
 
	<div id="templatemo_wrapper">

   	<%@ include file="../../resources/includes/header.jsp" %>    
    <%@ include file="../../resources/includes/userMenu.jsp" %>
    
    
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	                
        <div id="content" style="width: 96%;">
        	<h2>News & Events</h2>

    				<c:if test="${eventId ne null}">
  						<div id="singleNews" style="padding: 50px;">	
	  						<c:forEach var="news1" items="${listOfNews}">
	  							<c:if test="${ news1 ne null }">
	  										
	  								<c:if test="${ news1.newsId eq eventId }">		
	  									
										<table width="90%" border="0" align="center">
										  	<tr >
										    	<td width="67" rowspan="3" valign="top">
										    		<img src="../resources/images/images/general/news-6.png" width="60px" height="60px"></img>
										    	</td>
										    	<td><b>Subject11 : </b>${ news1.newsSubject }</td>
										  	</tr>
										  	<tr>
										   	 	<td>${ news1.newsContent }</td>
										  	</tr>
										  	<tr>
										    	<td>&nbsp;</td>
											</tr>
										</table>
								
									</c:if>
											
								</c:if>		
							</c:forEach>
						</div>
						<center><a href="#" id="viewAllNews">View All News/Events.</a></center>
					</c:if>
					
					
					<c:if test="${ listOfNews ne null}">
						<div id="allNews" style="padding: 50px; display: <c:if test="${eventId ne null}">none;</c:if>">
			        		<c:choose>
			    				<c:when test="${listOfNews ne null && fn:length(listOfNews) gt 0}">
			  						<c:forEach var="news1" items="${listOfNews}">
			  							<c:if test="${ news1 ne null }">		
			  								
												<table width="90%" border="0" align="center">
												  	<tr >
												    	<td width="67" rowspan="3" valign="top">
												    		<img src="resources/images/images/general/news-6.png" width="60px" height="60px"></img>
												    	</td>
												    	<td><b>Subject12 : </b>${ news1.newsSubject }</td>
												  	</tr>
												  	<tr>
												   	 	<td>${ news1.newsContent }</td>
												  	</tr>
												  	<tr>
												    	<td>&nbsp;</td>
													</tr>
												</table>
											
											</c:if>
											<hr></hr>							
			
									</c:forEach>
								</c:when>
								<c:otherwise>
									No News Found
								</c:otherwise>
							</c:choose>	 			
						</div>
					</c:if>
			
        </div> <!-- END of content -->
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
	<%@ include file="../../resources/includes/footer.jsp" %>   
</div>

<!-- DROPDOWN START -->
 
  <script src="../resources/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
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