<%@ page import="com.cbc.EventParticipant" %>



<div class="fieldcontain ${hasErrors(bean: eventParticipantInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="eventParticipant.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${eventParticipantInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventParticipantInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="eventParticipant.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${eventParticipantInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventParticipantInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventParticipant.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventParticipantInstance?.name}"/>
</div>

