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
		
		
<!-- 	<script type="text/javascript">
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
       			<div id="content" style="width: 90%;">
       				<h2>FAQ</h2> 
					<div class="horizon_divider"></div>
       			        
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
					
        		</div>
        		<div class="cleaner"></div>
    		</div>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>

	</body>
	
</html>