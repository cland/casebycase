<%@ page import="com.cbc.Image" %>



<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="image.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${imageInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'caption', 'error')} ">
	<label for="caption">
		<g:message code="image.caption.label" default="Caption" />
		
	</label>
	<g:textField name="caption" value="${imageInstance?.caption}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="image.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${imageInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="image.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${imageInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="image.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${imageInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: imageInstance, field: 'locations', 'error')} ">
	<label for="locations">
		<g:message code="image.locations.label" default="Locations" />
		
	</label>
	
</div>

