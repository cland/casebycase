<%@ page import="com.cbc.location.Suburb" %>



<div class="fieldcontain ${hasErrors(bean: suburbInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="suburb.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${suburbInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: suburbInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="suburb.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${suburbInstance?.code}"/>
</div>

