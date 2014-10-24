
<%@ page import="com.cbc.Eviction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eviction.label', default: 'Eviction')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-eviction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-eviction" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'eviction.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'eviction.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="stayPeriod" title="${message(code: 'eviction.stayPeriod.label', default: 'Stay Period')}" />
					
						<g:sortableColumn property="networkMember" title="${message(code: 'eviction.networkMember.label', default: 'Network Member')}" />
					
						<g:sortableColumn property="specifyNetwork" title="${message(code: 'eviction.specifyNetwork.label', default: 'Specify Network')}" />
					
						<g:sortableColumn property="councillorRole" title="${message(code: 'eviction.councillorRole.label', default: 'Councillor Role')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${evictionInstanceList}" status="i" var="evictionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${evictionInstance.id}">${fieldValue(bean: evictionInstance, field: "lastUpdatedBy")}</g:link></td>
					
						<td>${fieldValue(bean: evictionInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: evictionInstance, field: "stayPeriod")}</td>
					
						<td>${fieldValue(bean: evictionInstance, field: "networkMember")}</td>
					
						<td>${fieldValue(bean: evictionInstance, field: "specifyNetwork")}</td>
					
						<td>${fieldValue(bean: evictionInstance, field: "councillorRole")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${evictionInstanceCount ?: 0}" />
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
