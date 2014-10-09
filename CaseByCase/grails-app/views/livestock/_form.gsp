<%@ page import="com.cbc.Livestock" %>



<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="livestock.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${livestockInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="livestock.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${livestockInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'cat', 'error')} required">
	<label for="cat">
		<g:message code="livestock.cat.label" default="Cat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cat" type="number" value="${livestockInstance.cat}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'chicken', 'error')} required">
	<label for="chicken">
		<g:message code="livestock.chicken.label" default="Chicken" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="chicken" type="number" value="${livestockInstance.chicken}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'cow', 'error')} required">
	<label for="cow">
		<g:message code="livestock.cow.label" default="Cow" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cow" type="number" value="${livestockInstance.cow}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'dog', 'error')} required">
	<label for="dog">
		<g:message code="livestock.dog.label" default="Dog" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="dog" type="number" value="${livestockInstance.dog}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'goat', 'error')} required">
	<label for="goat">
		<g:message code="livestock.goat.label" default="Goat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="goat" type="number" value="${livestockInstance.goat}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'horse', 'error')} required">
	<label for="horse">
		<g:message code="livestock.horse.label" default="Horse" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="horse" type="number" value="${livestockInstance.horse}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'other', 'error')} required">
	<label for="other">
		<g:message code="livestock.other.label" default="Other" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="other" type="number" value="${livestockInstance.other}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: livestockInstance, field: 'sheep', 'error')} required">
	<label for="sheep">
		<g:message code="livestock.sheep.label" default="Sheep" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="sheep" type="number" value="${livestockInstance.sheep}" required=""/>
</div>

