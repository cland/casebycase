<%@ page import="com.cbc.CasePriority" %>



<div class="fieldcontain ${hasErrors(bean: casePriorityInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="casePriority.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${casePriorityInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: casePriorityInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="casePriority.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${casePriorityInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: casePriorityInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="casePriority.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${casePriorityInstance?.name}"/>
</div>

