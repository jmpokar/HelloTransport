 <div id="menuTransport"  style="display: none;">
 	<ul class="dropdown" >
        	<li><a href="${pageContext.request.contextPath}/jsp/transport/home" class="selected">Home</a></li>
        	<!-- <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li> -->
            
            <li><a href="#" class="selected">Transport</a>
        		<ul class="sub_menu">
        			 <li><a href="transportTeam">Team</a></li>
                    <li><a href="#" id="busFare">Bus Fare</a></li>
                    <li><a href="transportTeam" id="">Request Bus Pass</a></li>
                    <li><a href="cabBooking" id="">Request Cab Booking</a></li>
        		</ul>
        	</li>
        	<li><a href="userStats">Statistics</a></li>
			<li><a href="faq">FAQs</a></li>
			<li><a href="contactUs">Contact</a></li>
           	<sec:authorize access="hasRole('ROLE_ADMIN')">
		   		<li style="float: right">
		   			<a href="admin/ae/adminHome">Admin Panel</a>
           		</li>
			</sec:authorize>
            <li style="float: right;   border-right: 1px solid #333;">
		   		<a href="myDashboard">
           			Inbox
           		</a>
			</li>
       	</ul>
 </div>

<div id="menuCarpool"  style="display: none;">
 	<ul class="dropdown" >
        	<li><a href="${pageContext.request.contextPath}/jsp/carpool/dashboard/home" class="selected">Home</a></li>
       		<li><a href="faq.jsp">FAQ</a></li>
            <sec:authorize access="isAuthenticated()">
              <li class="dropdown">
                <a href="#" class="dropdown-toggle">My Account</a>
                <ul>
					<li><a href="profileSettings.jsp">Account Settings</a></li>
					<li><a href="carpoolSettings.jsp">Carpool Settings</a></li>
                </ul>
              </li>
            </sec:authorize>
            	<c:choose>
				  		<c:when test="${ providingCarpool ne true }">
					    	<li><a href="letspoolit.jsp" class="classname1">I have Car & want to Pool</a></li>
				  		</c:when>
				  		<c:otherwise>
			  				<li><img width="110px"  height="90px" src="../images/good_job/9089039-3d-good-job-crossword-on-white-background.jpg" alt="" ></li>	
				  		</c:otherwise>
			  	</c:choose>
            

       	</ul>
 </div>
  