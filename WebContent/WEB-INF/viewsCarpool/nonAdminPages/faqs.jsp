<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ include file="../../resources/includes/titleAndMeta.jsp" %>
<link href="../resources/css/templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="../resources/css/ddsmoothmenu.css" />

<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
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

		<!-- SCROLLING EVENTS STARTED -->	 
		 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
		<link rel="stylesheet" href="../resources/scrollingNews/style.css" type="text/css" media="screen" />
		<script src="../resources/scrollingNews/jcarousellite_1.0.1c4.js" type="text/javascript"></script>
		<script src="../resources/scrollingNews/action.js" type="text/javascript"></script>	
		<!-- SCROLLING EVENTS ENDED -->	
		
		<!-- Start WOWSlider.com HEAD section -->
			<link rel="stylesheet" type="text/css" href="../resources/imageSliderAtTestimonialPage/engine1/style.css" />
		<!-- End WOWSlider.com HEAD section -->
	
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
					    
		});
		</script>
	
			<!-- FEEDBACK PLUGIN START -->
			<script src="../resources/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
			<script>
			$(document).ready(function() {
			      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
			});
			</script>
			<link rel="stylesheet" href="../resources/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
		<!-- FEEDBACK PLUGIN END -->
		
</head>

	<body id="home">
		<%@ include file="../../resources/includes/busFareDialog.jsp" %>
		<div id="templatemo_wrapper">
    		<%@ include file="../../resources/includes/header.jsp" %> 
   	 		<%@ include file="../../resources/includes/userMenu.jsp" %>
    		<div style="margin: 20px;"></div>
			<div id="templatemo_main_top"></div>
    		<div id="templatemo_main">
       			<div id="content" style="width: 90%;">        
        			<table width="100%" border="0" align="center">
				  		<tr>
				    		<td width="20px" rowspan="3" valign="top">
				    			1.
				    		</td>
				    		<td><b>What is Avaya Transport Website Regarding ?</b></td>
				  		</tr>
				  		<tr>
				   	 		<td>It is regarding one stop solution for all Transport Related facilities.</td>
				  		</tr>
				  		<tr style="height: 50px;">
				    		<td><hr></hr></td>
						</tr>
						<tr>
				    		<td width="20px" rowspan="3" valign="top">
				    			2.
				    		</td>
				    		<td><b>What is Avaya Transport Website Regarding ?</b></td>
				  		</tr>
				  		<tr>
				   	 		<td>It is regarding one stop solution for all Transport Related facilities.</td>
				  		</tr>
				  		<tr style="height: 50px;">
				    		<td><hr></hr></td>
						</tr>
					</table>
					
        		</div> <!-- END of content -->
        		<div class="cleaner"></div>
    		</div> <!-- END of main -->
    
			<%@ include file="../../resources/includes/footer.jsp" %>
		</div>

	</body>
	
</html>