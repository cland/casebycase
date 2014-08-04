<%@ page import="com.cbc.Citizenship" %>



<div class="fieldcontain ${hasErrors(bean: citizenshipInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="citizenship.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${citizenshipInstance?.name}"/>
</div>

