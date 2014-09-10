
<%@ page import="com.cbc.Labour" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'labour.label', default: 'Labour')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-labour" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-labour" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'labour.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'labour.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="tradeUnionMember" title="${message(code: 'labour.tradeUnionMember.label', default: 'Trade Union Member')}" />
					
						<g:sortableColumn property="employerDetail" title="${message(code: 'labour.employerDetail.label', default: 'Employer Detail')}" />
					
						<g:sortableColumn property="unionAtWork" title="${message(code: 'labour.unionAtWork.label', default: 'Union At Work')}" />
					
						<g:sortableColumn property="memberOfWorkUnion" title="${message(code: 'labour.memberOfWorkUnion.label', default: 'Member Of Work Union')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${labourInstanceList}" status="i" var="labourInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${labourInstance.id}">${fieldValue(bean: labourInstance, field: "lastUpdatedBy")}</g:link></td>
					
						<td>${fieldValue(bean: labourInstance, field: "createdBy")}</td>
					
						<td>${fieldValue(bean: labourInstance, field: "tradeUnionMember")}</td>
					
						<td>${fieldValue(bean: labourInstance, field: "employerDetail")}</td>
					
						<td>${fieldValue(bean: labourInstance, field: "unionAtWork")}</td>
					
						<td>${fieldValue(bean: labourInstance, field: "memberOfWorkUnion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${labourInstanceCount ?: 0}" />
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
