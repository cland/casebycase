<%@ page import="com.cbc.location.District" %>



<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="district.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${districtInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="district.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${districtInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'municipalities', 'error')} ">
	<label for="municipalities">
		<g:message code="district.municipalities.label" default="Municipalities" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${districtInstance?.municipalities?}" var="m">
    <li><g:link controller="municipality" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="municipality" action="create" params="['district.id': districtInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'municipality.label', default: 'Municipality')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: districtInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="district.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="region" name="region.id" from="${com.cbc.location.Region.list()}" optionKey="id" required="" value="${districtInstance?.region?.id}" class="many-to-one"/>
</div>

