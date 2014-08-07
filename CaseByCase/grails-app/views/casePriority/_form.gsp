<%@ page import="com.cbc.CasePriority" %>

<div class="fieldcontain ${hasErrors(bean: casePriorityInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="casePriority.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${casePriorityInstance?.name}"/>
</div>

