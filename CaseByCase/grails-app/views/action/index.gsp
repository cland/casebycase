
<%@ page import="com.cbc.Action" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'action.label', default: 'Action')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-action" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					Actions
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="list-action" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="dataTable">
			<thead>
					<tr>					
						<g:sortableColumn property="date" title="${message(code: 'action.date.label', default: 'Date')}" />																
						<g:sortableColumn property="subject" title="${message(code: 'action.subject.label', default: 'Action')}" />								
						<g:sortableColumn property="followUpStatus" title="${message(code: 'action.followUpStatus.label', default: 'Follow Up Status')}" />
						<g:sortableColumn property="actionOwner" title="${message(code: 'action.actionowner.label', default: 'Assigned Agent')}" />
										
						<g:sortableColumn property="caseNumber" title="${message(code: 'action.casenumber.label', default: 'Case Number')}" />					
					</tr>
				</thead>
				<tbody>
				<g:each in="${actionInstanceList}" status="i" var="actionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${actionInstance.id}">${fieldValue(bean: actionInstance, field: "date")}</g:link></td>
						<td>${fieldValue(bean: actionInstance, field: "subject")}</td>
						<td>${fieldValue(bean: actionInstance, field: "followUpStatus")}</td>
						<td>${actionInstance?.actionOwner}</td>
										
						<td>
							<g:if test="${actionInstance?.thiscase}">
							<g:link action="show" controller="case" id="${actionInstance?.thiscase?.id}">${actionInstance?.thiscase}</g:link>
							</g:if>
						</td>					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${actionInstanceCount ?: 0}" />
			</div>
		</div>
		<script>
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
			});  
		</script>		
	</body>
</html>
