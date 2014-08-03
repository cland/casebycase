<%@ page import="com.cbc.Region" %>



<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="region.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${regionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="region.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${regionInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="region.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${regionInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'cities', 'error')} ">
	<label for="cities">
		<g:message code="region.cities.label" default="Cities" />
		
	</label>
	<g:select name="cities" from="${com.cbc.City.list()}" multiple="multiple" optionKey="id" size="5" value="${regionInstance?.cities*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: regionInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="region.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="country" name="country.id" from="${com.cbc.Country.list()}" optionKey="id" required="" value="${regionInstance?.country?.id}" class="many-to-one"/>
</div>

