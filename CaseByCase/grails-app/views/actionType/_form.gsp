<%@ page import="com.cbc.ActionType" %>



<div class="fieldcontain ${hasErrors(bean: actionTypeInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="actionType.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${actionTypeInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionTypeInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="actionType.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${actionTypeInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="actionType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${actionTypeInstance?.name}"/>
</div>

