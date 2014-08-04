<%@ page import="com.cbc.Document" %>



<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="document.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${documentInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="document.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${documentInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="document.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${documentInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="document.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${documentInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'docType', 'error')} ">
	<label for="docType">
		<g:message code="document.docType.label" default="Doc Type" />
		
	</label>
	<g:textField name="docType" value="${documentInstance?.docType}"/>
</div>

