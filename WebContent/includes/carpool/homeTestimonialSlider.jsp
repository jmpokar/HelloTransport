<!-- TESTIMONIAL SLIDER START -->	
 <style type="text/css">
	#quotes{
		margin:0;
		padding:70px 380px 190px 10px;
		font-size:20px;
		position:relative;
	}
	.textItem{
		position:absolute;
		display:none;
	}
	a{
		color:#000;
	}
	
	/*
		.numberCircle {
	    -webkit-border-radius: 999px;
	    -moz-border-radius: 999px;
	    border-radius: 999px;
	    behavior: url(PIE.htc);
	    width: 36px;
	    height: 36px;
	    padding: 8px;
	    background: #fff;
	    border: 2px solid #666;
	    color: #666;
	    text-align: center;
	    font: 32px Arial, sans-serif
	}
		*/			
	.circular-label { overflow: hidden; z-index: 100; vertical-align: middle; 
                 font-size: 11px; -webkit-box-shadow:0 3px 3px rgba(0,0,0,0.2); 
                -moz-box-shadow:0 3px 3px rgba(0,0,0,0.2); 
                 box-shadow: 3px 3px 3px rgba(0,0,0,0.2); 
          }
		.label-inner { width: 95%; height: 105%; -moz-border-radius: 50%; 
               -webkit-border-radius: 50%; border-radius: 50%; 
                border: 2px dotted white; vertical-align: middle; 
                margin: auto; top: -10%; position: relative; overflow: hidden; 
          }
		.label-inner > span {
			display: table; text-align: center; vertical-align: middle; 
              font-weight: bold; text-transform: uppercase;  width: 100%;                                        
              position: absolute; margin: auto; margin-top: 38%; 
              font-family: 'ProximaNovaLtSemibold'; font-size: 13px;  
              line-height: 1.0em; 
          }
		.circular-label.label-size-large { width: 120px; height: 120px; 
        		-moz-border-radius: 55px; -webkit-border-radius: 55px; 
         		border-radius: 75px; margin-top:-55px;
         	} 
		.circular-label.label-size-med { width: 76px; height: 76px; 
        		-moz-border-radius: 38px; -webkit-border-radius: 38px; 
         		border-radius: 38px; margin-top:-38px;
         	} 
		.circular-label.label-size-med .label-inner > span {margin-top: 33%; }
		.circular-label.label-size-small { width: 66px; height: 66px; 
        		-moz-border-radius: 33px; -webkit-border-radius: 33px;
         		border-radius: 33px; margin-top:-33px; 
         	}
	label {
		font-family: 'Alegreya', serif;
		font-size: 15px;
		color: #787878;
		font-weight: 0;
		line-height: 20px;
		font-style: italic;
	}
</style>
	
<script type="text/javascript">
	$(document).ready(function(){
		setupRotator();
	});	
	function setupRotator(){
		if($('.textItem').length > 1){
			$('.textItem:first').addClass('current').fadeIn(1000);
			setInterval('textRotate()', 3000);
		}
	}
	function textRotate(){
		var current = $('#quotes > .current');
		if(current.next().length == 0){
			current.removeClass('current').fadeOut(1000);
			$('.textItem:first').addClass('current').fadeIn(1000);
		}else{
			current.removeClass('current').fadeOut(1000);
			current.next().addClass('current').fadeIn(1000);
		}
	}
</script>
<!-- TESTIMONIAL SLIDER END -->