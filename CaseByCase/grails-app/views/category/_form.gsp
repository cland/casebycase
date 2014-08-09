<%@ page import="com.cbc.Category" %>



<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="category.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${categoryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'category', 'error')} ">
	<label for="category">
		<g:message code="category.category.label" default="Category" />
		
	</label>
	
	<g:select disabled="true" id="category" name="category.id" from="${com.cbc.Category.list()}" optionKey="id" value="${categoryInstance?.category?.id?categoryInstance.category.id:1}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categories', 'error')} ">
	<label for="categories">
		<g:message code="category.categories.label" default="Categories" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${categoryInstance?.categories?}" var="c">
    <li><g:link controller="category" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>

</div>

