<%@ page import="com.cbc.EventOutcome" %>

<div class="fieldcontain ${hasErrors(bean: eventOutcomeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventOutcome.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventOutcomeInstance?.name}"/>
</div>

