<script type="text/javascript">
   $(document).ready(function(){
       $(".dropdown").hover(            
           function() {
               $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
               $(this).toggleClass('open');        
           },
           function() {
               $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
               $(this).toggleClass('open');       
           }
       );
   });
</script>

<script type="text/javascript">
  	$(document).ready(function(){
		$("#appSelection").on('change', function() {
		    if(this.value==0){ //TRANSPORT
		    	document.location.href = "${pageContext.request.contextPath}/jsp/transport/home";		    	
		    }else{ //CARPOOL
		    	document.location.href = "${pageContext.request.contextPath}/jsp/carpool/dashboard/home";
		    }
		});
	});
</script>

<style type="text/css">
	.dropDownApp{	
		display: block;
		width: 100%;
		height: 34px;
		padding: 6px 12px;
		font-size: 14px;
		line-height: 1.428571429;
		color: #555;
		vertical-align: middle;
		background-color: #fff;
		background-image: none;
		border: 1px solid #ccc;
		border-radius: 4px;
		margin-top: 7px;
	}
</style>
       
<style type="text/css">
    .navbar-fixed-top{
		background: #fff;
		border-bottom: solid 1px #d7d7d7;
    }
</style>

<script type="text/javascript">    	
   $(document).ready(function(){
	if(window.location.pathname.indexOf("/transport/")>=0){
		
		$("#menuCarpool").css("display","none");
    	$("#menuTransport").css("display","block");
    
    	$("#header_right_transport").css("display","block");
    	$("#header_right_carpool").css("display","none");
    	
    	$('#appSelection option[value="0"]').attr("selected", "selected");
    	
	}else{
		$("#menuCarpool").css("display","block");
    	$("#menuTransport").css("display","none");		    	
    	
    	$("#header_right_carpool").css("display","block");
    	$("#header_right_transport").css("display","none");
    	
    	$('#appSelection option[value="1"]').attr("selected", "selected");
	}
   });
</script>       