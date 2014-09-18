<%@ page import="com.cbc.location.MainPlace" %>



<div class="fieldcontain ${hasErrors(bean: mainPlaceInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="mainPlace.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${mainPlaceInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mainPlaceInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="mainPlace.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${mainPlaceInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mainPlaceInstance, field: 'municipality', 'error')} required">
	<label for="municipality">
		<g:message code="mainPlace.municipality.label" default="Municipality" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="municipality" name="municipality.id" from="${com.cbc.location.Municipality.list()}" optionKey="id" required="" value="${mainPlaceInstance?.municipality?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: mainPlaceInstance, field: 'suburbs', 'error')} ">
	<label for="suburbs">
		<g:message code="mainPlace.suburbs.label" default="Suburbs" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${mainPlaceInstance?.suburbs?}" var="s">
    <li><g:link controller="suburb" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="suburb" action="create" params="['mainPlace.id': mainPlaceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'suburb.label', default: 'Suburb')])}</g:link>
</li>
</ul>

</div>

