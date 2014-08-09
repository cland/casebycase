<%@ page import="com.cbc.EventType" %>



<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="eventType.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${eventTypeInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="eventType.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${eventTypeInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventTypeInstance?.name}"/>
</div>

