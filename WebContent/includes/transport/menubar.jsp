<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/common/SimplejQueryDropdowns/css/style.css" type="text/css" media="screen, projection"/>
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/resources/common/SimplejQueryDropdowns/js/jquery.dropdownPlain.js"></script>
<link href="${pageContext.request.contextPath}/resources/common/appCSS/appStyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(document).ready(function(){
	if($("#appSelection").val()==0){
		$("#menuCarpool").css("display","none");
	   	$("#menuTransport").css("display","block");
	   	$("#header_right_transport").css("display","block");
	   	$("#header_right_carpool").css("display","none");
	}else{
		$("#menuCarpool").css("display","block");
	   	$("#menuTransport").css("display","none");
	   	$("#header_right_carpool").css("display","block");
	   	$("#header_right_transport").css("display","none");	   	
	}
});
</script>