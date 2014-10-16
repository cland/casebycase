
<%@ page import="com.cbc.Race" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="Report" />
		<title><g:appTitle title=""><g:message code="default.reportpanel.label" default="Reports Panel" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
		<g:javascript library="jqueryfiledownload" />
		
		<g:render template="../layouts/icon_style"></g:render>
	</head>
	<body>
		<a href="#list-race" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					<g:message code="default.reportpanel.label" default="Reports Panel" />
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="list-race" class="content scaffold-list" role="main">
			
			<div class="page-header">
				<g:message code="default.reportpanel.label" default="Reports Panel" />
				<div class="action-div" ></div>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<fieldset><legend>Export Cases</legend>
				<div class="filter-div">
				
				<g:formRemote class="ExportForm" id="searchform" name="searchform"  url="[controller:'report',action:'export']" 				
				onSuccess="onSuccess(data)"
				onFailure="onFailure(data)">
					<fieldset class="form">
						<table class="dataTable">
						<tr><td>Select region:<span class="required-indicator">*</span></td><td>
							<g:select name="region.id" from="${com.cbc.location.Region.list()}" optionKey="id" value=""  required="" noSelection="['':'-select region-']"/>
						</td></tr>
						<tr>
							<td>Date opened: (Optional)</td>
							<td>
								From: <g:textField name="startDate_open" class="datepick_single_future" id="start-date" value=""/> &nbsp;
								To: <g:textField name="endDate_open" class="datepick_single_future" id="end-date" value=""/>	
							</td>
						</tr>						

					</table>
					

					<g:submitButton id="export_btn" name="export" class="export" onclick="exportReport('export');return false" value="Search & Export" />
					

					</fieldset>

				</g:formRemote>	
			</div>
			</fieldset>
			
		</div>
		<script>
			function onSuccess(data){
			}
			function onFailure(data){
			}
			$(document).ready(function() {		
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

				$("#export_btn").on("click", "form.ExportForm", function() {
					$("#clicked-button").prop("value",'export');
			        $.fileDownload($(this).attr('href'), {
			            preparingMessageHtml: "We are preparing your report, please wait...",
			            failMessageHtml: "There was a problem generating your report, please try again."
			        });
			        return false; //this is critical to stop the click event which will trigger a normal file download!
			    });
				
				var today=new Date();
				 $( "#start-date" ).datepicker({
					 dateFormat: "dd-M-yy",
						maxDate:"+0",
						defaultDate: new Date(today.getFullYear(), today.getMonth()-6, today.getDate()),
						onSelect: function(dateText, inst) {
						      // var actualDate = new Date(dateText);
						      // var newDate = new Date(actualDate.getFullYear(), actualDate.getMonth(), actualDate.getDate()+1);
						      //  $('#end-date').datepicker('option', 'minDate', newDate );
						  }
					 });
				 $( "#end-date" ).datepicker({
					 	dateFormat: "dd-M-yy",
						maxDate:"+0",
						defaultDate: new Date(),
						onSelect: function(dateText, inst) {
							//make sure that start-date is less that end-date  
						  }
					 });	                
			});  
			function exportReport(button){
				$("#clicked-button").prop("value",button);
				var _form = $("#searchform");
		        $.fileDownload(_form.prop('action'), {
		            preparingMessageHtml: "We are preparing your report, please wait...",
		            failMessageHtml: "There was a problem generating your report, please try again.",
		            httpMethod: "POST",            
		            data: _form.serialize()
		        }).done(function(){
		            console.log("Success...");
		          	 $(".ui-dialog-content").html("<span>Done!</span>");
		           });
		        return false; //this is critical to stop the click event which will trigger a normal file download!
			}
		</script>		
	</body>
</html>
