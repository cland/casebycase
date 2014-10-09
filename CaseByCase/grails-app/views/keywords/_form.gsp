<%@ page import="com.cbc.lookup.Keywords" %>



<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="keywords.name.label" default="Name" />
	</label>
	<g:textField name="name" value="${keywordsInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: keywordsInstance, field: 'label', 'error')} ">
	<label for="label">
		<g:message code="keywords.label.label" default="Label" />		
	</label>
	<g:textField name="label" value="${keywordsInstance?.label}"/>
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

<div class="fieldcontain ${hasErrors(bean: problemTypeInstance, field: 'keyword', 'error')} ">
	<label for="keyword">
		<g:message code="keyword.keywords.label" default="Keyword" />
		
	</label>
	<g:select id="keyword" name="keyword.id" from="${com.cbc.lookup.Keywords.list()}" optionKey="id" value="${keywordsInstance?.keyword?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<ul class="one-to-many">
<g:each in="${keywordsInstance?.values?}" var="p">
    <li><g:link controller="keywords" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
