<%@ page import="com.cbc.EventOutcome" %>



<div class="fieldcontain ${hasErrors(bean: eventOutcomeInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="eventOutcome.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${eventOutcomeInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventOutcomeInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="eventOutcome.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${eventOutcomeInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventOutcomeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventOutcome.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventOutcomeInstance?.name}"/>
</div>

