<%@ page import="com.cbc.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${countryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'regions', 'error')} ">
	<label for="regions">
		<g:message code="country.regions.label" default="Regions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${countryInstance?.regions?}" var="r">
    <li><g:link controller="region" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="region" action="create" params="['country.id': countryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'region.label', default: 'Region')])}</g:link>
</li>
</ul>

</div>

