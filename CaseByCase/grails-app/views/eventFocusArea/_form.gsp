<%@ page import="com.cbc.EventFocusArea" %>


<div class="fieldcontain ${hasErrors(bean: eventFocusAreaInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eventFocusArea.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${eventFocusAreaInstance?.name}"/>
</div>

