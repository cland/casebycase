<%@ page import="com.cbc.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="person.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${personInstance?.firstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="person.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${personInstance?.lastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="person.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${personInstance?.title}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'knownAs', 'error')} ">
	<label for="knownAs">
		<g:message code="person.knownAs.label" default="Known As" />
		
	</label>
	<g:textField name="knownAs" value="${personInstance?.knownAs}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'dateOfBirth', 'error')} ">
	<label for="dateOfBirth">
		<g:message code="person.dateOfBirth.label" default="Date Of Birth" />
		
	</label>
	<g:datePicker name="dateOfBirth" precision="day"  value="${personInstance?.dateOfBirth}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="person.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textField name="contactNumber" pattern="${personInstance.constraints.contactNumber.matches}" value="${personInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'gender', 'error')} ">
	<label for="gender">
		<g:message code="person.gender.label" default="Gender" />
		
	</label>
	<g:select name="gender" from="${personInstance.constraints.gender.inList}" value="${personInstance?.gender}" valueMessagePrefix="person.gender" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'idNumber', 'error')} ">
	<label for="idNumber">
		<g:message code="person.idNumber.label" default="Id Number" />
		
	</label>
	<g:textField name="idNumber" value="${personInstance?.idNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'race', 'error')} ">
	<label for="race">
		<g:message code="person.race.label" default="Race" />
		
	</label>
	<g:select id="race" name="race.id" from="${com.cbc.Race.list()}" optionKey="id" value="${personInstance?.race?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'empHowJobFound', 'error')} ">
	<label for="empHowJobFound">
		<g:message code="person.empHowJobFound.label" default="Emp How Job Found" />
		
	</label>
	<g:textField name="empHowJobFound" value="${personInstance?.empHowJobFound}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'emoHowJobFoundDesc', 'error')} ">
	<label for="emoHowJobFoundDesc">
		<g:message code="person.emoHowJobFoundDesc.label" default="Emo How Job Found Desc" />
		
	</label>
	<g:textArea name="emoHowJobFoundDesc" cols="40" rows="5" value="${personInstance?.emoHowJobFoundDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="person.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${personInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="person.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${personInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'history', 'error')} ">
	<label for="history">
		<g:message code="person.history.label" default="History" />
		
	</label>
	<g:textField name="history" readonly="readonly" value="${personInstance?.history}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'citizenship', 'error')} required">
	<label for="citizenship">
		<g:message code="person.citizenship.label" default="Citizenship" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="citizenship" name="citizenship.id" from="${com.cbc.Citizenship.list()}" optionKey="id" required="" value="${personInstance?.citizenship?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="person.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="office" name="office.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${personInstance?.office?.id}" class="many-to-one"/>
</div>

