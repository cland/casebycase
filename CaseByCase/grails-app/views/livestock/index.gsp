
<%@ page import="com.cbc.Livestock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livestock.label', default: 'Livestock')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-livestock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-livestock" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'livestock.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'livestock.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="cat" title="${message(code: 'livestock.cat.label', default: 'Cat')}" />
					
						<g:sortableColumn property="chicken" title="${message(code: 'livestock.chicken.label', default: 'Chicken')}" />
					
						<g:sortableColumn property="cow" title="${message(code: 'livestock.cow.label', default: 'Cow')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'livestock.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${livestockInstanceList}" status="i" var="livestockInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${livestockInstance.id}">${fieldValue(bean: livestockInstance, field: "lastUpdatedBy")}</g:link></td>
					
						<td>${fieldValue(bean: livestockInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: livestockInstance, field: "cat")}</td>
					
						<td>${fieldValue(bean: livestockInstance, field: "chicken")}</td>
					
						<td>${fieldValue(bean: livestockInstance, field: "cow")}</td>
					
						<td><g:formatDate date="${livestockInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${livestockInstanceCount ?: 0}" />
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
