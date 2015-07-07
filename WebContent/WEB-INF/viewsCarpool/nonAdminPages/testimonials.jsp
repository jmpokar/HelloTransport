<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
		
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->

		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->
	
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
		
		
		<!-- CSS USED FOR STYLING HOME PAGE Start -->
		<!-- <link rel="stylesheet" type="text/css" href="../css/body.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->
		
		<!-- CSS USED FOR STYLING HOME PAGE Start -->
		<!-- <link rel="stylesheet" type="text/css" href="../css/stylingTestimonialsPage.css" media="screen"> -->
		<!-- CSS USED FOR STYLING HOME PAGE END -->
	
		<!-- CSS FOR HEADER MENU START -->	
	  	<!-- <link rel="stylesheet" type="text/css" href="../css/header_menu_css.css" media="screen" /> -->
		<!-- CSS FOR HEADER MENU END -->
	  	
	
		<!-- CSS FOR BODY CAR, LATEST POST AND TESTIMONIAL SCROLLER START -->
		<!-- <link rel="stylesheet" type="text/css" media="screen" href="../css/bodyImageAndTestimonialAndLatestPostScroller.css"> -->
		<!-- CSS FOR BODY CAR, LATEST POST AND TESTIMONIAL SCROLLER END -->

  			
		
		<style>
			
			.flex {position:relative;width:850px;min-height:300px; margin-left:auto; border:0px solid red;margin-top:0px; overflow:visible; z-index:1000;}
			.flex a {background-color:white;display:block;width:100px;height:100px;border-radius:8px;position:absolute;background-repeat:no-repeat;
					background-position:center;border:2px solid green;cursor:pointer;
					text-shadow:1px 1px 20px #000;color:white;
					text-indent:10px;line-height:30px;
					text-decoration:none;overflow:visible; margin-left:auto;}
			[bg=a] {background-image:url(../../../resources/carpool/images/carpooler/1.jpg);}
			[bg=b] {background-image:url(../../../resources/carpool/images/carpooler/2.jpg);background-size:300px auto;}
			[bg=c] {background-image:url(../../../resources/carpool/images/carpooler/3.jpg);}
			[bg=d] {background-image:url(../../../resources/carpool/images/carpooler/28.jpg);}
			[bg=e] {background-image:url(../../../resources/carpool/images/carpooler/17.jpg);background-size:auto 280px;}
			[bg=f] {background-image:url(../../../resources/carpool/images/carpooler/6.jpg);background-size:auto 280px;}
			[bg=g] {background-image:url(../../../resources/carpool/images/carpooler/21.jpg);background-size:auto 200px;}
			[bg=h] {background-image:url(../../../resources/carpool/images/carpooler/8.jpg);}
			[bg=i] {background-image:url(../../../resources/carpool/images/carpooler/31.jpg);background-size:auto 300px;}
			[bg=j] {background-image:url(../../../resources/carpool/images/carpooler/10.jpg);background-size:auto 280px;}
			[bg=k] {background-image:url(../../../resources/carpool/images/carpooler/7.jpg);background-size:auto 280px;}
			
		</style>
		<script src="../../resources/carpool/imageSliderAtTestimonialPage/jquery.flex.js"></script>
		<script type="text/javascript">
		$(function() {
		    $(".flex").flex();
		});
		</script>
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
			
				<div class="post" style="overflow:visible;">
					 <div class="flex" style="overflow:visible;">
						<a bg="a" style="left:0px;top:0px;width:250px;height:125px;" width="350" height="275"></a>
						<a bg="b" style="left:260px;height:100px;top:0px;width:125px;" width="300" height="120"></a>
						<a bg="c" style="left:395px;height:250px;top:0px;width:75px;" width="350" height="250"></a>
						<a bg="d" style="left:480px;height:75px;top:0px;width:75px;" width="375" height="250"></a>
						<a bg="e" style="left:565px;height:125px;top:0px;width:200px;" width="370" height="232"></a>
						<a bg="f" style="left:480px;height:200px;top:85px;width:75px;" width="350" height="225"></a>
						<a bg="g" style="left:0px;height:100px;top:135px;width:75px;" width="375" height="200"></a>
						<a bg="h" style="left:260px;height:75px;top:110px;width:125px;" width="200" height="200"></a>
						<a bg="i" style="left:85px;height:140px;top:135px;width:165px;" width="350" height="240"></a>
						<a bg="j" style="left:565px;height:150px;top:135px;width:75px;" width="301" height="216"></a>
						<a bg="k" style="left:650px;height:75px;top:135px;width:75px;" width="225" height="150"></a>
					</div>
				</div>
						
				<div class="post">
					<c:if test="${listOfPraiseFeedback ne null}">
						<c:forEach var="feedback" items="${listOfPraiseFeedback}">
								<blockquote>
									<table width="100%" border="0" height="200px">
										<tr>
											<td align="center"> 
												<div><img class="image1" width="50" height="50" src="../../resources/common/images/profilePicture/${ feedback.user.userProfilePic }" /></div>
											
											<img width="30" height="30" src="../../resources/common/images/misc/cl1.png" /> 
											 
											 <label> ${ feedback.feedbackContents } </label> <img width="30" height="30" src="../../resources/common/images/misc/cl2.png" /> </td>
										</tr>
										<tr>
											<td colspan="4" height="30px" align="center"><img src="../../resources/common/images/misc/shadow.png" /></td>
										</tr>
										<tr>
											
										</tr>	
									</table>
								</blockquote>
						</c:forEach>
					</c:if>
				</div>
				<div class="cleaner"></div>
			</div>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>