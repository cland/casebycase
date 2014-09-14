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
	<ckeditor:editor name="content" height="400px" width="80%" toolbar="custom">
		${documentInstance?.content}
	</ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: documentInstance, field: 'docType', 'error')} ">
	<label for="docType">
		<g:message code="document.docType.label" default="Doc Type" />
		
	</label>
	<g:textField name="docType" value="${documentInstance?.docType}"/>
</div>

