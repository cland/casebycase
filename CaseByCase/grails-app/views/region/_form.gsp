<%@ page import="com.cbc.Region" %>



<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="region.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${regionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'cities', 'error')} ">
	<label for="cities">
		<g:message code="region.cities.label" default="Cities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${regionInstance?.cities?}" var="c">
    <li><g:link controller="city" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="city" action="create" params="['region.id': regionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'city.label', default: 'City')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="region.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="country" name="country.id" from="${com.cbc.Country.list()}" optionKey="id" required="" value="${regionInstance?.country?.id}" class="many-to-one"/>
</div>

