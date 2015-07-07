<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->	
	
		<!-- 	
		<script type="text/javascript">
	    $(document).ready(function(){
			if($("#appSelection").val()==0){
				$("#menuCarpool").css("display","none");
		    	$("#menuTransport").css("display","block");
			}else{
				$("#menuCarpool").css("display","block");
		    	$("#menuTransport").css("display","none");
			}
	    });
		</script>
	 	-->		
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
        	</div>
        
        	<div id="content" style="width: 550px;">
        		<h2>Contact Information</h2>
            	<div class="col col_13" style="width: 500px;">
		            <p>
	      	      		The success of using Public/Company Transport depends upon the participation of the community. 
	            		Be a active member in keeping environment green and clean.
	            	</p>
	            	<div id="contact_form">
               			<form method="post" name="contact" action="#">
		                 	<!--    
		                 	<label for="author">Name:</label> <input type="text" id="author" name="author" class="required input_field" />
		                    <div class="cleaner h10"></div>
								
		                    <label for="email">Email:</label> 
		                    <input type="text" id="email" name="email" class="validate-email required input_field" />
		                    <div class="cleaner h10"></div>
		                        
		                   	<label for="subject">Subject:</label> <input type="text" name="subject" id="subject" class="input_field" />
		                    <div class="cleaner h10"></div> 
		                    -->
		        
		                    <label for="text">Message:</label> 
		                    	<textarea id="text" name="text" rows="0" cols="0" class="required" style="width: 450px;"></textarea>
		                    <div class="cleaner h10"></div>
		 					
							<input type="submit" value="Send" id="submit" name="submit" class="submit_btn float_l" />							
                		</form>
            		</div>
				</div>
	       	 	<div class="cleaner h30"></div>
	        
				<!--         
				<iframe width="660" height="300" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" 
					src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=new+york+central+park&amp;aq=&amp;sll=37.0625,-95.677068&amp;sspn=60.158465,135.263672&amp;vpsrc=6&amp;ie=UTF8&amp;hq=&amp;hnear=Central+Park,+New+York&amp;t=m&amp;ll=40.769606,-73.973372&amp;spn=0.014284,0.033023&amp;z=14&amp;output=embed">
			    </iframe>
			 	-->            
				</div> 
        		<div class="cleaner"></div>
			</div>
  			
  			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
	
</html>