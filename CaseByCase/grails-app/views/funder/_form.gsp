<%@ page import="com.cbc.Funder" %>



<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'workNumber', 'error')} ">
	<label for="workNumber">
		<g:message code="funder.workNumber.label" default="Work Number" />
		
	</label>
	<g:textField name="workNumber" pattern="${funderInstance.constraints.workNumber.matches}" value="${funderInstance?.workNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'cellphone', 'error')} ">
	<label for="cellphone">
		<g:message code="funder.cellphone.label" default="Cellphone" />
		
	</label>
	<g:textField name="cellphone" pattern="${funderInstance.constraints.cellphone.matches}" value="${funderInstance?.cellphone}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'amount', 'error')} ">
	<label for="amount">
		<g:message code="funder.amount.label" default="Amount" />
		
	</label>
	<g:field name="amount" value="${fieldValue(bean: funderInstance, field: 'amount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'periodFrom', 'error')} ">
	<label for="periodFrom">
		<g:message code="funder.periodFrom.label" default="Period From" />
		
	</label>
	<g:datePicker name="periodFrom" precision="day"  value="${funderInstance?.periodFrom}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'periodTo', 'error')} ">
	<label for="periodTo">
		<g:message code="funder.periodTo.label" default="Period To" />
		
	</label>
	<g:datePicker name="periodTo" precision="day"  value="${funderInstance?.periodTo}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'funderType', 'error')} required">
	<label for="funderType">
		<g:message code="funder.funderType.label" default="Funder Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="funderType" required="" value="${funderInstance?.funderType}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="funder.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${funderInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="funder.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${funderInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="funder.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${com.cbc.Event.list()}" optionKey="id" required="" value="${funderInstance?.event?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="funder.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${funderInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'orgs', 'error')} ">
	<label for="orgs">
		<g:message code="funder.orgs.label" default="Orgs" />
		
	</label>
	<g:select name="orgs" from="${com.cbc.Organisation.list()}" multiple="multiple" optionKey="id" size="5" value="${funderInstance?.orgs*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funderInstance, field: 'persons', 'error')} ">
	<label for="persons">
		<g:message code="funder.persons.label" default="Persons" />
		
	</label>
	<g:select name="persons" from="${com.cbc.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${funderInstance?.persons*.id}" class="many-to-many"/>
</div>

