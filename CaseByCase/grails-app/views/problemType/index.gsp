
<%@ page import="com.cbc.lookup.ProblemType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problemType.label', default: 'ProblemType')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-problemType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					Problem Types
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="list-problemType" class="content scaffold-list" role="main">
			<div class="page-header">
				<g:message code="default.list.label" args="[entityName]" />
				<div class="action-div" ><g:link controller="problemType" action="create" >New Type</g:link></div>
			</div>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'problemType.name.label', default: 'Name')}" />
						<th><g:message code="problemType.problemType.label" default="Problem Type" /></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${problemTypeInstanceList}" status="i" var="problemTypeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${problemTypeInstance.id}">${fieldValue(bean: problemTypeInstance, field: "name")}</g:link></td>
						<td><g:each in="${problemTypeInstance.problemTypes}" var="p">
							<span class="property-value" aria-labelledby="problemTypes-label">
							<span class="r-arrow"></span> ${p?.encodeAsHTML()}<br/>
							</span>
							</g:each>
						</td>	
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${problemTypeInstanceCount ?: 0}" />
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
