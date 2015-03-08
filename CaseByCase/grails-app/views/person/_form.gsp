<%@ page import="com.cbc.Person" %>

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
<%--	<g:datePicker required="" name="dateOfBirth" precision="day"  value="${personInstance?.dateOfBirth}" default="none" relativeYears="[-80..-2]" noSelection="['': '-choose-']" />--%>
	<g:textField name="dateOfBirth" id="birth-date" class="datepick_single_past" value="${personInstance?.dateOfBirth?.format('dd-MMM-yyyy')}"/>
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
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'maritalStatus', 'error')} ">
	<label for="maritalStatus">
		<g:message code="person.maritalStatus.label" default="Marital Status" />	
		<span class='lookup-admin-key'>MaritalStatus</span>
	</label>
	<g:select id="maritalStatus" name="maritalStatus.id" 
		from="${com.cbc.lookup.Keywords.findByName("MaritalStatus")?.values}" 
		optionKey="id"  value="${personInstance?.maritalStatus?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'countryOfOrgin', 'error')} required">
	<label for="citizenship">
		<g:message code="person.countryOfOrgin.label" default="Country of origin:" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="countryOfOrgin" name="countryOfOrgin.id" from="${com.cbc.location.Country.list()}" 
					optionKey="id" required="" 
					value="${personInstance?.countryOfOrgin?.id}" class="many-to-one" noSelection="['': '-select one-']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'citizenship', 'error')} required">
	<label for="citizenship">
		<g:message code="person.citizenship.label" default="Citizenship" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="citizenship" name="citizenship.id" from="${com.cbc.Citizenship.list()}" optionKey="id" required="" value="${personInstance?.citizenship?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>

<fieldset><legend>Geographical Location</legend>
	<g:render template="../layouts/location" bean="${personInstance?.location}" var="locationInstance" model="[mode:'edit',hideList:['longlat']]"></g:render>
</fieldset>
<g:if test="${params.action != 'dialogcreate' }">
	<g:render template="form_attach" model="[thisInstance:personInstance]"/>
</g:if>

<fieldset><legend>Work Details</legend>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'workStatus', 'error')} ">
	<label for="workStatus.id">
		<g:message code="person.workStatus.label" default="Work Status" />	
		<span class='lookup-admin-key'>WorkStatus</span>
	</label>
	<g:select id="workStatus" name="workStatus.id" 
		from="${com.cbc.lookup.Keywords.findByName("WorkStatus")?.values}" 
		optionKey="id"  value="${personInstance?.workStatus?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'empHowJobFound', 'error')} ">
	<label for="empHowJobFound">
		<g:message code="person.empHowJobFound.label" default="How the job was found" />
		
	</label>
	<g:textField name="empHowJobFound" value="${personInstance?.empHowJobFound}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'empHowJobFoundDesc', 'error')} ">
	<label for="empHowJobFoundDesc">
		<g:message code="person.empHowJobFoundDesc.label" default="Describe how the job was found" />
		
	</label>
	<g:textArea name="empHowJobFoundDesc" cols="40" rows="5" value="${personInstance?.empHowJobFoundDesc}"/>
</div>
 
<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'education', 'error')} ">
	<label for="education">
		<g:message code="person.education.label" default="Education" />	
		<span class='lookup-admin-key'>PersonEducation</span>
	</label>
	<g:select id="education" name="education.id" 
		from="${com.cbc.lookup.Keywords.findByName("PersonEducation")?.values}" 
		optionKey="id"  value="${personInstance?.education?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'incomePersonal', 'error')} ">
	<label for="incomePersonal.id">
		<g:message code="person.incomePersonal.label" default="Personal Income" />	
		<span class='lookup-admin-key'>IncomePersonal</span>
	</label>
	<g:select id="incomePersonal" name="incomePersonal.id" 
		from="${com.cbc.lookup.Keywords.findByName("IncomePersonal")?.values}" 
		optionKey="id"  value="${personInstance?.incomePersonal?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'incomeHouse', 'error')} ">
	<label for="incomeHouse.id">
		<g:message code="person.incomeHouse.label" default="Household total income" />	
		<span class='lookup-admin-key'>IncomeHouse</span>
	</label>
	<g:select id="incomeHouse" name="incomeHouse.id" 
		from="${com.cbc.lookup.Keywords.findByName("IncomeHouse")?.values}" 
		optionKey="id"  value="${personInstance?.incomeHouse?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>
<%--
<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="worksector">
			<g:message code="person.worksector.label" default="Work sector:" />
			<span class="required-indicator">*</span>
			<span class='lookup-admin-key'>WorkSector</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("WorkSector")?.values}" var="keyword" status="index">
			<g:checkBox name="worksector" value="${keyword.id }" checked="${ personInstance?.worksector?.contains(keyword)}" />
			<label for="worksector">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>

<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="incomeSource">
			<g:message code="person.incomeSource.label" default="Source of Income:" />
			<span class="required-indicator">*</span>
			<span class='lookup-admin-key'>IncomeSource</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("IncomeSource")?.values}" var="keyword" status="index">
			<g:checkBox name="incomeSource" value="${keyword.id }" checked="${ personInstance?.incomeSource?.contains(keyword)}" />
			<label for="incomeSource">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>
--%>
</fieldset>
