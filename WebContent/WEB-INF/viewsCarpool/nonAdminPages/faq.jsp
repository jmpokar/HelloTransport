<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
       			<div id="content" style="width: 90%;">        
        			<table width="100%" border="0" align="center" style="padding: 10px 10px 10px 10px;" cellpadding="20">				
						<tr>
							<td height="100px" style="padding: 10px; border-bottom: thin; border-bottom-color: green; border-bottom-width: 5px;">  
								<font style="font-weight: bold; line-height: 25px;">Q 1: What is Carpooling? </font><br/>
								<font style="font-weight: bold;">Answer: </font>										
								Carpooling (also known as car-sharing, ride-sharing, lift-sharing and covoiturage), is the sharing of car journeys so that more than one person travels in a car.
								By having more people using one vehicle, carpooling reduces each person's travel costs such as fuel costs, tolls, and the stress of driving. 
								Carpooling is also seen as a more environmentally friendly and sustainable way to travel as sharing journeys reduces carbon emissions, traffic congestion on the roads, and the need for parking spaces. 
								Authorities often encourage carpooling, especially during high pollution periods and high fuel prices.
							</td>
						</tr>
						<tr>
							<td>
								<hr>	
							</td>
						</tr>					
						<tr>
							<td height="130px">
								<font style="font-weight: bold; line-height: 25px;">
									Q 2: What are the benefits of Carpooling? 
								</font><br/>
								<font style="font-weight: bold;">Answer: </font> 				
								<ol style="margin-left: 20px;">
									<li>
										<strong style="color: green">Carpooling will save YOU money </strong> as your travel expenses will be distributed among all the travellers travelling with you.  							 
									</li>
									<br>
									<li>
										<strong style="color: green">Carpooling is better for the environment </strong>as it helps in having fewer cars on the road which help decreasing CO2 Emission and improved air quality.  
									</li>
									<br>
									<li>
										<strong style="color: green">It's good for your health </strong> (According to Environment Canada, air pollution caused by vehicular travel is linked to a number of health concerns 
										including respiratory diseases, cardiovascular disease, allergies and neurological effects.
									</li>
									<br>
									<li>
										<strong style="color: green">Carpooling improves your commuting options </strong>
										Carpooling offers a commuter option that may work better than other methods of transportation. Carpooling works best for people who live where transit service may be limited or non-existent and compared to other options, carpooling may better fit your schedule.
									</li>
									<br>
									<li>
										<strong style="color: green">Make new friends</strong>
									</li>											
									<li>
										<strong style="color: green">Carpooling saves from traffic chaos</strong>
									</li>
								</ol>
							</td>
						</tr>
						<tr>
							<td>
								<hr>	
							</td>
						</tr>					
						<tr>
							<td height="70px">	
								<font style="font-weight: bold; line-height: 25px;">Q 3: I am in need of Carpooler, How do I search any carpooler on my route? </font><br/>
								<font style="font-weight: bold;">Answer: </font>
								
								At home page you have option to enter your Search criteria<br>
								<img alt="" src="../../../resources/carpool/images/faq/searchExplain_.png" width="800px" height="300px">
								 
							</td>
						</tr>						
						<tr>
							<td>
								<hr>	
							</td>
						</tr>
						<tr>
							<td height="70px">
								<font style="font-weight: bold; line-height: 25px;">	
									Q 4: I have Bike/Car and want to Carpool, How can I do? 
								</font><br/>
								<font style="font-weight: bold;">Answer: </font> 
								At home page you will find Let's Pool It Button, click on it.<br>
								<img alt="" src="../../../resources/carpool/images/faq/i_am_carpooler_.png" width="800px" height="300px"><br><br>
								<strong>After clicking on Let's pool it Button, you will find below options,</strong><br><br>
								When you want to Carpool?<br><br> 
								<img alt="" src="../../../resources/carpool/images/faq/carpoolingOn.PNG" width="800px" height="200px"><br>
								<ol style="margin-left: 20px;">
									<li>
									<strong>Always On Specific Days. </strong> If you want to Carpool Daily, or say for Eg, only on Mon, Tue, Wed then just Select Always On Specific Days and specify days when you want to Carpool.
									</li>								
									<br>
									<li>
										<strong>On specific dates.</strong> If you want to Carpool on specific date <br>(this option will help you for long journeys, If you are going from Bangalore to Mysore on 28th March, 2013 and in need of Carpool at this route, for the purpose of fuel sharing as example.), <br>then just Select On specific dates and specify date where it prompt you. 
									</li>
								</ol><br><br>
								<img alt="" src="../../../resources/carpool/images/faq/std1.png" width="800px" height="300px"><br><br>
								<img alt="" src="../../../resources/carpool/images/faq/returnStd.PNG" width="800px" height="300px"><br>
							</td>
						</tr>
						<tr>
							<td>
								<hr>	
							</td>
						</tr>
						<tr>
							<td height="70px"><font style="font-weight: bold; line-height: 25px;">						
								Q 5: All Seats are filled in my Car and Still I am getting Request for Carpooling, How can I hide myself as a Carpooler.? </font><br/>
								<font style="font-weight: bold;">Answer: </font> 
								At home page you will see carpool Setting option like shown below.<br><br>
								<img alt="" src="../../../resources/carpool/images/faq/carpoolSetting_.png" width="800px" height="300px"><br><br><br>
								then you will find option on that page like shown below,<br><br>
								<img alt="" src="../../../resources/carpool/images/faq/stdHide.PNG	" width="800px" height="300px">
							</td>
						</tr>
						<tr>
							<td>
								<hr>	
							</td>
						</tr>
						<tr>
							<td height="70px"><font style="font-weight: bold; line-height: 25px;">							
								Q 6: I found a Carpooler who is useful to me and I can travel with him/her, how can I contact Carpooler, where I can find details of Carpooler? </font><br/> 
								<font style="font-weight: bold;">Answer: </font> 
								You can search for Carpooler as shown on FAQ Question No 3.
								
								You will Land on page shown below,
								
								<br><br>
								<img alt="" src="../../../resources/carpool/images/faq/carpoolerDetails.PNG" width="800px" height="400px"> 
								<br><br>
							</td>
						</tr>
						<tr>
							<td>
								<hr>	
							</td>
						</tr>
						<tr>
							<td height="70px"><font style="font-weight: bold; line-height: 25px;">							
								Q 7: I want to change my profile Picture, Where I can find an option to change such? </font><br/> 
								<font style="font-weight: bold;">Answer: </font> 
								<br><br>
								<img alt="" src="../../../resources/carpool/images/faq/accountSetting_.png" width="800px" height="200px"> 
								<br><br>								
							</td>
						</tr>
						<tr>
							<td>
								<hr>	
							</td>
						</tr>
						<tr>
							<td height="70px"><font style="font-weight: bold; line-height: 25px;">						
								Q 8: How to see Carpooler Details? </font><br/> 
								<font style="font-weight: bold;">Answer: </font>
		
								After clicking on Details link that you will find on Question No 6. 		
								
								There are 3 tabs. 
								<ol style="margin-left: 20px;">
									<li>
									Carpooler Details.
									<br>
									This tab will provide you Carpooler Details.
									</li>
									<br>
									<li>
									Route Details.
									<br>
									This tab will provide you Carpooler Route Details like Carpooler Start PLace, Destination place, Start Timing, is Seat Vaccant on Carpooler Car etc.
									
									</li>
									<br>
									<li>
									 Contact Carpooler
									 <br>
									 With the help of this Tab yiu can contact Carpooler by providing subject and body of mail. 
									</li>
								</ol>
								<br><br>
								<img alt="" src="../../../resources/carpool/images/faq/carpoolerDetailsTomcat.PNG" width="800px" height="300px"> <br><br>
							</td>
						</tr>
						<tr>
							<td>
								<hr>	
							</td>
						</tr>			
						<tr>
							<td height="70px"><font style="font-weight: bold; line-height: 25px;">											
								Q 9: I have Questions and want to Contact Carpool Team? </font><br/>
								<font style="font-weight: bold;">Answer: </font> You can contact Carpool Team by clicking on Contact Us link on header.
								<br>
								You can also do Live Chat with Carpooler Team by clicking on Live Chat option under Contact Us link. 
								<br><br>
								If you have other questions, please feel free to contact us.						
							</td>
						</tr>
					</table>
        		</div>
        		<div class="cleaner"></div>
    		</div>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
	</body>
</html>
