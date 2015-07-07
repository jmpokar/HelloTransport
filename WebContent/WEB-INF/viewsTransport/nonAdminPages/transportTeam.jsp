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
		
		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
		
		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
		
		<!-- STYLE FOR BMTC BUS ROUTE SCROLLABLE TABLE START -->
		<%@ include file="../../../includes/transport/cssForTable.jsp" %>
		<!-- STYLE FOR BMTC BUS ROUTE SCROLLABLE TABLE END -->
		
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

		<style type="text/css">
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
				
		<!-- BUS FARE DIALOG START -->
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
		
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
				
<!-- 		<script type="text/javascript">
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
        
	        	<div id="content" style="width: 96%;">
	        		<h2>Transport Team</h2>
	
		        	<!-- SEARCH BOX AND RESULT START -->
		         	<%@ include file="../../../includes/transport/transportTeamPageSearchBox.jsp" %>
					<!-- SEARCH BOX AND RESULT END -->
            
							
					<div class="horizon_divider"></div>
					<span>	
						<!-- <label style="float: left; font-size: 25px;">Transport Team Members</label> --> 
						<h4 style="font-size: 14px; padding-bottom: 10px; border-bottom: 1px solid #ccc; margin: 5px;">Details</h4>
						<a style="text-decoration: none; float: right;" href="printAllPassengerList" class="myButton">Print All Passenger List</a>
					</span>

					<!-- ROUTE TABLE START -->
		         	<%@ include file="../../../includes/transport/transportTeamPageTable.jsp" %>
					<!-- ROUTE TABLE END -->
            
        		</div>
        		<div class="cleaner"></div>
    		</div> 

    		<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>