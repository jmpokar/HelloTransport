  <div id="menuTransportAdmin">
    <ul class="dropdown">
    		
        	<li><a href="../../admin/ae/adminHome">Admin Home</a></li>
        	<li><a href="../ab/getBusFare" class="selected">Bus Fare</a></li>
        	<li>
        		<a href="#">Entries</a>
               	<ul>
					<li><a href="#">Route</a>
		                <ul>
		                    <li><a href="../arp/routeManipulationPlace?request=addRoutePlace">Add</a></li>
		                    <li><a href="../arp/routeManipulationPlace?request=modifyRoutePlace" id="busFare">Modify/Delete</a></li>
		              </ul>
		        	</li>
                   	<li><a href="#">Place</a>
                   		<ul>
                   			<li><a href="../ap/placeManipulation?request=addPlace">Add</a></li>
                    		<li><a href="../ap/placeManipulation?request=modifyPlace" id="busFare">Modify/Delete</a></li>
                   		</ul>
                   	</li>
                   	<!-- <li><a href="#">Route</a>
	                   	<ul>
	                   		<li><a href="../ar/routeManipulation?request=addRoute">Add</a></li>
	                    	<li><a href="../ar/routeManipulation?request=modifyRoute">Modify/Delete</a></li>
	                   	</ul>
                   	</li> -->
                   	<li><a href="#">Driver</a>
	                   	<ul>
	                   		<li><a href="../ad/driverManipulation?request=addDriver">Add</a></li>
	                    	<li><a href="../ad/driverManipulation?request=modifyDriver" id="busFare">Modify/Delete</a></li>
	                   	</ul>
                   	</li>
                   	<li><a href="#">Vehicle</a>
	                   	<ul>
	                   		<li><a href="../av/vehicleManipulation?request=addVehicle">Add</a></li>
	                    	<li><a href="../av/vehicleManipulation?request=modifyVehicle" id="busFare">Modify/Delete</a></li>
	                   	</ul>
                   	</li>
		           <!--  <li><a href="#">Driver-Vehicle</a>
			                <ul>
			                    <li><a href="routeManipulationPlace?request=addRoutePlace">Add</a></li>
			                    <li><a href="routeManipulationPlace?request=modifyRoutePlace" id="busFare">Modify/Delete</a></li>
			              </ul>
			        </li> -->
		            <li><a href="#">News</a>
		                 <ul>
		                    <li><a href="../an/newsManipulation?request=addNews">Add</a></li>
	                    	<li><a href="../an/newsManipulation?request=modifyNews" id="busFare">Modify/Delete</a></li>
		                 </ul>
		            </li>
				</ul>
       		</li>
       		<li><a href="#">Employee</a>
	        	<ul>
                    <li><a href="../ae/selectEmployee">Add</a></li>
                    <li style="width: 230px;"><a href="../ae/removeEmployee">Remove</a></li>
                </ul>   
		    </li>
	        <li><a href="../ac/chargingModule">Charging</a></li>
                     
 			<li style="float: right"><a href="${pageContext.request.contextPath}/jsp/transport/home" >&nbsp;&nbsp;Employee Home&nbsp;&nbsp;</a></li>
			
	 	
        </ul>
  </div>


<!-- start of templatemo_menu -->
<!-- <div id="templatemo_menu" class="ddsmoothmenu">
        <ul>
            <li><a href="getBusFare" class="selected">Bus Fare</a></li>
            <li><a href="#">User Request</a></li>
            
            <li><a href="#">Entries</a>
                <ul>
                   	<li><a href="#">Route &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ></a>
			                <ul>
			                    <li><a href="routeManipulationPlace?request=addRoutePlace">Add</a></li>
			                    <li><a href="routeManipulationPlace?request=modifyRoutePlace" id="busFare">Modify/Delete</a></li>
			              </ul>
			        </li>
                    <li><a href="#">Place  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ></a>
                    	<ul>
                    		<li><a href="placeManipulation?request=addPlace">Add</a></li>
	                    	<li><a href="placeManipulation?request=modifyPlace" id="busFare">Modify/Delete</a></li>
                    	</ul>
                    </li>
                    <li><a href="#">Route  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ></a>
                    	<ul>
                    		<li><a href="routeManipulation?request=addRoute">Add</a></li>
	                    <li><a href="routeManipulation?request=modifyRoute">Modify/Delete</a></li>
                    	</ul>
                    </li>
                    <li><a href="#">Driver  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ></a>
                    	<ul>
                    		<li><a href="driverManipulation?request=addDriver">Add</a></li>
	                    <li><a href="driverManipulation?request=modifyDriver" id="busFare">Modify/Delete</a></li>
                    	</ul>
                    </li>
                    <li><a href="#">Vehicle  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ></a>
                    	<ul>
                    		<li><a href="vehicleManipulation?request=addVehicle">Add</a></li>
	                    <li><a href="vehicleManipulation?request=modifyVehicle" id="busFare">Modify/Delete</a></li>
                    	</ul>
                    </li>
		            <li><a href="#">Driver-Vehicle</a>
			                <ul>
			                    <li><a href="routeManipulationPlace?request=addRoutePlace">Add</a></li>
			                    <li><a href="routeManipulationPlace?request=modifyRoutePlace" id="busFare">Modify/Delete</a></li>
			              </ul>
			        </li>
		            <li><a href="#">News  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ></a>
		                 <ul>
		                    <li><a href="newsManipulation?request=addNews">Add</a></li>
	                    	<li><a href="newsManipulation?request=modifyNews" id="busFare">Modify/Delete</a></li>
		                 </ul>
		            </li>    
                    
              </ul>
            </li>

 			<li><a href="#">Employee</a>
	        	<ul>
                    <li><a href="selectEmployee">Add</a></li>
                    <li style="width: 230px;"><a href="removeEmployee">Remove</a></li>
                </ul>   
		    </li>
	        <li><a href="chargingModule">Charging</a></li>
            <li><a href="feedback">feedback</a></li>
                 
 			<li style="float: right"><a href="home" style="padding: 0px;">&nbsp;&nbsp;Employee Home&nbsp;&nbsp;</a></li>
			<li style="float: right"><a href="adminHome" style="padding: 0px;">&nbsp;&nbsp;Admin Home&nbsp;&nbsp;</a></li> 
		
            </ul>
        <br style="clear: left" />
