<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en"  xmlns:fb="http://ogp.me/ns/fb#">
  <head>

	<style type="text/css">
	
	.container {
	position: relative;
	width: 995px;
	margin: 0 auto 0 auto;
	}
	
	
	.container:before, .container:after {
	display: table;
	content: "";
	}
	
	
	.search-area {
	height: 100%;
	z-index: 160;
	position: absolute;
	top: 0;
	height: 300px;
	width: 100%;
	padding-top: 140px;
	text-shadow: 0 0 15px rgba(0,0,0,0.6),0 -1px 1px rgba(0,0,0,0.6);
	}

	
 	#slideshow li>img {
	position: relative;
	left: 50%;
	margin-left: -800px;
	}


	
	#slideshow li {
	position: absolute;
	z-index: 80;
	height: 100%;
	width: 100%;
	overflow: hidden;
	/* background: #000; */
	}

	#slideshow {
	margin: 0;
	}
	
	
	ul, ol {
	padding: 0;
	margin: 0 0 9px 25px;
	}


	#hero {
	z-index: 1;
	position: relative;
	height: 700px;
	margin-top: -18px;
	margin-bottom: 53px;
	display: none;
	text-shadow: 0 -1px 1px rgba(0,0,0,0.6);
	}

	

	body {
	margin: 0;
	font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
	font-size: 13px;
	line-height: 18px;
	color: #393c3d;
	background-color: #fff;
	-webkit-font-smoothing: antialiased;
	}
	
	#location {
	width: 340px;
	}

	.search-area input[type="text"] {
	float: left;
	height: 23px;
	margin: 0;
	width: 110px;
	-webkit-box-shadow: inset 1px 1px 5px rgba(0,0,0,0.4);
	box-shadow: inset 1px 1px 5px rgba(0,0,0,0.4);
	}


	.search-area .input-wrapper {
	margin-right: 4px;
	position: relative;
	float: left;
	}

	.search-area h1 {
	font-size: 28px;
	margin-bottom: 8px;
	}
	
	.search-area h1, .search-area h2 {
	/* color: #fff; */
	line-height: 1.2;
	}
		
	.search-area form {
	background: rgba(57,60,61,0.8);
	-webkit-box-shadow: 0 0 5px rgba(0,0,0,0.5);
	box-shadow: 0 0 5px rgba(0,0,0,0.5);
	-moz-border-radius: 3px;
	-webkit-border-radius: 3px;
	border-radius: 3px;
	border: 1px solid rgba(0,0,0,0.8);
	padding: 4px;
	line-height: 1.2;
	}

	
	.btn.pink:hover, .btn.pink.hover {
	text-decoration: none;
	color: black;
/* 	background-color: #e1117d; */
/* 	background-image: -webkit-linear-gradient(top, #f757aa 0%,#e1117d 100%);
	background-image: -moz-linear-gradient(top, #f757aa 0%,#e1117d 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff757aa', endColorstr='#ffe1117d', GradientType=0); */
	}



.btn.large {
line-height: normal;
font-size: 15px;
padding: 0.6em 1.3em;
}

/* .btn.pink {
background-color: #e1117d;
background-image: -webkit-linear-gradient(top, #f52691 0%,#e1117d 100%);
background-image: -moz-linear-gradient(top, #f52691 0%,#e1117d 100%);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fff52691', endColorstr='#ffe1117d', GradientType=0);
border: 1px solid rgba(0,0,0,0.2);
border-color: #ea1282 #cb1272 #bb0e68 #cb1272;
color: white;
} */



.position-left {
float: left;
}

