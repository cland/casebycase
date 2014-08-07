<%@ page import="com.cbc.CaseStatus" %>


<div class="fieldcontain ${hasErrors(bean: caseStatusInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="caseStatus.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${caseStatusInstance?.name}"/>
</div>

