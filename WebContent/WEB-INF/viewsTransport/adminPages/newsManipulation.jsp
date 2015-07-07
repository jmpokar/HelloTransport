<%@page import="com.corporate.transportdb.dto.updated.UserRouteMappingUpdated"%>
<%@page import="com.corporate.transportdb.dto.updated.RouteDriverVehicleMappingUpdated"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.corporate.transportdb.dto.updated.UserRequestNew"%>
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
	
	 	<!-- DIALOG START -->
	 	<%@ include file="../../../includes/transport/dialogBox.jsp" %>
		<!-- DIALOG END -->
	
	 	<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
			
		<!-- STYLING TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLING TABLE END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->

		<script type="text/javascript">
			$(function() {
				
				$('#buttons').find('a').click(function() {
			    	$('#dialog_'+nr).show();
			        // find out clicked id and open dialog
			        var nr = this.id.split("_")[1];
			        $('#dialog_'+nr).dialog({ 

			        	position:'center', 
				        draggable: true, 
				        resizable: true, 
				        width: 600, 
				        height: 600,
					    buttons: {
							"Close": function() {
							    $(this).dialog("close");
							},
							"Submit": function() {
				                window.temp = false;
							   $('#signinform'+nr).submit();
							}
					    }
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
		
		<!-- <style type="text/css">
			#search-box {
			    position: relative;
			    width: 100%;
			    margin: 0;
			}
			#search-form {
			    height: 40px;
			    border: 1px solid #999;
			    -webkit-border-radius: 5px;
			    -moz-border-radius: 5px;
			    border-radius: 5px;
			    background-color: #fff;
			    overflow: hidden;
			}
			
			#search-text {
			    font-size: 14px;
			    color: #ddd;
			    border-width: 0;
			    background: transparent;
			}
			
			#search-box input[type="text"] {
			    width: 90%;
			    padding: 11px 0 12px 1em;
			    color: #333;
			    outline: none;
			}
			
			#search-button {
			    position: absolute;
			    top: 0;
			    right: 0;
			    height: 42px;
			    width: 80px;
			    font-size: 14px;
			    color: #fff;
			    text-align: center;
			    line-height: 42px;
			    border-width: 0;
			    background-color: #999;
			    -webkit-border-radius: 0px 5px 5px 0px;
			    -moz-border-radius: 0px 5px 5px 0px;
			    border-radius: 0px 5px 5px 0px;
			    cursor: pointer;
			}
			.slidingDiv {
			    height:300px;
			   /*  background-color: #99CCFF; */
			    padding:20px;
			    margin-top:10px;
			    /* border-bottom:5px solid #3399FF; */
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
  		<!-- 
  		<style type="text/css"> 
		    ol li {list-style: decimal outside;}
		    
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
  		</style>
  		<link rel="stylesheet" href="../../../resources/dropdown-charts/chosen.css" /> -->  
  		<!-- FOR DROPDOWN END -->
  		
  		<style type="text/css">
 			.bordered {
				border: solid #ccc 1px;
				border-radius: 6px;
			}
			.bordered table{
				border: solid #ccc 1px;
				border-radius: 6px;	
			}    	
			.bordered td {
				/* border-left: 1px solid #ccc; */
				border-top: 1px solid #ccc;
				padding: 5px;
				text-align: left;
			}
			.bordered th{
				border-left: 0px solid #ccc;
				border-top: 1px solid #ccc;
				padding: 5px;
				text-align: left;
				background-color: gray;
				color: white;
			}
 		</style>
 		 		
 		<script type="text/javascript">
			$(function(){
				$("#expiryDate").datepicker({				
					dateFormat: "dd-mm-yy",
					changeMonth: true,
					minDate : new Date(),
					changeYear: true,
					showOn: "button",
					buttonImage: "../../../resources/common/images/misc/calendar.gif",
					buttonImageOnly: true				
				});
				$("#activeDate").datepicker({				
					dateFormat: "dd-mm-yy",
					minDate : new Date(),
					changeMonth: true,
					changeYear: true,
					showOn: "button",
					buttonImage: "../../../resources/common/images/misc/calendar.gif",
					buttonImageOnly: true				
				});
			});
		</script>
 		  		
	</head>
	<body id="home">
	
	
		<!-- NOTIFICATION STARTED -->		
		<% if(request.getAttribute("status")!=null){ %>	
			<script type="text/javascript">
				var status = "<%=request.getAttribute("status")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+status, {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});		
			</script>  
		<% } %>
		
		<% if(request.getParameter("status")!=null){ %>	
			<script type="text/javascript">
				var feedbackSavingResult = "<%=request.getParameter("status")%>";
				$(document).ready(function() {
				 	 $.Zebra_Dialog(''+status, {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
			</script>  
		<% } %>
		<!-- NOTIFICATION ENDED -->
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>
		<div id="templatemo_wrapper">
				
 	    	<%@ include file="../../../includes/common/header.jsp" %>
	    	<%@ include file="../../../includes/transport/adminMenu.jsp" %>
	        
    		<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
		    
		    <div id="templatemo_main">
        
        		<div id="content" style="width: 96%;">
        			<h2>News</h2>
        			<div style="padding-bottom: 30px;"></div>
					<!-- ADD NEWS STARTED -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("addNews") || 
						request.getAttribute("request")!=null && request.getAttribute("request").equals("addNews")){ %>				
							<form action="addNews" method="post">
								<table border="0" align="center">
								  <tr height="50px">
								    <td style="font-weight: bold;">Enter News Subject :</td>
								    <td>
								    	<input type="text" name="newsSubject">
								    </td>
								  </tr>
								   <tr height="50px">
								    <td style="font-weight: bold;" valign="top">Enter News Content :</td>
								    <td>
								    	<textarea id="newsContent" name="newsContent" style="width: 300px; height:100px;"></textarea>
								    </td>
								  </tr>
								   <tr height="50px">
								    <td style="font-weight: bold;">Select News Active Date :</td>
								    <td>
								    	<input type="text" name="activeDate" id="activeDate" />
								    </td>
								  </tr>
								  <tr height="50px">
								    <td style="font-weight: bold;">Select News Expiry Date :</td>
								    <td>
								    	<input type="text" name="expiryDate" id="expiryDate" />
								    </td>
								  </tr>
								  <tr height="50px">
								    <td colspan="2">
								    	<input type="submit" name="submit" class="myButton">
								    </td>
								  </tr>
								</table>    					       
							</form>								
					<% } %>
					<!-- ADD NEWS ENDED -->
					
					<!-- MODIFY NEWS STARTED -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("modifyNews") || 
						request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyNews")){ %>
						
						<table border="0" width="100%" align="center" id="bordered" class="bordered">
							<thead>
						  		<tr>
									<td width="2%"><b>SNo</b></td>
						  			<td width="30%"><b>Subject</b></td>
						  			<td width="20%"><b>Content</b></td>
						  			<td width="10%"><b>Active From</b></td>
						  			<td width="10%"><b>Active Till</b></td>
						  			<td width="24%"><b>Action</b></td>
						  		</tr>		  	
							</thead>
		  					<c:choose>
			  					<c:when test="${ listOfNews ne null }">
				  					<c:forEach var="news" items="${listOfNews}" varStatus="theCounter">
										<tr>
									    	<td>${theCounter.count}</td>
									    	<td>${ news.newsSubject }</td>
									    	<td>
									    		<textarea id="newsContent" name="newsContent" style="width: 200px; height:50px; overflow: scroll;">${ news.newsContent }</textarea>
									    	</td>
									    	<td><fmt:formatDate var="todaysDate1" value="${ news.newsActiveFromDate }" pattern="dd-mm-yyyy" />${ todaysDate1 }</td>
									    	<td><fmt:formatDate var="todaysDate2" value="${ news.newsActiveTillDate }" pattern="dd-mm-yyyy" />${ todaysDate2 }</td>
									    	<td>
									    		<a href="newsManipulation?request=modifyNewsDetails&newsId=${ news.newsId }" class="myButton">Modify</a> 
									    		<a href="deleteNews?request=delete&newsId=${ news.newsId }" class="myButton">Delete</a>
									    	</td>
									  	</tr>
								   	</c:forEach>
								</c:when>
								<c:otherwise>
									No News Found
								</c:otherwise>
							</c:choose>
						</table>
					<% } %>
					<!-- MODIFY NEWS ENDED -->

					<!-- This will be called when person click on modify link for some news -->
					<% if(request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyNewsDetails")){ %>
						<c:choose>
							<c:when test="${ newsUpdated ne null }">	
								<form action="modifyNews" method="post">
									<input type="hidden" name="newsId" value=${ newsUpdated.newsId }>	
									
									<table border="0" align="center">
									  <tr height="50px">
									    <td style="font-weight: bold;">Enter News Subject :</td>
									    <td>
									    	<input type="text" name="newsSubject" value="${ newsUpdated.newsSubject }">
									    </td>
									  </tr>
									   <tr height="50px">
									    <td style="font-weight: bold;" valign="top">Enter News Content :</td>
									    <td>
									    	<textarea id="newsContent" name="newsContent" style="width: 300px; height:100px; font-family: inherit;">${ newsUpdated.newsContent }</textarea>
									    </td>
									  </tr>
									   <tr height="50px">
									    <td style="font-weight: bold;">Select News Active Date :</td>
									    <td>
									    	<fmt:formatDate var="todaysDate1" value="${ newsUpdated.newsActiveFromDate }" pattern="dd-mm-yyyy" />
									    	<input type="text" name="activeDate" id="activeDate" value="${ todaysDate1 }" />
									    </td>
									  </tr>
									  <tr height="50px">
									    <td style="font-weight: bold;">Select News Expiry Date :</td>
									    <td>
									    	<fmt:formatDate var="todaysDate2" value="${ newsUpdated.newsActiveTillDate }" pattern="dd-mm-yyyy" />
									    	<input type="text" name="expiryDate" id="expiryDate" value="${ todaysDate2 }" />
									    </td>
									  </tr>
									  <tr height="50px">
									    <td colspan="2">
									    	<input type="submit" name="submit" class="myButton">
									    </td>
									  </tr>
									</table>
								</form>
							</c:when>
							<c:otherwise>
								No News found.				
							</c:otherwise>
						</c:choose>
					<% } %>

					<!-- DELETE NEWS STARTED -->
					<% if(request.getParameter("request")!=null && request.getParameter("request").equals("deleteNews")){ %>
						<table>
							<tr>
						    	<td>Select Driver Name to delete :</td>
								<td>
									<input type="text" name="driverName">
								</td>
						  	</tr>
						</table>
					<% } %>
					<!-- DELETE NEWS ENDED -->			
        	
        		</div>
        		<div class="cleaner"></div>
    		</div>
    
			<%@ include file="../../../includes/transport/footer.jsp" %>		
		</div>

		<!-- DROPDOWN START -->
	  	<!-- 
	  	<script src="../../../resources/dropdown-charts/chosen.jquery.js" type="text/javascript"></script>
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
	  	</script> -->
		<!-- DROPDOWN END -->
	
	</body>
</html>