.btn {
font-weight: bold;
display: inline-block;
padding: 0.4em 1.2em;
-webkit-box-sizing: border-box;
-moz-box-sizing: border-box;
box-sizing: border-box;
text-align: center;
font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
text-transform: uppercase;
vertical-align: middle;
margin-bottom: 0;
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
-webkit-box-shadow: inset 0 0 0.2em rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.2),0 0 0 #000;
box-shadow: inset 0 0 0.2em rgba(255,255,255,0.2),0 1px 2px rgba(0,0,0,0.2),0 0 0 #000;
background-color: #018fe1;
background-image: -webkit-linear-gradient(top, #00aeff 0%,#018fe1 100%);
background-image: -moz-linear-gradient(top, #00aeff 0%,#018fe1 100%);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff00aeff', endColorstr='#ff018fe1', GradientType=0);
border: 1px solid rgba(0,0,0,0.2);
border-color: #0195eb #0083c7 #0175b8 #0083c7;
font-size: 12px;
line-height: 16px;
color: #fff;
text-shadow: 0 -1px 0px rgba(0,0,0,0.2);
}


.search-area input[type='text'], .search-area .dropdown {
border: 1px solid #000;
text-shadow: 0 1px 1px #fff;
padding: 8px 12px;
font-size: 17px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
border-radius: 3px;
}

.search-area input[type="text"]  {
float: left;
height: 23px;
margin: 0;
width: 110px;
-webkit-box-shadow: inset 1px 1px 5px rgba(0,0,0,0.4);
box-shadow: inset 1px 1px 5px rgba(0,0,0,0.4);
}


.search-area input[type='password'], .search-area .dropdown {
border: 1px solid #000;
text-shadow: 0 1px 1px #fff;
padding: 8px 12px;
font-size: 17px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
border-radius: 3px;
}

.search-area input[type="password"]  {
float: left;
height: 23px;
margin: 0;
width: 110px;
-webkit-box-shadow: inset 1px 1px 5px rgba(0,0,0,0.4);
box-shadow: inset 1px 1px 5px rgba(0,0,0,0.4);
}
 
	
</style>

  		<!-- DIALOG START -->			
			<script type="text/javascript" src="resources/dialogBox/jquery-1.7.2.js"></script>
			<script type="text/javascript" src="resources/dialogBox/highlight.js"></script>			
			<link rel="stylesheet" href="resources/dialogBox/zebra_dialog.css" type="text/css" />
			<script type="text/javascript" src="resources/dialogBox/zebra_dialog.js"></script>
			<script type="text/javascript" src="resources/dialogBox/functions.js"></script>
		<!-- DIALOG END -->


  </head>
  <body>
<%--     	<% if(request.getParameter("logout")!=null){ %>	
		
		<script type="text/javascript">
			var logoutResult = "<%=request.getParameter("logout")%>";
			if(logoutResult == "success"){
				alert("You are logged out successfully");
			}else{
				alert("You are not logged out successfully");
			}
		</script>  
	
	<% } %> --%>

	<!-- NOTIFICATION STARTED -->
	<% if(request.getAttribute("logout")!=null){ %>	
		<script type="text/javascript">
			var status = "<%=request.getAttribute("logout")%>";
			if(status == "success"){
				$(document).ready(function() {
				 	 $.Zebra_Dialog('You are logged out successfully', {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
				
			}else{
				$(document).ready(function() {
				 	 $.Zebra_Dialog('Error!!! Please try Logging out again....', {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
			}
			
		</script>  
	<% } %>
		
	<% if(request.getParameter("logout")!=null){ %>	
		<script type="text/javascript">
			var status = "<%=request.getParameter("logout")%>";
			if(status == "success"){
				$(document).ready(function() {
				 	 $.Zebra_Dialog('You are logged out successfully', {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
				
			}else{
				$(document).ready(function() {
				 	 $.Zebra_Dialog('Error!!! Please try Logging out again....', {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
			}
			
		</script>  
	<% } %>
	
	<% if(request.getParameter("status")!=null){ %>		
		<script type="text/javascript">
			var status = "<%=request.getParameter("status")%>";
		
			if(status == "1"){
				$(document).ready(function() {
				 	 $.Zebra_Dialog('Either Email Id or Password is Invalid.', {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
			}
			
			if(status == "2"){
				$(document).ready(function() {
				 	 $.Zebra_Dialog('LDAPConnectivityException Invalid.', {
				  		'type':  'information',
				    	'title': 'Status'
					  });
				});
			}
			
		</script>  
	<% } %>
	
	<!-- NOTIFICATION ENDED -->
				
		
  <ul class="unstyled" id="slideshow">
      <li class="active" data-slide-type="search_intro" data-bg-opacity="0.5">
      <center><img  src="resources/common/images/logo/activeLoginBanner.png" height="752" width="1111" style="left: 100px; position: relative; padding-top: 0px;"></center>   
      </li>
  </ul>

  <div class="search-area">

    
    <div class="container" style="padding-left: 80px; padding-top: 230px;">
    	<!-- <img alt="" src="resources/images/137673727690938.gif" style="float: center; padding-bottom: 20px;"> -->
        <!-- <h1>Explore Our Transport Facilities.</h1> -->
      <h1>Login.</h1> 
 
      <form action="<%= request.getContextPath() %>/j_spring_security_check" method="post" id="search_form" class="custom show-search-options position-left">
        <div class="input-wrapper">
          <!-- <input type="text" class="location" autocomplete="off" id="location" name="j_username" placeholder="Enter Email Id" /> -->
          <input type="text" class="location" id="location" name="j_username" placeholder="Enter Email Id"  />
        </div>

        <div class="input-wrapper">
          <input type="password" class="location" autocomplete="off" id="location" name="j_password" placeholder="Enter Password"  />
        </div>

        
		<button type="submit" class="large pink btn icon-and-text position-left" id="submit_location" style="background: #018fe1;">
          <i class="icon icon-search"></i> Login
        </button>
        
      </form>
    </div>
  </div>




</body>

<!-- COMMENTING AS ALERT IS HANDLED ABOVE -->

<%--  	<% if(request.getParameter("logout")!=null){ %>	
		
		<script type="text/javascript">
			var logoutResult = "<%=request.getParameter("logout")%>";
			if(logoutResult == "success"){
				alert("You are logged out successfully");
			}else{
				alert("You are not logged out successfully");
			}
		</script>  
	
	<% } %>  --%>

<%-- 	<% if(request.getParameter("status")!=null){ %>	
		
		<script type="text/javascript">
			var logoutResult = "<%=request.getParameter("status")%>";
			
			if(logoutResult == "1"){
				alert("Either Email Id or Password is Invalid.");
			}
			
			if(logoutResult == "2"){
				alert("Credentials Expired");
			}
			
			if(logoutResult == "3"){
				alert("Account Locked");
			}
			
			if(logoutResult == "4"){
				alert("Account Disabled");
			}
			
			if(logoutResult == "5"){
				alert("LDAP Connectivity Issue");
			}
		</script>  
	
	<% } %> --%>
 	
</html>