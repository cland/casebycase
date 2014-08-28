<%@ page import="com.cbc.lookup.EmpLeave" %>



<div class="fieldcontain ${hasErrors(bean: empLeaveInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="empLeave.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${empLeaveInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empLeaveInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="empLeave.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${empLeaveInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: empLeaveInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="empLeave.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${empLeaveInstance.createdBy}" required=""/>
</div>

