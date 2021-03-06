
<%@ page import="com.cbc.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					Staff List
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="list-user" class="content scaffold-list" role="main">
			
			<div class="page-header">
				<g:message code="default.list.label" args="['Staff']" />
				<div class="action-div" ><g:link controller="user" action="create" >New Staff</g:link></div>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="dataTable">
			<thead>
					<tr>
						<g:sortableColumn property="person.firstName" title="${message(code: 'person.firstName.label', default: 'Name')}" />				
						<g:sortableColumn property="person.lastName" title="${message(code: 'person.lastName.label', default: 'Surname')}" />					
						<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Login Name')}" />
						<g:sortableColumn property="email" title="${message(code: 'user.email.label', default: 'Email')}" />
						<g:sortableColumn property="person.office" title="${message(code: 'person.office.label', default: 'Office')}" />		
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${fieldValue(bean: userInstance, field: "person.firstName")}</td>
						<td>${fieldValue(bean: userInstance, field: "person.lastName")}</td>
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
						<td>${fieldValue(bean: userInstance, field: "email")}</td>
						<td>${fieldValue(bean: userInstance, field: "person.office")}</td>	
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
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
