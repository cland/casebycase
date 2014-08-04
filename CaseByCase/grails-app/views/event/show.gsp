
<%@ page import="com.cbc.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-event" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-event" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- *** START TABS *** -->
			<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Details</a></li>
					<li><a href="#tab-2">Other</a></li>		
				</ul>
				<div id="tab-1">
					<ol class="property-list event">
						
							<g:if test="${eventInstance?.topic}">
							<li class="fieldcontain">
								<span id="topic-label" class="property-label"><g:message code="event.topic.label" default="Topic" /></span>
								
									<span class="property-value" aria-labelledby="topic-label"><g:fieldValue bean="${eventInstance}" field="topic"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.number}">
							<li class="fieldcontain">
								<span id="number-label" class="property-label"><g:message code="event.number.label" default="Number" /></span>
								
									<span class="property-value" aria-labelledby="number-label"><g:fieldValue bean="${eventInstance}" field="number"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.date}">
							<li class="fieldcontain">
								<span id="date-label" class="property-label"><g:message code="event.date.label" default="Date" /></span>
								
									<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${eventInstance?.date}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.venue}">
							<li class="fieldcontain">
								<span id="venue-label" class="property-label"><g:message code="event.venue.label" default="Venue" /></span>
								
									<span class="property-value" aria-labelledby="venue-label"><g:fieldValue bean="${eventInstance}" field="venue"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.description}">
							<li class="fieldcontain">
								<span id="description-label" class="property-label"><g:message code="event.description.label" default="Description" /></span>
								
									<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${eventInstance}" field="description"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.objective}">
							<li class="fieldcontain">
								<span id="objective-label" class="property-label"><g:message code="event.objective.label" default="Objective" /></span>
								
									<span class="property-value" aria-labelledby="objective-label"><g:fieldValue bean="${eventInstance}" field="objective"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.totalMale}">
							<li class="fieldcontain">
								<span id="totalMale-label" class="property-label"><g:message code="event.totalMale.label" default="Total Male" /></span>
								
									<span class="property-value" aria-labelledby="totalMale-label"><g:fieldValue bean="${eventInstance}" field="totalMale"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.totalFemale}">
							<li class="fieldcontain">
								<span id="totalFemale-label" class="property-label"><g:message code="event.totalFemale.label" default="Total Female" /></span>
								
									<span class="property-value" aria-labelledby="totalFemale-label"><g:fieldValue bean="${eventInstance}" field="totalFemale"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.eventType}">
							<li class="fieldcontain">
								<span id="eventType-label" class="property-label"><g:message code="event.eventType.label" default="Event Type" /></span>
								
									<span class="property-value" aria-labelledby="eventType-label"><g:fieldValue bean="${eventInstance}" field="eventType"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.focusArea}">
							<li class="fieldcontain">
								<span id="focusArea-label" class="property-label"><g:message code="event.focusArea.label" default="Focus Area" /></span>
								
									<span class="property-value" aria-labelledby="focusArea-label"><g:fieldValue bean="${eventInstance}" field="focusArea"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.funders}">
							<li class="fieldcontain">
								<span id="funders-label" class="property-label"><g:message code="event.funders.label" default="Funders" /></span>
								
									<g:each in="${eventInstance.funders}" var="f">
									<span class="property-value" aria-labelledby="funders-label"><g:link controller="funder" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.office}">
							<li class="fieldcontain">
								<span id="office-label" class="property-label"><g:message code="event.office.label" default="Office" /></span>
								
									<span class="property-value" aria-labelledby="office-label"><g:link controller="office" action="show" id="${eventInstance?.office?.id}">${eventInstance?.office?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.outcome}">
							<li class="fieldcontain">
								<span id="outcome-label" class="property-label"><g:message code="event.outcome.label" default="Outcome" /></span>
								
									<span class="property-value" aria-labelledby="outcome-label"><g:fieldValue bean="${eventInstance}" field="outcome"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.user}">
							<li class="fieldcontain">
								<span id="user-label" class="property-label"><g:message code="event.user.label" default="User" /></span>
								
									<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${eventInstance?.user?.id}">${eventInstance?.user?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${eventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
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
</script>		
	</body>
</html>
