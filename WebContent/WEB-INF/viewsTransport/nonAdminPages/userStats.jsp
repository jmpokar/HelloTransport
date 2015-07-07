<%@page import="com.corporate.transportdb.dto.updated.RoutePlaceMappingUpdated"%>
<%@page import="java.util.List"%>
<%@page import="com.corporate.transportdb.domain.RouteDetailsHelper"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
			
		<%@ include file="../../../includes/transport/titleAndMeta.jsp" %>
	
		<!-- JQUERY -->
		<%@ include file="../../../includes/transport/jquery.jsp" %>

		<!-- BOOOTSTRAP -->
		<%@ include file="../../../includes/transport/bootstrap-css.jsp" %>
	
		<!-- MENUBAR STARTED -->
		<%@ include file="../../../includes/transport/menubar.jsp" %>
		<!-- MENUBAR ENDED -->	
		
		<!-- FEEDBACK PLUGIN START -->
		 <%@ include file="../../../includes/transport/feedbackPlugin.jsp" %>
		<!-- FEEDBACK PLUGIN END -->		
	
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN START -->
	    <%@ include file="../../../includes/transport/loopjTokenInput.jsp" %>
		<!-- LOOPJ DROPDOWN PLUGIN FOR TOKEN INPUT THAT APPEARS IN SEARCH DROPDOWN END -->
		
		<!-- BUTTON STYLE START -->
	 	<%@ include file="../../../includes/common/buttonStyle.jsp" %>
		<!-- BUTTON STYLE END -->
		
		
		<!-- FOR DROPDOWN START -->
		<!--   <style>		 
		    ol li {list-style: decimal outside;}
		    ul li { margin-left: 1em; }
		    ol li { margin-left: 1.25em; }
		    div.side-by-side { width: 100%; margin-bottom: 1em; }
		    div.side-by-side > div { float: left; width: 50%; }
		    div.side-by-side > div > em { margin-bottom: 10px; display: block; }
		    .clearfix:after {
		      content: "\0020";
		      display: block;
		      height: 0;
		      clear: both;
		      overflow: hidden;
		      visibility: hidden;
		    }
  		</style>-->
  		<link rel="stylesheet" href="../resources/transport/dropdown-charts/chosen.css" />      
  		<!-- FOR DROPDOWN END -->

		<!-- FOR LINE CHART START -->
		<script type="text/javascript">
			$(function () {
		        $('#container').highcharts({
		            chart: {
		                type: 'column'
		            },
		            title: {
		                text: '<%= request.getAttribute("chartTitle") %>'
		            },
		            subtitle: {
		                text: 'Source: <%= request.getAttribute("sourceName") %>'
		            },
		            xAxis: {
		                categories: <%= request.getAttribute("routeName") %>
		            },
		            yAxis: {
		                min: 0,
		                title: {
		                    text: 'Number Of Persons'
		                }
		            },
		            tooltip: {
		                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                    '<td style="padding:0"><b>{point.y:.0f} persons</b></td></tr>',
		                footerFormat: '</table>',
		                shared: true,
		                useHTML: true
		            },
		            plotOptions: {
		                column: {
		                    pointPadding: 0.2,
		                    borderWidth: 0
		                }
		            },		            
		            series: <%= request.getAttribute("barChart") %>
				});
			});
		</script>
		<script src="${pageContext.request.contextPath}/resources/transport/chart/js/highcharts.js"></script>
		<script src="${pageContext.request.contextPath}/resources/transport/chart/js/exporting.js"></script>
		<!-- FOR LINE CHART END -->	
		
		<!-- FOR BAR CHART START -->
		<script type="text/javascript">
			$(function () {
		    	// Radialize the colors
				Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function(color) {
				    return {
				        radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
				        stops: [
				            [0, color],
				            [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
				        ]
				    };
				});
				
				// Build the chart
		        $('#container1').highcharts({
		            chart: {
		                plotBackgroundColor: null,
		                plotBorderWidth: null,
		                plotShadow: false
		            },
		            title: {
		                text: '<%= request.getAttribute("chartTitle") %>'
		            },
		            tooltip: {
		        	    pointFormat: ' <span style="color:{series.color}"></span>{point.y}<br/>',
		            	percentageDecimals: 0
		            },
		            plotOptions: {
		                pie: {
		                    allowPointSelect: true,
		                    cursor: 'pointer',
		                    dataLabels: {
		                        enabled: true,
		                        color: '#000000',
		                        connectorColor: '#000000',
		                        formatter: function() {
		                            return '<b>'+ this.point.name +'</b> '+ '<b> ' +this.point.y +'</b> ';
		                        }
		                    },
		                    showInLegend: false
		                }
		            },
		            series: <%= request.getAttribute("pieChart") %>
		        });
		    });
		</script> 
		<!-- FOR BAR CHART END -->

		<!-- BUS FARE DIALOG START -->
		<%@ include file="../../../includes/transport/busFareDialog.jsp" %>
		<!-- BUS FARE DIALOG END -->
		
		<!-- APP SWITCH JS START -->
		<%@ include file="../../../includes/transport/topNavBar.jsp" %>
		<!-- APP SWITCH JS END -->
		
<!-- 		<script type="text/javascript">
	    $(document).ready(function(){
			if($("#appSelection").val()==0){
				$("#menuCarpool").css("display","none");
		    	$("#menuTransport").css("display","block");
			}else{
				$("#menuCarpool").css("display","block");
		    	$("#menuTransport").css("display","none");
			}
	    });
		</script> -->

	</head>

	<body id="home">
	
		<%@ include file="../../../includes/transport/topNavBarBody.jsp" %>
		<div id="templatemo_wrapper">
		 	<%@ include file="../../../includes/transport/busFareDialogBody.jsp" %>
		    <%@ include file="../../../includes/common/header.jsp" %>
		    <%@ include file="../../../includes/transport/userMenu.jsp" %>
		    
  			<div class="cleaner h20"></div>
		    <div style="margin: 20px;"></div>
		    <div id="templatemo_main_top"></div>
		    
		    <div id="templatemo_main">
    	                
        		<div id="content" style="width: 96%;">
        		<h2>Statistics</h2>
		        	
		        	<!-- CHART CRITERIA SELECTION START -->
		        	<div class="side-by-side clearfix">
						<%@ include file="../../../includes/transport/userStatsCriteria.jsp" %>
					</div>			
					<!-- CHART CRITERIA SELECTION END -->

					<!-- CHART RENDERING START -->
					<h2 style="font-size: 18px; padding-top: 50px;">Charts</h2>
					<div style="height: 20px;"></div>		
  					<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto; padding-bottom:50px; display: 
  						<c:if test="${barChartRender eq false}">none;</c:if>">
  					</div>
        			<div id="container1" style="min-width: 400px; height: 400px; margin: 0 auto; display: 
        				<c:if test="${pieChartRender eq false}">none;</c:if>">
        			</div> 
					<!-- CHART RENDERING END -->
          
		        </div> 
        		<div class="cleaner"></div>
    		</div>
			<%@ include file="../../../includes/transport/footer.jsp" %>
		</div>
		
 	</body>
</html>