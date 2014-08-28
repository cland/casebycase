
<%@ page import="com.cbc.Requestmap" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Requestmap')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-requestmap" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-requestmap" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="url" title="${message(code: 'requestmap.url.label', default: 'Url')}" />
					
						<g:sortableColumn property="configAttribute" title="${message(code: 'requestmap.configAttribute.label', default: 'Config Attribute')}" />
					
						<g:sortableColumn property="httpMethod" title="${message(code: 'requestmap.httpMethod.label', default: 'Http Method')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requestmapInstanceList}" status="i" var="requestmapInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requestmapInstance.id}">${fieldValue(bean: requestmapInstance, field: "url")}</g:link></td>
					
						<td>${fieldValue(bean: requestmapInstance, field: "configAttribute")}</td>
					
						<td>${fieldValue(bean: requestmapInstance, field: "httpMethod")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requestmapInstanceCount ?: 0}" />
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
