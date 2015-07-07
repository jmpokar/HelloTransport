<script src="${pageContext.request.contextPath}/resources/transport/feedbackAtHomePage/jquery.quick-feedback.js" type="text/javascript" charset="utf-8"></script>
<script>
$(document).ready(function() {
      $('body').feedbackTab({tab2: true, tab3: true, tab4: true, feedbackAction: 'general.jsp', tab2Action: 'suggestion.jsp', tab3Action: 'problem.jsp', tab4Action: 'praise.jsp' });
});
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/transport/feedbackAtHomePage/jquery.quick-feedback.css" type="text/css" charset="utf-8" />
