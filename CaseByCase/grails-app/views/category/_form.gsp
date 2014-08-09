<%@ page import="com.cbc.Category"%>



<div
	class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'name', 'error')} required">
	<label for="name"> <g:message code="category.name.label"
			default="Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${categoryInstance?.name}" />
</div>

<g:hiddenField name="category.id" id="category"
	value="${categoryInstance?.category?.id?categoryInstance.category.id:1}" />

<div
	class="fieldcontain ${hasErrors(bean: categoryInstance, field: 'categories', 'error')} ">
	<label for="categories"> <g:message
			code="category.categories.label" default="Categories" />

	</label>

	<ul class="one-to-many">
		<g:each in="${categoryInstance?.categories?}" var="c">
			<li><g:link controller="category" action="show" id="${c.id}">
					${c?.encodeAsHTML()}
				</g:link></li>
		</g:each>
	</ul>

</div>

