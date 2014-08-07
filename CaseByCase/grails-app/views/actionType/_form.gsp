<%@ page import="com.cbc.ActionType" %>

<div class="fieldcontain ${hasErrors(bean: actionTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="actionType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${actionTypeInstance?.name}"/>
</div>

