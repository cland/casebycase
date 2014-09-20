<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>CWAO: Home</title>
		<style type="text/css" media="screen">
			#status {
				background-color: #eee;
				border: .2em solid #fff;
				margin: 2em 2em 1em;
				padding: 1em;
				width: 12em;
				float: left;
				-moz-box-shadow: 0px 0px 1.25em #ccc;
				-webkit-box-shadow: 0px 0px 1.25em #ccc;
				box-shadow: 0px 0px 1.25em #ccc;
				-moz-border-radius: 0.6em;
				-webkit-border-radius: 0.6em;
				border-radius: 0.6em;
			}

			.ie6 #status {
				display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
			}

			#status ul {
				font-size: 0.9em;
				list-style-type: none;
				margin-bottom: 0.6em;
				padding: 0;
			}

			#status li {
				line-height: 1.3;
			}

			#status h1 {
				text-transform: uppercase;
				font-size: 1.1em;
				margin: 0 0 0.3em;
			}

			#page-body {
				margin: 0em 1em 1.25em 18em;
			}

			h2 {
				margin-top: 1em;
				margin-bottom: 0.3em;
				font-size: 1em;
			}

			p {
				line-height: 1.5;
				margin: 0.25em 0;
			}

			#controller-list ul {
				list-style-position: inside;
			}

			#controller-list li {
				line-height: 1.3;
				list-style-position: inside;
				margin: 0.25em 0;
			}

			@media screen and (max-width: 480px) {
				#status {
					display: none;
				}

				#page-body {
					margin: 0 1em 1em;
				}

				#page-body h1 {
					margin-top: 0;
				}
			}
			@media print{
				#page-body {marging:0;}
			}
			.li-tick {padding:5px;list-style-position:inside;
			list-style-image:url('${fam.icon(name: 'accept')}');
			font-size:0.9em;
			margin-bottom:10px;
			}
			.data-table .cell {width:50%;font-size:0.9em;padding:2px}
			.data-table .cell div.staff {border:solid 1px #EB8F2A;padding:5px;height:180px;}
			legend {font-weight:bold;color:#FFAE2F;font-size:1.2em;}
			h1 {font-weight:bold;font-size:1.3em;}
			
			img.wait {border:none;}
			.dataTable tr td {
				 border-bottom : solid 1px #FFDAB9;
				 padding: 5px 0 5px 0;
			}
		</style>
		<g:render template="head"></g:render>
	</head>
	<body>
		
		<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>	
		
		<div id="status1" class="leftbar" role="complementary">
			<g:render template="../layouts/sidenav"/>
		</div>
		<div id="page-body" role="main">	
			
			<div class="content float-left">
<%--			${com.cbc.Document.findByName('$home')?.content?.decodeHTML() }--%>
			<g:render template="example"/>
			</div>
			
		</div>
<script>
$(document).ready(function() {
	var ThisOfficeID = 0
	var today = new Date();
	var mon = (today.getMonth()+1);
	var year = today.getFullYear()
	//var frmdate = mon  + "/1/" + year
	//var todate =  mon + "/" + today.getDate()    + "/" + year
	var frmdate = "1/" +  mon  + "/" +  year
	var todate =  today.getDate()  + "/" + mon  + "/" + year
	var params =  "frmdate=" + frmdate + "&todate=" + todate + "&office=" + ThisOfficeID + "&sFor=cases,clients,events,activities"
	var url = "${resource()}/report/officeSummaryStats"
	loadStats(url,params,$("#statsmsg"))
	
	$("#accordion" ).accordion({ active: cbc_params.active_sidebar() });

	$("#tabs").tabs(
					{
					active:cbc_params.active_tab(),
					create: function (event,ui){	
						//executed after is created								
						$('#tabs').show()
					},
					show: function(event,ui){
						//on every tabs clicked
					},
					beforeLoad : function(event, ui) {
							ui.jqXHR.error(function() {
								ui.panel
								.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
							});
						}
			});		                
});  //end method ready(...)


function loadStats(actionUrl, params, dspEl){
	wait(true)
	 $.ajax({  
			   type: "post",  
				  url: actionUrl,
				  data: params,
				  timeout: 120000,  //20 sec
			   // callback handler that will be called on error
		        error: function(jqXHR, textStatus, errorThrown){
	            // log the error to the console	 		            		           
      			// console.log("The following error occured: "+ textStatus, errorThrown);
      			wait(false)
				 if(textStatus=="timeout") dspEl.html("Timeout: please try again."); else dspEl.html(textStatus + ": " + errorThrown);
				 		
    				},		
			   success: function(data) {  
			   		if (data.error != "" ){
			   			alert(data.error);
			   			wait(false)
			   			return
			   		}
				   	setDivValue("#new_clients",data.statsdata.num_new_clients)
				   	setDivValue("#active_clients",data.statsdata.num_clients)
				   	setDivValue("#active_ref_clients",data.statsdata.num_ref_clients)
				   	setDivValue("#new_cases",data.statsdata.num_new_cases)
				   	setDivValue("#active_cases",data.statsdata.num_cases)
				   	setDivValue("#active_cases_referred",data.statsdata.num_cases_referred)
					setDivValue("#closed_cases",data.statsdata.num_closed_cases)
					setDivValue("#ave_days_taken",data.statsdata.ave_days_taken)
					setDivValue("#active_actions",data.statsdata.num_actions)
					setDivValue("#active_events",data.statsdata.num_events)
			 		wait(false)
					},
				// callback handler that will be called on completion
			        // which means, either on success or error
		        complete: function(){
   				
			    }

		 });  
}

function setDivValue(id,value){
if($(id)) $(id).html(value)
}
function wait(flag) { var el = $(".wait"); if (flag) el.show(); else el.hide(); }

</script>	
	</body>
</html>
