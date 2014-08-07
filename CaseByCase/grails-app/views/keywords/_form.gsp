<%@ page import="com.cbc.Keywords" %>



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

<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'values', 'error')} ">
	<label for="values">
		<g:message code="keywords.values.label" default="Values" />
		
	</label>
	
</div>

