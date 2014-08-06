<%@ page import="com.cbc.CaseStatus" %>



<div class="fieldcontain ${hasErrors(bean: caseStatusInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="caseStatus.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${caseStatusInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseStatusInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="caseStatus.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${caseStatusInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseStatusInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="caseStatus.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${caseStatusInstance?.name}"/>
</div>

