<%@ page import="com.cbc.Case" %>



<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'thisevent', 'error')} ">
	<label for="thisevent">
		<g:message code="case.thisevent.label" default="Thisevent" />
		
	</label>
	<g:select id="thisevent" name="thisevent.id" from="${com.cbc.Event.list()}" optionKey="id" value="${caseInstance?.thisevent?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'actions', 'error')} ">
	<label for="actions">
		<g:message code="case.actions.label" default="Actions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${caseInstance?.actions?}" var="a">
    <li><g:link controller="action" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="action" action="create" params="['case.id': caseInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'action.label', default: 'Action')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'amtRecovered', 'error')} required">
	<label for="amtRecovered">
		<g:message code="case.amtRecovered.label" default="Amt Recovered" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="amtRecovered" value="${fieldValue(bean: caseInstance, field: 'amtRecovered')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'bestPractice', 'error')} ">
	<label for="bestPractice">
		<g:message code="case.bestPractice.label" default="Best Practice" />
		
	</label>
	<g:checkBox name="bestPractice" value="${caseInstance?.bestPractice}" />
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'caseNumber', 'error')} ">
	<label for="caseNumber">
		<g:message code="case.caseNumber.label" default="Case Number" />
		
	</label>
	<g:textField name="caseNumber" value="${caseInstance?.caseNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'childHeadedHouse', 'error')} ">
	<label for="childHeadedHouse">
		<g:message code="case.childHeadedHouse.label" default="Child Headed House" />
		
	</label>
	<g:checkBox name="childHeadedHouse" value="${caseInstance?.childHeadedHouse}" />
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'clients', 'error')} ">
	<label for="clients">
		<g:message code="case.clients.label" default="Clients" />
		
	</label>
	<g:select name="clients" from="${com.cbc.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${caseInstance?.clients*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'dateClosed', 'error')} required">
	<label for="dateClosed">
		<g:message code="case.dateClosed.label" default="Date Closed" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateClosed" precision="day"  value="${caseInstance?.dateClosed}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'dateOpen', 'error')} required">
	<label for="dateOpen">
		<g:message code="case.dateOpen.label" default="Date Open" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOpen" precision="day"  value="${caseInstance?.dateOpen}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="case.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${caseInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="case.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="office" name="office.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${caseInstance?.office?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'orgclients', 'error')} ">
	<label for="orgclients">
		<g:message code="case.orgclients.label" default="Orgclients" />
		
	</label>
	<g:select name="orgclients" from="${com.cbc.Organisation.list()}" multiple="multiple" optionKey="id" size="5" value="${caseInstance?.orgclients*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'outcome', 'error')} required">
	<label for="outcome">
		<g:message code="case.outcome.label" default="Outcome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="outcome" name="outcome.id" from="${com.cbc.CaseOutcome.list()}" optionKey="id" required="" value="${caseInstance?.outcome?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="case.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="priority" name="priority.id" from="${com.cbc.CasePriority.list()}" optionKey="id" required="" value="${caseInstance?.priority?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'problemStart', 'error')} required">
	<label for="problemStart">
		<g:message code="case.problemStart.label" default="Problem Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="problemStart" precision="day"  value="${caseInstance?.problemStart}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'specialCase', 'error')} ">
	<label for="specialCase">
		<g:message code="case.specialCase.label" default="Special Case" />
		
	</label>
	<g:checkBox name="specialCase" value="${caseInstance?.specialCase}" />
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="case.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${com.cbc.CaseStatus.list()}" optionKey="id" required="" value="${caseInstance?.status?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'subject', 'error')} ">
	<label for="subject">
		<g:message code="case.subject.label" default="Subject" />
		
	</label>
	<g:textField name="subject" value="${caseInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'totalFemale', 'error')} required">
	<label for="totalFemale">
		<g:message code="case.totalFemale.label" default="Total Female" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalFemale" type="number" value="${caseInstance.totalFemale}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'totalMale', 'error')} required">
	<label for="totalMale">
		<g:message code="case.totalMale.label" default="Total Male" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalMale" type="number" value="${caseInstance.totalMale}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: caseInstance, field: 'totalUnknown', 'error')} required">
	<label for="totalUnknown">
		<g:message code="case.totalUnknown.label" default="Total Unknown" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="totalUnknown" type="number" value="${caseInstance.totalUnknown}" required=""/>
</div>

