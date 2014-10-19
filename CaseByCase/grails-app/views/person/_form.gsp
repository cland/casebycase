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
		<g:message code="person.dateOfBirth.label" default="Date Of Birth"  />
		
	</label>
	<g:datePicker required="" name="dateOfBirth" precision="day"  value="${personInstance?.dateOfBirth}" default="none" relativeYears="[-80..-2]" noSelection="['': '-choose-']" />
</div>

<g:if test="${params.action!='create' & params.action!='dialogcreate' }">
	<table class="dialog">
	<tr class="prop">
	<td valign="top" class="name">
	<label for="phones"><g:message code="person.phones.label" default="Phones List" /></label>
	</td>
	<td valign="top" class="value ${hasErrors(bean: personInstance, field: 'phones', 'errors')}">
	<!-- Render the phones template (_phones.gsp) here -->
	<g:render template="phones" model="['personInstance':personInstance]" />
	<!-- Render the phones template (_phones.gsp) here -->
	</td>
	</tr>
	</tbody>
	</table>
</g:if>
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

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'empHowJobFoundDesc', 'error')} ">
	<label for="empHowJobFoundDesc">
		<g:message code="person.empHowJobFoundDesc.label" default="Emp How Job Found Desc" />
		
	</label>
	<g:textArea name="empHowJobFoundDesc" cols="40" rows="5" value="${personInstance?.empHowJobFoundDesc}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'citizenship', 'error')} required">
	<label for="citizenship">
		<g:message code="person.citizenship.label" default="Citizenship" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="citizenship" name="citizenship.id" from="${com.cbc.Citizenship.list()}" optionKey="id" required="" value="${personInstance?.citizenship?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="person.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id="office" name="office.id" value="${(personInstance?.office?personInstance?.office?.id : cbcApiService?.getUserPrimaryOffice()?.id)}" />
	<span class="properties-value">
		${(personInstance?.office ? personInstance?.office : cbcApiService?.getUserPrimaryOffice())}
	</span>
</div>
<fieldset><legend>Geographical Location</legend>
	<g:render template="../layouts/location" bean="${locationInstance}" var="locationInstance" model="[mode:'edit']"></g:render>
</fieldset>
<g:if test="${params.action != 'dialogcreate' }">
	<g:render template="form_attach" model="[thisInstance:personInstance]"/>
</g:if>
