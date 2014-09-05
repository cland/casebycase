<%@ page import="com.cbc.location.Country" %>



<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="country.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${countryInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="country.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${countryInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="country.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${countryInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: countryInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="country.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${countryInstance.createdBy}" required=""/>
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

