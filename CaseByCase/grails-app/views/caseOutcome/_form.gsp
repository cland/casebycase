<%@ page import="com.cbc.CaseOutcome" %>

<div class="fieldcontain ${hasErrors(bean: caseOutcomeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="caseOutcome.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${caseOutcomeInstance?.name}"/>
</div>

