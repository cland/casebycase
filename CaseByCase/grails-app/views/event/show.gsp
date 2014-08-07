
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
						
							<g:if test="${eventInstance?.refno}">
							<li class="fieldcontain">
								<span id="refno-label" class="property-label"><g:message code="event.refno.label" default="Refno" /></span>
								
									<span class="property-value" aria-labelledby="refno-label"><g:fieldValue bean="${eventInstance}" field="refno"/></span>
								
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
						
							<g:if test="${eventInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="event.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${eventInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="event.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${eventInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="event.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${eventInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.eventParticipants}">
							<li class="fieldcontain">
								<span id="eventParticipants-label" class="property-label"><g:message code="event.eventParticipants.label" default="Event Participants" /></span>
								
									<span class="property-value" aria-labelledby="eventParticipants-label"><g:link controller="eventParticipant" action="show" id="${eventInstance?.eventParticipants?.id}">${eventInstance?.eventParticipants?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.eventType}">
							<li class="fieldcontain">
								<span id="eventType-label" class="property-label"><g:message code="event.eventType.label" default="Event Type" /></span>
								
									<span class="property-value" aria-labelledby="eventType-label"><g:link controller="eventType" action="show" id="${eventInstance?.eventType?.id}">${eventInstance?.eventType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.femaleYouth}">
							<li class="fieldcontain">
								<span id="femaleYouth-label" class="property-label"><g:message code="event.femaleYouth.label" default="Female Youth" /></span>
								
									<span class="property-value" aria-labelledby="femaleYouth-label"><g:fieldValue bean="${eventInstance}" field="femaleYouth"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.focusAreas}">
							<li class="fieldcontain">
								<span id="focusAreas-label" class="property-label"><g:message code="event.focusAreas.label" default="Focus Areas" /></span>
								
									<g:each in="${eventInstance.focusAreas}" var="f">
									<span class="property-value" aria-labelledby="focusAreas-label"><g:link controller="eventFocusArea" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.followers}">
							<li class="fieldcontain">
								<span id="followers-label" class="property-label"><g:message code="event.followers.label" default="Followers" /></span>
								
									<g:each in="${eventInstance.followers}" var="f">
									<span class="property-value" aria-labelledby="followers-label"><g:link controller="user" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
									</g:each>
								
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
						
							<g:if test="${eventInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="event.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${eventInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${eventInstance?.maleYouth}">
							<li class="fieldcontain">
								<span id="maleYouth-label" class="property-label"><g:message code="event.maleYouth.label" default="Male Youth" /></span>
								
									<span class="property-value" aria-labelledby="maleYouth-label"><g:fieldValue bean="${eventInstance}" field="maleYouth"/></span>
								
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
								
									<span class="property-value" aria-labelledby="outcome-label"><g:link controller="eventOutcome" action="show" id="${eventInstance?.outcome?.id}">${eventInstance?.outcome?.encodeAsHTML()}</g:link></span>
								
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
