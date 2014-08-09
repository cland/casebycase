<%@ page import="com.cbc.EventFocusArea" %>



<div class="fieldcontain ${hasErrors(bean: eventFocusAreaInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="eventFocusArea.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${eventFocusAreaInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventFocusAreaInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="eventFocusArea.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${eventFocusAreaInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventFocusAreaInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventFocusArea.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventFocusAreaInstance?.name}"/>
</div>

