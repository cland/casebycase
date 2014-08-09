<%@ page import="com.cbc.CaseOutcome" %>



<div class="fieldcontain ${hasErrors(bean: caseOutcomeInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="caseOutcome.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${caseOutcomeInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseOutcomeInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="caseOutcome.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${caseOutcomeInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseOutcomeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="caseOutcome.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${caseOutcomeInstance?.name}"/>
</div>

