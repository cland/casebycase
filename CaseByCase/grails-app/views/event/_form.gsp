<%@ page import="com.cbc.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="event.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topic" required="" value="${eventInstance?.topic}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="event.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="number" required="" value="${eventInstance?.number}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="event.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${eventInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'venue', 'error')} ">
	<label for="venue">
		<g:message code="event.venue.label" default="Venue" />
		
	</label>
	<g:textField name="venue" value="${eventInstance?.venue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="event.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${eventInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'objective', 'error')} ">
	<label for="objective">
		<g:message code="event.objective.label" default="Objective" />
		
	</label>
	<g:textField name="objective" value="${eventInstance?.objective}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'totalMale', 'error')} required">
	<label for="totalMale">
		<g:message code="event.totalMale.label" default="Total Male" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalMale" type="number" value="${eventInstance.totalMale}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'totalFemale', 'error')} required">
	<label for="totalFemale">
		<g:message code="event.totalFemale.label" default="Total Female" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalFemale" type="number" value="${eventInstance.totalFemale}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventType', 'error')} ">
	<label for="eventType">
		<g:message code="event.eventType.label" default="Event Type" />
		
	</label>
	<g:textField name="eventType" value="${eventInstance?.eventType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'focusArea', 'error')} ">
	<label for="focusArea">
		<g:message code="event.focusArea.label" default="Focus Area" />
		
	</label>
	<g:textField name="focusArea" value="${eventInstance?.focusArea}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'funders', 'error')} ">
	<label for="funders">
		<g:message code="event.funders.label" default="Funders" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${eventInstance?.funders?}" var="f">
    <li><g:link controller="funder" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="funder" action="create" params="['event.id': eventInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'funder.label', default: 'Funder')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="event.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="office" name="office.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${eventInstance?.office?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'outcome', 'error')} ">
	<label for="outcome">
		<g:message code="event.outcome.label" default="Outcome" />
		
	</label>
	<g:textField name="outcome" value="${eventInstance?.outcome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="event.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${com.cbc.User.list()}" optionKey="id" required="" value="${eventInstance?.user?.id}" class="many-to-one"/>
</div>

