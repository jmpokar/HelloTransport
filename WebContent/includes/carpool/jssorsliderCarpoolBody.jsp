	<!-- Jssor Slider Begin -->
    <!-- You can move inline styles to css file or css block. -->
    <div id="sliderb_container" style="position: relative; width: 600px;
        height: 300px; overflow: hidden;">

        <!-- Loading Screen -->
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(../../resources/common/images/misc/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

        <!-- Slides Container -->
  		<div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 600px; height: 300px;
            overflow: hidden;" id="slidesCarpool">
            
            <div>
                <img u=image src="../../resources/common/images/imageSliderAtTestimonialPage/a1.png" />
                <div u="thumb"><!-- Do you notice it is draggable by mouse/finger? --></div>
            </div>
            <div>
                <img u=image src="../../resources/common/images/imageSliderAtTestimonialPage/b1.png" />
                <div u="thumb"><!-- Did you drag by either horizontal or vertical? --></div>
            </div>
            <div>
                <img u=image src="../../resources/common/images/imageSliderAtTestimonialPage/c1.png" />
                <div u="thumb"><!-- Do you notice navigator responses when drag? --></div>
            </div>
            <div>
                <img u=image src="../../resources/common/images/imageSliderAtTestimonialPage/d1.png" />
                <div u="thumb"><!-- Do you notice arrow responses when click? --></div>
            </div>
            <div>
                <img u=image src="../../resources/common/images/imageSliderAtTestimonialPage/e1.png" />
                <div u="thumb"><!-- Do you notice arrow responses when click? --></div>
            </div>
            
        </div>




       <!--  <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 600px; height: 300px;
            overflow: hidden;" id="slidesCarpool">
            
            <div>
                <img u=image src="../resources/common/images/imageSliderAtTestimonialPage/a1.png" />
                <div u="thumb">Do you notice it is draggable by mouse/finger?</div>
            </div>
            <div>
                <img u=image src="../resources/common/images/imageSliderAtTestimonialPage/b1.png" />
                <div u="thumb">Did you drag by either horizontal or vertical?</div>
            </div>
            <div>
                <img u=image src="../resources/common/images/imageSliderAtTestimonialPage/c1.png" />
                <div u="thumb">Do you notice navigator responses when drag?</div>
            </div>
            <div>
                <img u=image src="../resources/common/images/imageSliderAtTestimonialPage/d1.png" />
                <div u="thumb">Do you notice arrow responses when click?</div>
            </div>
            <div>
                <img u=image src="../resources/common/images/imageSliderAtTestimonialPage/e1.png" />
                <div u="thumb">Do you notice arrow responses when click?</div>
            </div>
            
        </div> -->


        <!-- ThumbnailNavigator Skin Begin -->
        <div u="thumbnavigator" class="sliderb-T" style="position: absolute; bottom: 0px; left: 0px; height:45px; width:600px;">
            <div style="filter: alpha(opacity=40); opacity:0.4; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
            </div>
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides">
                <div u="prototype" style="POSITION: absolute; WIDTH: 600px; HEIGHT: 45px; TOP: 0; LEFT: 0;">
                    <div u="thumbnailtemplate" style="font-family: verdana; font-weight: normal; POSITION: absolute; WIDTH: 100%; HEIGHT: 100%; TOP: 0; LEFT: 0; color:#fff; line-height: 45px; font-size:20px; padding-left:10px;"></div>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- ThumbnailNavigator Skin End -->
        
        <!-- Bullet Navigator Skin Begin -->
        <!-- jssor slider bullet navigator skin 01 -->
        <style>
            /*
            .jssorb01 div           (normal)
            .jssorb01 div:hover     (normal mouseover)
            .jssorb01 .av           (active)
            .jssorb01 .av:hover     (active mouseover)
            .jssorb01 .dn           (mousedown)
            */
            .jssorb01 div, .jssorb01 div:hover, .jssorb01 .av
            {
                filter: alpha(opacity=70);
                opacity: .7;
                overflow:hidden;
                cursor: pointer;
                border: #000 1px solid;
            }
            .jssorb01 div { background-color: gray; }
            .jssorb01 div:hover, .jssorb01 .av:hover { background-color: #d3d3d3; }
            .jssorb01 .av { background-color: #fff; }
            .jssorb01 .dn, .jssorb01 .dn:hover { background-color: #555555; }
        </style>
        <!-- bullet navigator container -->
        <div u="navigator" class="jssorb01" style="position: absolute; bottom: 16px; right: 10px;">
            <!-- bullet navigator item prototype -->
            <div u="prototype" style="POSITION: absolute; WIDTH: 12px; HEIGHT: 12px;"></div>
        </div>
        <!-- Bullet Navigator Skin End -->
        
        <!-- Arrow Navigator Skin Begin -->
        <style>
            /* jssor slider arrow navigator skin 05 css */
            /*
            .jssora05l              (normal)
            .jssora05r              (normal)
            .jssora05l:hover        (normal mouseover)
            .jssora05r:hover        (normal mouseover)
            .jssora05ldn            (mousedown)
            .jssora05rdn            (mousedown)
            */
            .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn
            {
            	position: absolute;
            	cursor: pointer;
            	display: block;
                background: url(../../resources/common/images/misc/a17.png) no-repeat;
                overflow:hidden;
            }
            .jssora05l { background-position: -10px -40px; }
            .jssora05r { background-position: -70px -40px; }
            .jssora05l:hover { background-position: -130px -40px; }
            .jssora05r:hover { background-position: -190px -40px; }
            .jssora05ldn { background-position: -250px -40px; }
            .jssora05rdn { background-position: -310px -40px; }
        </style>
        <!-- Arrow Left -->
        <span u="arrowleft" class="jssora05l" style="width: 40px; height: 40px; top: 123px; left: 8px;">
        </span>
        <!-- Arrow Right -->
        <span u="arrowright" class="jssora05r" style="width: 40px; height: 40px; top: 123px; right: 8px">
        </span>
        <!-- Arrow Navigator Skin End -->
        <a style="display: none" href="http://www.jssor.com">Image Slider</a>
        <!-- Trigger -->
    </div>
    <!-- Jssor Slider End -->