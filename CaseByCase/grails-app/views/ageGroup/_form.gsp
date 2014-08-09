<%@ page import="com.cbc.AgeGroup" %>



<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'lowerAge', 'error')} required">
	<label for="lowerAge">
		<g:message code="ageGroup.lowerAge.label" default="Lower Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lowerAge" type="number" min="0" max="55" value="${ageGroupInstance.lowerAge}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'upperAge', 'error')} required">
	<label for="upperAge">
		<g:message code="ageGroup.upperAge.label" default="Upper Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="upperAge" type="number" min="1" max="150" value="${ageGroupInstance.upperAge}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="ageGroup.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${ageGroupInstance.constraints.gender.inList}" value="${ageGroupInstance?.gender}" valueMessagePrefix="ageGroup.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="ageGroup.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${ageGroupInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="ageGroup.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${ageGroupInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: ageGroupInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="ageGroup.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${ageGroupInstance?.name}"/>
</div>

