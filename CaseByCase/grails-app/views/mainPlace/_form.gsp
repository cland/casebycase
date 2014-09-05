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
	<g:select name="suburbs" from="${com.cbc.location.Suburb.list()}" multiple="multiple" optionKey="id" size="5" value="${mainPlaceInstance?.suburbs*.id}" class="many-to-many"/>
</div>

