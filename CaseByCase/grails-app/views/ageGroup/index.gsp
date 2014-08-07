
<%@ page import="com.cbc.AgeGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ageGroup.label', default: 'AgeGroup')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#list-ageGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-ageGroup" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="lowerAge" title="${message(code: 'ageGroup.lowerAge.label', default: 'Lower Age')}" />
					
						<g:sortableColumn property="upperAge" title="${message(code: 'ageGroup.upperAge.label', default: 'Upper Age')}" />
					
						<g:sortableColumn property="gender" title="${message(code: 'ageGroup.gender.label', default: 'Gender')}" />
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'ageGroup.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'ageGroup.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'ageGroup.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ageGroupInstanceList}" status="i" var="ageGroupInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${ageGroupInstance.id}">${fieldValue(bean: ageGroupInstance, field: "lowerAge")}</g:link></td>
					
						<td>${fieldValue(bean: ageGroupInstance, field: "upperAge")}</td>
					
						<td>${fieldValue(bean: ageGroupInstance, field: "gender")}</td>
					
						<td>${fieldValue(bean: ageGroupInstance, field: "lastUpdatedBy")}</td>
					
						<td>${fieldValue(bean: ageGroupInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${ageGroupInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ageGroupInstanceCount ?: 0}" />
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
