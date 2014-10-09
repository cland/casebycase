<%@ page import="com.cbc.lookup.Keywords" %>



<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="keywords.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${keywordsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="keywords.category.label" default="Category" />
		
	</label>
	<g:textField name="category" value="${keywordsInstance?.category}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="keywords.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${keywordsInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'label', 'error')} ">
	<label for="label">
		<g:message code="keywords.label.label" default="Label" />
		
	</label>
	<g:textField name="label" value="${keywordsInstance?.label}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="keywords.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${keywordsInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="keywords.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${keywordsInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'values', 'error')} ">
	<label for="values">
		<g:message code="keywords.values.label" default="Values" />
		
	</label>
	<g:select name="values" from="${com.cbc.lookup.Keywords.list()}" multiple="multiple" optionKey="id" size="5" value="${keywordsInstance?.values*.id}" class="many-to-many"/>
</div>

