
<%@ page import="com.cbc.Case" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'case.label', default: 'Case')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="sidenav-public" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-case" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					here edit...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="list-case" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="caseNumber" title="${message(code: 'case.caseNumber.label', default: 'Case Number')}" />
					
						<g:sortableColumn property="subject" title="${message(code: 'case.subject.label', default: 'Subject')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'case.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="priority" title="${message(code: 'case.priority.label', default: 'Priority')}" />
					
						
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${caseInstanceList}" status="i" var="caseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${caseInstance.id}">${fieldValue(bean: caseInstance, field: "caseNumber")}</g:link></td>
					
						<td>${fieldValue(bean: caseInstance, field: "subject")}</td>
					
						<td>${fieldValue(bean: caseInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: caseInstance, field: "priority")}</td>				
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${caseInstanceCount ?: 0}" />
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
