$(function(){
			
		//kwicks begin
		$('.kwicks').kwicks({
		   min : 60,
		   spacing : 0,
		   sticky : true,
		   defaultKwick:0,
		   event : 'click'
		});
		$('a').click(function(){
			page=$(this).attr('href');
			if (page.substr(page.indexOf('#'),6)=='#page_') {
				$('.kwicks '+page).click();
				return false;
			}
		});
		// initiate tool tip
		$('.normaltip').aToolTip();
});
