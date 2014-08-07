<%@ page import="com.cbc.EventType" %>

<div class="fieldcontain ${hasErrors(bean: eventTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventTypeInstance?.name}"/>
</div>

