
<%@ page import="com.cbc.Document" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'document.label', default: 'Document')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-document" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-document" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'document.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="content" title="${message(code: 'document.content.label', default: 'Content')}" />
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'document.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'document.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="docType" title="${message(code: 'document.docType.label', default: 'Doc Type')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'document.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${documentInstanceList}" status="i" var="documentInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${documentInstance.id}">${fieldValue(bean: documentInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: documentInstance, field: "content")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "lastUpdatedBy")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: documentInstance, field: "docType")}</td>
					
						<td><g:formatDate date="${documentInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${documentInstanceCount ?: 0}" />
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
