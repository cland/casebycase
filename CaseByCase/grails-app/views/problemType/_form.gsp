<%@ page import="com.cbc.lookup.ProblemType" %>

<div class="fieldcontain ${hasErrors(bean: problemTypeInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="problemType.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${problemTypeInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: problemTypeInstance, field: 'label', 'error')} ">
	<label for="name">
		<g:message code="problemType.label.label" default="Label" />
		
	</label>
	<g:textField name="label" value="${problemTypeInstance?.label}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: problemTypeInstance, field: 'problemType', 'error')} ">
	<label for="problemType">
		<g:message code="problemType.problemType.label" default="Problem Type" />
		
	</label>
	<g:select id="problemType" name="problemType.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${problemTypeInstance?.problemType?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: problemTypeInstance, field: 'problemTypes', 'error')} ">
	<label for="problemTypes">
		<g:message code="problemType.problemTypes.label" default="Problem Types" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${problemTypeInstance?.problemTypes?}" var="p">
    <li><g:link controller="problemType" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="problemType" action="create" params="['problemType.id': problemTypeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'problemType.label', default: 'ProblemType')])}</g:link>
</li>
</ul>

</div>

