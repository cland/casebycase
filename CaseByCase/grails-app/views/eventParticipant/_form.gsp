<%@ page import="com.cbc.EventParticipant" %>

<div class="fieldcontain ${hasErrors(bean: eventParticipantInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventParticipant.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventParticipantInstance?.name}"/>
</div>