</div> 
 --><!-- end of templatemo_menu -->
    
<!--     
<div id="menuTransportAdmin">
 <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="/ConsolidatedApp/jsp/transport/home" class="selected">Home</a></li>
              <li><a href="getBusFare" class="selected">Bus Fare</a></li>
  
  
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Entries<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
					<li><a href="transportTeam">Team</a></li>
					
					
					<li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">Route<span class="caret"></span></a>
		                <ul class="dropdown-menu" role="menu">
							 <li><a href="routeManipulationPlace?request=addRoutePlace">Add</a></li>
			                 <li><a href="routeManipulationPlace?request=modifyRoutePlace" id="busFare">Modify/Delete</a></li>
		                </ul>
		              </li>
		              
					
                    <li><a href="#" id="busFare">Bus Fare</a></li>
                    <li><a href="transportTeam" id="">Request Bus Pass</a></li>
                    <li><a href="cabBooking" id="">Request Cab Booking</a></li>
                </ul>
              </li>
            
              
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transport<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
					<li><a href="transportTeam">Team</a></li>
                    <li><a href="#" id="busFare">Bus Fare</a></li>
                    <li><a href="transportTeam" id="">Request Bus Pass</a></li>
                    <li><a href="cabBooking" id="">Request Cab Booking</a></li>
                </ul>
              </li>
			  <li><a href="userStats">Statistics</a></li>
			  <li><a href="faq">FAQs</a></li>
			  <li><a href="contactUs">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
	            <li>
	            	<sec:authorize access="hasRole('ROLE_ADMIN')">
				   		<a href="adminHome">
	            			Admin Panel
	            		</a>
					</sec:authorize>
	            </li>
	            <li>
			   		<a href="myDashboard">
	           			Inbox
	           		</a>
				</li>
            </ul>
          </div>
        </div>
      </nav>
  </div> -->
  
  
  
      
<!-- <div id="menuTransportAdmin">
 <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="/ConsolidatedApp/jsp/transport/home" class="selected">Home</a></li>
              <li><a href="getBusFare" class="selected">Bus Fare</a></li>
  
  
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Entries<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
					<li><a href="transportTeam">Team</a></li>
					
					
					<li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="true">Route<span class="caret"></span></a>
		                <ul class="dropdown-menu" role="menu">
							 <li><a href="routeManipulationPlace?request=addRoutePlace">Add</a></li>
			                 <li><a href="routeManipulationPlace?request=modifyRoutePlace" id="busFare">Modify/Delete</a></li>
		                </ul>
		              </li>
		              
					
                    <li><a href="#" id="busFare">Bus Fare</a></li>
                    <li><a href="transportTeam" id="">Request Bus Pass</a></li>
                    <li><a href="cabBooking" id="">Request Cab Booking</a></li>
                </ul>
              </li>
            
              
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transport<span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
					<li><a href="transportTeam">Team</a></li>
                    <li><a href="#" id="busFare">Bus Fare</a></li>
                    <li><a href="transportTeam" id="">Request Bus Pass</a></li>
                    <li><a href="cabBooking" id="">Request Cab Booking</a></li>
                </ul>
              </li>
			  <li><a href="userStats">Statistics</a></li>
			  <li><a href="faq">FAQs</a></li>
			  <li><a href="contactUs">Contact</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
	            <li>
	            	<sec:authorize access="hasRole('ROLE_ADMIN')">
				   		<a href="adminHome">
	            			Admin Panel
	            		</a>
					</sec:authorize>
	            </li>
	            <li>
			   		<a href="myDashboard">
	           			Inbox
	           		</a>
				</li>
            </ul>
          </div>
        </div>
      </nav>
  </div>
  
  
 -->