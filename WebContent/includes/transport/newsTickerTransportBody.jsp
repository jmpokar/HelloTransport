<div id="newsticker-demo">    
	<div class="newsticker-jcarousellite">
		<ul>
			<c:choose>
				<c:when test="${listOfNews ne null && fn:length(listOfNews) gt 0}">
					<c:forEach var="news1" items="${listOfNews}">
						<c:if test="${ news1 ne null }">		
							<li>
								<div class="info" style="width: 300px; height: 60px; border-style: solid; border-bottom-color: gray; border-top-color: white; border-left-color: white; border-right-color: white; border-width: 1px;">
									<a href="allEvents?eventId=${ news1.newsId }"><em>${ news1.newsSubject }</em></a>
								</div>												
								<div class="clear"></div> 
							</li>
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<li>
					</li>
				</c:otherwise>
			</c:choose>
   		</ul>
	</div>
	<div class="title"><a href="allEvents">View all Events</a></div>
</div>