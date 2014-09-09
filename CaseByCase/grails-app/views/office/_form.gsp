<%@ page import="com.cbc.Office" %>



<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="office.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${officeInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="office.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" required="" value="${officeInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="office.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${officeInstance.constraints.status.inList}" required="" value="${officeInstance?.status}" valueMessagePrefix="office.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'contactNumber', 'error')} ">
	<label for="contactNumber">
		<g:message code="office.contactNumber.label" default="Contact Number" />
		
	</label>
	<g:textField name="contactNumber" pattern="${officeInstance.constraints.contactNumber.matches}" value="${officeInstance?.contactNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'cellphoneNumber', 'error')} ">
	<label for="cellphoneNumber">
		<g:message code="office.cellphoneNumber.label" default="Cellphone Number" />
		
	</label>
	<g:textField name="cellphoneNumber" pattern="${officeInstance.constraints.cellphoneNumber.matches}" value="${officeInstance?.cellphoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'faxNumber', 'error')} ">
	<label for="faxNumber">
		<g:message code="office.faxNumber.label" default="Fax Number" />
		
	</label>
	<g:textField name="faxNumber" pattern="${officeInstance.constraints.faxNumber.matches}" value="${officeInstance?.faxNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'affiliates', 'error')} ">
	<label for="affiliates">
		<g:message code="office.affiliates.label" default="Affiliates" />
		
	</label>
	<g:select name="affiliates" from="${com.cbc.Organisation.list()}" multiple="multiple" optionKey="id" size="5" value="${officeInstance?.affiliates*.id}" class="many-to-many"/>
</div>
<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'regions', 'error')} ">
	<label for="region">
		<g:message code="country.region.label" default="Region" />
		
	</label>
	<fieldset><legend>Geographical Location</legend>
		<g:render template="../layouts/location" bean="${officeInstance?.location}" var="locationInstance" model="[mode:'edit']"></g:render>
	</fieldset>

</div>



