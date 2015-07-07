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
		
	
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
		    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
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


<body id="subpage">
	
	<%@ include file="../../resources/includes/busFareDialog.jsp" %>
	
<div id="templatemo_wrapper">
	
    <%@ include file="../../resources/includes/header.jsp" %> 
    <%@ include file="../../resources/includes/userMenu.jsp" %>
    
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	
        <div id="sidebar" style="float: right;">
   	    <h3>Live Chat</h3>
            <ul class="sidebar_menu">
			    <!-- Start InstanteStore LiveChat -->

				<div class="live" id="InstanteStoreLiveChat">
					<a href="http://www.instantestore.com/livechat_software.cfm"
						target="_blank"> Live Chat Software </a>
				</div> <script defer="defer" type="text/javascript"
					src="//livechat.iestorechat.com/r/5348/536843CCBFF2FD75DF8469B9EB2E8FD1/"></script>
		
				<!-- End InstanteStore LiveChat -->
			</ul>
            <h3>Address</h3>
            <p></p>
            <div id="newsletter">
              <table width="300px" border="0" align="left">
				<tr style="padding: 20px;">
					<td align="left" valign="top" style="font-weight: bold; font-size: 14px;">Email</td>
					<td>patel286@avaya.com</td>
				</tr>
				<tr>
					<td align="left" valign="top" style="font-weight: bold; font-size: 14px;">Mob Num</td>
					<td>+91 9545211071</td>
				</tr>
			</table>					
            </div>
        </div> <!-- END of sidebar -->
        
        <div id="content" style="width: 550px;">
        	<h2>Contact Information</h2>
			
            <div class="col col_13" style="width: 500px;">
            <p>
            	The success of using Public/Company Transport depends upon the participation of the community. 
            	Be a active member in keeping environment green and clean.
            </p>
            <div id="contact_form">
               <form method="post" name="contact" action="#">
                    
                 <!--    <label for="author">Name:</label> <input type="text" id="author" name="author" class="required input_field" />
                    <div class="cleaner h10"></div> -->
						
<!--                     <label for="email">Email:</label> 
                    <input type="text" id="email" name="email" class="validate-email required input_field" />
                    <div class="cleaner h10"></div>
 -->                        
                   <!--  <label for="subject">Subject:</label> <input type="text" name="subject" id="subject" class="input_field" />
                    <div class="cleaner h10"></div> -->
        
                    <label for="text">Message:</label> 
                    	<textarea id="text" name="text" rows="0" cols="0" class="required" style="width: 450px;"></textarea>
                    <div class="cleaner h10"></div>
 					
					<input type="submit" value="Send" id="submit" name="submit" class="submit_btn float_l" />
					<!-- <input type="reset" value="Reset" id="reset" name="reset" class="submit_btn float_r" /> -->
					
                </form>
            </div>
		</div>
        
        <div class="cleaner h30"></div>
        
<!--         <iframe width="660" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
        	src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=new+york+central+park&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=60.158465,135.263672&amp;vpsrc=6&amp;ie=UTF8&amp;hq=&amp;hnear=Central+Park,+New+York&amp;t=m&amp;ll=40.769606,-73.973372&amp;spn=0.014284,0.033023&amp;z=14&amp;output=embed">
        </iframe>
 -->            
        </div> <!-- END of content -->
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
  	<%@ include file="../../resources/includes/footer.jsp" %>
   
</div>

</body>
</html>