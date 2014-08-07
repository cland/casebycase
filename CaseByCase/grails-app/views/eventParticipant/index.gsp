
<%@ page import="com.cbc.EventParticipant" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eventParticipant.label', default: 'EventParticipant')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#list-eventParticipant" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="list-eventParticipant" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="lastUpdatedBy" title="${message(code: 'eventParticipant.lastUpdatedBy.label', default: 'Last Updated By')}" />
					
						<g:sortableColumn property="createdBy" title="${message(code: 'eventParticipant.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'eventParticipant.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'eventParticipant.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'eventParticipant.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${eventParticipantInstanceList}" status="i" var="eventParticipantInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${eventParticipantInstance.id}">${fieldValue(bean: eventParticipantInstance, field: "lastUpdatedBy")}</g:link></td>
					
						<td>${fieldValue(bean: eventParticipantInstance, field: "createdBy")}</td>
					
						<td><g:formatDate date="${eventParticipantInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${eventParticipantInstance.lastUpdated}" /></td>
					
						<td>${fieldValue(bean: eventParticipantInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${eventParticipantInstanceCount ?: 0}" />
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
