<%@ page import="com.cbc.location.Municipality" %>



<div class="fieldcontain ${hasErrors(bean: municipalityInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="municipality.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${municipalityInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipalityInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="municipality.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${municipalityInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipalityInstance, field: 'district', 'error')} required">
	<label for="district">
		<g:message code="municipality.district.label" default="District" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="district" name="district.id" from="${com.cbc.location.District.list()}" optionKey="id" required="" value="${municipalityInstance?.district?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: municipalityInstance, field: 'places', 'error')} ">
	<label for="places">
		<g:message code="municipality.places.label" default="Places" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${municipalityInstance?.places?}" var="p">
    <li><g:link controller="mainPlace" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="mainPlace" action="create" params="['municipality.id': municipalityInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'mainPlace.label', default: 'MainPlace')])}</g:link>
</li>
</ul>

</div>

