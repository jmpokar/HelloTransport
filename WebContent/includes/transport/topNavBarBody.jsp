<sec:authorize var="loggedIn" access="isAuthenticated()" />
<nav class="navbar-default-custom navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="#"></a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${loggedIn}">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><%= request.getUserPrincipal().getName() %><span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="<c:url value="/j_spring_security_logout"/>">Sign
										Out</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<li><a href="../../login.jsp" id="login"
							style="color: black;"> <b>Login</b>
						</a></li>
						<li><a href="../../login.jsp" id="login"
							style="color: black;"> <b>Register</b>
						</a></li>
					</c:otherwise>
				</c:choose>
				<!--
				<li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Transport <span class="caret"></span></a>
	                <ul class="dropdown-menu" role="menu">
	                  <li><a href="#">Carpool</a></li>
	                </ul>
              	</li> -->
				<li>
					<select class="dropDownApp" name="appSelection"
						id="appSelection">
							<option value="0" selected="selected">Transport</option>
							<option value="1">Carpool</option>
					</select>
				</li>
			</ul>
		</div>
	</div>
</nav>