
<%@ page import="com.cbc.Funder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'funder.label', default: 'Funder')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-funder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-funder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="workNumber" title="${message(code: 'funder.workNumber.label', default: 'Work Number')}" />
					
						<g:sortableColumn property="cellphone" title="${message(code: 'funder.cellphone.label', default: 'Cellphone')}" />
					
						<g:sortableColumn property="amount" title="${message(code: 'funder.amount.label', default: 'Amount')}" />
					
						<g:sortableColumn property="periodFrom" title="${message(code: 'funder.periodFrom.label', default: 'Period From')}" />
					
						<g:sortableColumn property="periodTo" title="${message(code: 'funder.periodTo.label', default: 'Period To')}" />
					
						<g:sortableColumn property="funderType" title="${message(code: 'funder.funderType.label', default: 'Funder Type')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${funderInstanceList}" status="i" var="funderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${funderInstance.id}">${fieldValue(bean: funderInstance, field: "workNumber")}</g:link></td>
					
						<td>${fieldValue(bean: funderInstance, field: "cellphone")}</td>
					
						<td>${fieldValue(bean: funderInstance, field: "amount")}</td>
					
						<td><g:formatDate date="${funderInstance.periodFrom}" /></td>
					
						<td><g:formatDate date="${funderInstance.periodTo}" /></td>
					
						<td>${fieldValue(bean: funderInstance, field: "funderType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${funderInstanceCount ?: 0}" />
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
