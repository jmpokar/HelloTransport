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
<%@ include file="../../../resources/includes/titleAndMeta.jsp" %>
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

		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
		    <!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> -->
		    <script type="text/javascript" src="../resources/token-input/src/jquery.tokeninput.js"></script>
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input.css" type="text/css" />
		    <link rel="stylesheet" href="../resources/token-input/styles/token-input-facebook.css" type="text/css" />
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->



		<style>
			.myButton {
				-moz-box-shadow: inset 0px 1px 0px 0px #ffffff;
				-webkit-box-shadow: inset 0px 1px 0px 0px #ffffff;
				box-shadow: inset 0px 1px 0px 0px #ffffff;
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff
					), color-stop(1, #f6f6f6) );
				background: -moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: -ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
				background: linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',
					endColorstr='#f6f6f6', GradientType=0 );
				background-color: #ffffff;
				-moz-border-radius: 6px;
				-webkit-border-radius: 6px;
				border-radius: 6px;
				border: 1px solid #dcdcdc;
				display: inline-block;
				color: #666666;
				font-family: arial;
				font-size: 15px;
				font-weight: bold;
				padding: 6px 24px;
				text-decoration: none;
				text-shadow: 0px 1px 0px #ffffff;
			}
			
			.myButton:hover {
				background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6
					), color-stop(1, #ffffff) );
				background: -moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: -ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
				background: linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
				filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6',
					endColorstr='#ffffff', GradientType=0 );
				background-color: #f6f6f6;
			}
			
			.myButton:active {
				position: relative;
				top: 1px;
			}
		</style>

		<style type="text/css">	
			.customers {
				margin:0px;padding:0px;
				width:100%;
				box-shadow: 10px 10px 5px #888888;
				border:1px solid #11110a;
				
				-moz-border-radius-bottomleft:4px;
				-webkit-border-bottom-left-radius:4px;
				border-bottom-left-radius:4px;
				
				-moz-border-radius-bottomright:4px;
				-webkit-border-bottom-right-radius:4px;
				border-bottom-right-radius:4px;
				
				-moz-border-radius-topright:4px;
				-webkit-border-top-right-radius:4px;
				border-top-right-radius:4px;
				
				-moz-border-radius-topleft:4px;
				-webkit-border-top-left-radius:4px;
				border-top-left-radius:4px;
			}.customers table{
				width:100%;
				height:100%;
				margin:0px;padding:0px;
			}.customers tr:last-child td:last-child {
				-moz-border-radius-bottomright:4px;
				-webkit-border-bottom-right-radius:4px;
				border-bottom-right-radius:4px;
			}
			.customers table tr:first-child td:first-child {
				-moz-border-radius-topleft:4px;
				-webkit-border-top-left-radius:4px;
				border-top-left-radius:4px;
			}
			.customers table tr:first-child td:last-child {
				-moz-border-radius-topright:4px;
				-webkit-border-top-right-radius:4px;
				border-top-right-radius:4px;
			}.customers tr:last-child td:first-child{
				-moz-border-radius-bottomleft:4px;
				-webkit-border-bottom-left-radius:4px;
				border-bottom-left-radius:4px;
			}.customers tr:hover td{
				
			}
			.customers tr:nth-child(odd){ background-color:#cccccc; }
			.customers tr:nth-child(even)    { background-color:#ffffff; }.customers td{
				vertical-align:middle;
				
				
				border:1px solid #11110a;
				border-width:0px 1px 1px 0px;
				text-align:center;
				padding:9px;
				color:#000000;
			}.customers tr:last-child td{
				border-width:0px 1px 0px 0px;
			}.customers tr td:last-child{
				border-width:0px 0px 1px 0px;
			}.customers tr:last-child td:last-child{
				border-width:0px 0px 0px 0px;
			}
			.customers tr:first-child td{
					background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
				background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
			
				background-color:#252544;
				border:0px solid #11110a;
				text-align:center;
				border-width:0px 0px 1px 1px;
				color:#ffffff;
			}
			.customers tr:first-child:hover td{
				background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
				background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
				filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
			
				background-color:#252544;
			}
			.customers tr:first-child td:first-child{
				border-width:0px 0px 1px 0px;
			}
			.customers tr:first-child td:last-child{
				border-width:0px 0px 1px 1px;
			}
		</style>
		

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
		<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

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
		
		<style type="text/css">
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
		
<style type="text/css">		

/* define height and width of scrollable area. Add 16px to width for scrollbar          */
div.tableContainer {
	clear: both;
	border: 1px solid #963;
	height: 200px;
	overflow: auto;
	/* width: 756px */
}

/* Reset overflow value to hidden for all non-IE browsers. */
html>body div.tableContainer {
	overflow: hidden;
	/* width: 756px */
}

/* define width of table. IE browsers only                 */
div.tableContainer table {
	float: left;
	/* width: 740px; */
}

/* define width of table. Add 16px to width for scrollbar.           */
/* All other non-IE browsers.                                        */
html>body div.tableContainer table {
	/* width: 756px */
}

/* set table header to a fixed position. WinIE 6.x only                                       */
/* In WinIE 6.x, any element with a position property set to relative and is a child of       */
/* an element that has an overflow property set, the relative value translates into fixed.    */
/* Ex: parent element DIV with a class of tableContainer has an overflow property set to auto */
thead.fixedHeader tr {
	position: relative
}

/* set THEAD element to have block level attributes. All other non-IE browsers            */
/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
html>body thead.fixedHeader tr {
	display: block
}

/* make the TH elements pretty */
thead.fixedHeader th {
	background: gray;
/* 	border-left: 1px solid #EB8;
	border-right: 1px solid #B74;
	border-top: 1px solid #EB8;
 */	font-weight: normal;
	padding: 4px 3px;
	text-align: left
}

/* make the A elements pretty. makes for nice clickable headers                */
thead.fixedHeader a, thead.fixedHeader a:link, thead.fixedHeader a:visited {
	color: #FFF;
	display: block;
	text-decoration: none;
	width: 100%
}

/* make the A elements pretty. makes for nice clickable headers                */
/* WARNING: swapping the background on hover may cause problems in WinIE 6.x   */
thead.fixedHeader a:hover {
	color: #FFF;
	display: block;
	text-decoration: underline;
	width: 100%
}

/* define the table content to be scrollable                                              */
/* set TBODY element to have block level attributes. All other non-IE browsers            */
/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
/* induced side effect is that child TDs no longer accept width: auto                     */
html>body tbody.scrollContent {
	display: block;
	height: 190px;
	overflow: auto;
	width: 100%
}

/* make TD elements pretty. Provide alternating classes for striping the table */
/* http://www.alistapart.com/articles/zebratables/                             */
tbody.scrollContent td, tbody.scrollContent tr.normalRow td {
	background: #FFF;
	border-bottom: none;
	border-left: none;
	border-right: 1px solid #CCC;
	border-top: 1px solid #DDD;
	padding: 2px 3px 3px 4px
}

tbody.scrollContent tr.alternateRow td {
	background: #EEE;
	border-bottom: none;
	border-left: none;
	border-right: 1px solid #CCC;
	border-top: 1px solid #DDD;
	padding: 2px 3px 3px 4px
}

/* define width of TH elements: 1st, 2nd, and 3rd respectively.          */
/* Add 16px to last TH for scrollbar padding. All other non-IE browsers. */
/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
html>body thead.fixedHeader th {
	width: 200px
}

html>body thead.fixedHeader th + th {
	width: 240px
}

html>body thead.fixedHeader th + th + th {
	width: 316px
}

/* define width of TD elements: 1st, 2nd, and 3rd respectively.          */
/* All other non-IE browsers.                                            */
/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
html>body tbody.scrollContent td {
	width: 200px
}

html>body tbody.scrollContent td + td {
	width: 240px
}

html>body tbody.scrollContent td + td + td {
	width: 300px
}		
</style>
		
		<!-- FOR DROPDOWN START -->
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
  		<link rel="stylesheet" href="../resources/dropdown-charts/chosen.css" />  
  		<!-- FOR DROPDOWN END -->		
</head>

<body id="subpage">


	<!-- NOTIFICATION STARTED -->
		
	<% if(request.getAttribute("status")!=null){ %>	
	
		<script type="text/javascript">
		var status = "<%=request.getAttribute("status")%>";
		alert(status);
		</script>  
	
	<% } %>
		
	<% if(request.getParameter("status")!=null){ %>	
	
		<script type="text/javascript">
		var status = "<%=request.getParameter("status")%>";
		alert(status);
		
		</script>  
	
	<% } %>
		
	<!-- NOTIFICATION ENDED -->
	
<div id="templatemo_wrapper">

    <%@ include file="../../../resources/includes/header.jsp" %>
    <%@ include file="../../../resources/includes/adminMenu.jsp" %>
        
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
        
        <div id="content" style="width: 96%;">
        	<!-- <h2>Transport Team</h2> -->
        	
			
	<!-- This will be called when person click on modify link for some vehicle -->
	<% if(request.getAttribute("request")!=null && request.getAttribute("request").equals("modifyRouteDetails")){ %>

		<c:choose>
			<c:when test="${ route ne null }">	
												
		<div style="padding-left: 400px;">		
		<form action="modifyRoute" method="post">
			<input type="hidden" name="routeId" value=${ route.route.routeId }>
			
			<table border="0">

			  <tr height="70px">
			    <td style="font-weight: bold;">Enter Route Name :</td>
			    <td><input type="text" name="routeName" value=${ route.route.routeName }></td>
			  </tr>
			</table><a></a>  

			<table border="0">

			  <tr height="50px">
			    <td colspan="2" style="font-weight: bold;">Select Place where Bus has stops :</td>
			  </tr>

			  <tr>
			    
			    <td colspan="2">
			    
			    
			    <div>
			      <table border="1">
			        <thead>
			          <tr>
			            <td>
			              &nbsp;
			            </td>
			            <td width="347">
			              Place Name
			            </td>
			            <td width="31">
			              Hour
			            </td>
			            <td width="31">
			              Minute
			            </td>
			            <td>
			              &nbsp;
			            </td>
			          </tr>
			        </thead><!-- sheepIt Form -->
			        <tbody id="sheepItForm">
			          <!-- Form template-->

<%-- 			           <c:if test="${route.listOfPlaceUpdated ne null}"> 
			           <c:forEach var="place" items="${route.listOfPlaceUpdated}" varStatus="inner">
 --%>


			          <tr id="sheepItForm_template">
			            <td>
			              <span id="sheepItForm_label"></span>
			            </td>
			            
   		
			            <td>
			              <input id="sheepItForm_#index#_phone" name="place" type="text" size="50" maxlength="10" value="${place.placeName}" />
			            </td>
			         
 
 						<td>
			               <select name="time_hour" id="sheepItForm_#index#_description0" name="hour" type="select">
			               		<option value="01">01</option>
			               		<option value="02">02</option>
			               		<option value="03">03</option>
			               		<option value="04">04</option>
			               		<option value="05">05</option>
			               		<option value="06">06</option>
			               		<option value="07">07</option>
			               		<option value="08">08</option>
			               		<option value="09">09</option>
			               		<option value="10">10</option>
	
			               </select>
			            </td>
			        
			        	<td>
			               <select name="time_minute" id="sheepItForm_#index#_description1" name="minute" type="select1">
			               		<option value="01">01</option>
			               		<option value="02">02</option>
			               		<option value="03">03</option>
			               		<option value="04">04</option>
			               		<option value="05">05</option>
			               		<option value="06">06</option>
			               		<option value="07">07</option>
			               		<option value="08">08</option>
			               		<option value="09">09</option>
			               		<option value="10">10</option>
			               </select>
			            </td>
 						
 						<td>
			              <a id="sheepItForm_remove_current" name="sheepItForm_remove_current"><img class="delete" src="resources/images/cross.png" width="16" height="16" border="0" /></a>
			            </td>
			            
			            
			          </tr><!-- /Form template-->
<%-- 			            </c:forEach>
			            </c:if> --%>


			          <!-- No forms template -->
			          <tr id="sheepItForm_noforms_template">
			            <td colspan="4" align="center">
			              No records
			            </td>
			            <td></td>
			          </tr><!-- /No forms template-->
			        </tbody><!-- /sheepIt Form -->
			      </table><!-- Controls -->
			      <div id="sheepItForm_controls">
			        <div id="sheepItForm_add">
			          <a><span>Add</span></a>
			        </div>
			        <div id="sheepItForm_remove_last">
			          <a><span>Remove</span></a>
			        </div>
			        <div id="sheepItForm_remove_all">
			          <a><span>Remove all</span></a>
			        </div>
			        
 			        <br><br>
			        Number of Places you want to add :
			        <br> 
 			        <div id="sheepItForm_add_n">
			          <input id="sheepItForm_add_n_input" type="text" size="4" />
			          <div id="sheepItForm_add_n_button">
			            <a><span>Add</span></a>
			          </div>
			        </div> 
			        
			      </div><!-- /Controls -->
			    </div>
			    
			    
			    
			    
			    
			    
			    </td>
			  </tr>
		</table>
		
		   
        
        
        
		<table border="0">
			
			  <tr height="30px">
			    <td></td>
			    <td></td>
			  </tr>
					

			  <tr >
			    <td style="font-weight: bold;">Select Vehicle for Route :</td>
			    <td>
					
			        <select size="1" name="vehicle"> 
						
						<c:if test="${ listOfAllVehicles ne null }">	
					 		<c:forEach var="vehicle" items="${listOfAllVehicles}">
					 		 	<option value="${ vehicle.vehicleNumber }" <c:if test="${ route.routeDriverMappingUpdated.driver.vehicle.vehicleNumber eq  vehicle.vehicleNumber }">selected</c:if> >${ vehicle.vehicleNumber }</option>
					 		</c:forEach> 
					  	</c:if>
					 </select>
			    
			    </td>
			  </tr>

			  
			
			  
			  <tr>
			    <td colspan="2" align="center" height="60px"><input type="submit" name="submit" value="Submit"></td>
			  </tr>
			  
			</table>
		</form>
		</div>
				
			</c:when>
			<c:otherwise>
			
				No Vehicle found.
			
			</c:otherwise>
		</c:choose>

	<% } %>
			

			
			
        </div> <!-- END of content -->
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
		<%@ include file="../../../resources/includes/footer.jsp" %>   
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