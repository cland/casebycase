
<%@ page import="com.cbc.Case" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'case.label', default: 'Case')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head"></g:render>
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
			<g:sideMenu default=""></g:sideMenu> 
		</div>
		<div id="list-case" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="case.thisevent.label" default="Thisevent" /></th>
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'case.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'case.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="amtRecovered" title="${message(code: 'case.amtRecovered.label', default: 'Amt Recovered')}" />
					
						<g:sortableColumn property="bestPractice" title="${message(code: 'case.bestPractice.label', default: 'Best Practice')}" />
					
						<g:sortableColumn property="caseNumber" title="${message(code: 'case.caseNumber.label', default: 'Case Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${caseInstanceList}" status="i" var="caseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${caseInstance.id}">${fieldValue(bean: caseInstance, field: "thisevent")}</g:link></td>
					
						<td>${fieldValue(bean: caseInstance, field: "lastUpdatedBy")}</td>
					
						<td>${fieldValue(bean: caseInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: caseInstance, field: "amtRecovered")}</td>
					
						<td><g:formatBoolean boolean="${caseInstance.bestPractice}" /></td>
					
						<td>${fieldValue(bean: caseInstance, field: "caseNumber")}</td>
					
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
