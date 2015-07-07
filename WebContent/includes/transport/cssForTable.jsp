<style type="text/css">		
	
	/* define height and width of scrollable area. Add 16px to width for scrollbar          */
	div.tableContainer {
		clear: both;
		border: 1px solid #963;
		height: 200px;
		overflow: auto;
		/* width: 756px */
	}
	
	/* Reset overflow value to hidden for all non-IE browsers. */
	html>body div.tableContainer {
		overflow: hidden;
		/* width: 756px */
	}
	
	/* define width of table. IE browsers only                 */
	div.tableContainer table {
		float: left;
		/* width: 740px; */
	}
	
	/* define width of table. Add 16px to width for scrollbar.           */
	/* All other non-IE browsers.                                        */
	html>body div.tableContainer table {
		/* width: 756px */
	}
	
	/* set table header to a fixed position. WinIE 6.x only                                       */
	/* In WinIE 6.x, any element with a position property set to relative and is a child of       */
	/* an element that has an overflow property set, the relative value translates into fixed.    */
	/* Ex: parent element DIV with a class of tableContainer has an overflow property set to auto */
	thead.fixedHeader tr {
		position: relative
	}
	
	/* set THEAD element to have block level attributes. All other non-IE browsers            */
	/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
	html>body thead.fixedHeader tr {
		display: block
	}
	
	/* make the TH elements pretty */
	thead.fixedHeader th {
		background: gray;
	/* 	border-left: 1px solid #EB8;
		border-right: 1px solid #B74;
		border-top: 1px solid #EB8;
	 */	font-weight: normal;
		padding: 4px 3px;
		text-align: left
	}
	
	/* make the A elements pretty. makes for nice clickable headers                */
	thead.fixedHeader a, thead.fixedHeader a:link, thead.fixedHeader a:visited {
		color: #FFF;
		display: block;
		text-decoration: none;
		width: 100%
	}
	
	/* make the A elements pretty. makes for nice clickable headers                */
	/* WARNING: swapping the background on hover may cause problems in WinIE 6.x   */
	thead.fixedHeader a:hover {
		color: #FFF;
		display: block;
		text-decoration: underline;
		width: 100%
	}
	
	/* define the table content to be scrollable                                              */
	/* set TBODY element to have block level attributes. All other non-IE browsers            */
	/* this enables overflow to work on TBODY element. All other non-IE, non-Mozilla browsers */
	/* induced side effect is that child TDs no longer accept width: auto                     */
	html>body tbody.scrollContent {
		display: block;
		height: 190px;
		overflow: auto;
		width: 100%
	}
	
	/* make TD elements pretty. Provide alternating classes for striping the table */
	/* http://www.alistapart.com/articles/zebratables/                             */
	tbody.scrollContent td, tbody.scrollContent tr.normalRow td {
		background: #FFF;
		border-bottom: none;
		border-left: none;
		border-right: 1px solid #CCC;
		border-top: 1px solid #DDD;
		padding: 2px 3px 3px 4px
	}
	
	tbody.scrollContent tr.alternateRow td {
		background: #EEE;
		border-bottom: none;
		border-left: none;
		border-right: 1px solid #CCC;
		border-top: 1px solid #DDD;
		padding: 2px 3px 3px 4px
	}
	
	/* define width of TH elements: 1st, 2nd, and 3rd respectively.          */
	/* Add 16px to last TH for scrollbar padding. All other non-IE browsers. */
	/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
	html>body thead.fixedHeader th {
		width: 200px
	}
	
	html>body thead.fixedHeader th + th {
		width: 240px
	}
	
	html>body thead.fixedHeader th + th + th {
		width: 316px
	}
	
	/* define width of TD elements: 1st, 2nd, and 3rd respectively.          */
	/* All other non-IE browsers.                                            */
	/* http://www.w3.org/TR/REC-CSS2/selector.html#adjacent-selectors        */
	html>body tbody.scrollContent td {
		width: 200px
	}
	
	html>body tbody.scrollContent td + td {
		width: 240px
	}
	
	html>body tbody.scrollContent td + td + td {
		width: 300px
	}		
</style>

<style type="text/css">	
	.customers {
		margin:0px;padding:0px;
		width:100%;
		box-shadow: 10px 10px 5px #888888;
		border:1px solid #11110a;
		
		-moz-border-radius-bottomleft:4px;
		-webkit-border-bottom-left-radius:4px;
		border-bottom-left-radius:4px;
		
		-moz-border-radius-bottomright:4px;
		-webkit-border-bottom-right-radius:4px;
		border-bottom-right-radius:4px;
		
		-moz-border-radius-topright:4px;
		-webkit-border-top-right-radius:4px;
		border-top-right-radius:4px;
		
		-moz-border-radius-topleft:4px;
		-webkit-border-top-left-radius:4px;
		border-top-left-radius:4px;
	}.customers table{
		width:100%;
		height:100%;
		margin:0px;padding:0px;
	}.customers tr:last-child td:last-child {
		-moz-border-radius-bottomright:4px;
		-webkit-border-bottom-right-radius:4px;
		border-bottom-right-radius:4px;
	}
	.customers table tr:first-child td:first-child {
		-moz-border-radius-topleft:4px;
		-webkit-border-top-left-radius:4px;
		border-top-left-radius:4px;
	}
	.customers table tr:first-child td:last-child {
		-moz-border-radius-topright:4px;
		-webkit-border-top-right-radius:4px;
		border-top-right-radius:4px;
	}.customers tr:last-child td:first-child{
		-moz-border-radius-bottomleft:4px;
		-webkit-border-bottom-left-radius:4px;
		border-bottom-left-radius:4px;
	}.customers tr:hover td{
		
	}
	.customers tr:nth-child(odd){ background-color:#cccccc; }
	.customers tr:nth-child(even)    { background-color:#ffffff; }.customers td{
		vertical-align:middle;
		
		
		border:1px solid #11110a;
		border-width:0px 1px 1px 0px;
		text-align:center;
		padding:9px;
		color:#000000;
	}.customers tr:last-child td{
		border-width:0px 1px 0px 0px;
	}.customers tr td:last-child{
		border-width:0px 0px 1px 0px;
	}.customers tr:last-child td:last-child{
		border-width:0px 0px 0px 0px;
	}
	.customers tr:first-child td{
			background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
		background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
	
		background-color:#252544;
		border:0px solid #11110a;
		text-align:center;
		border-width:0px 0px 1px 1px;
		color:#ffffff;
	}
	.customers tr:first-child:hover td{
		background:-o-linear-gradient(bottom, #252544 5%, #3a3a63 100%);	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #252544), color-stop(1, #3a3a63) );
		background:-moz-linear-gradient( center top, #252544 5%, #3a3a63 100% );
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr="#252544", endColorstr="#3a3a63");	background: -o-linear-gradient(top,#252544,3a3a63);
	
		background-color:#252544;
	}
	.customers tr:first-child td:first-child{
		border-width:0px 0px 1px 0px;
	}
	.customers tr:first-child td:last-child{
		border-width:0px 0px 1px 1px;
	}
</style>
