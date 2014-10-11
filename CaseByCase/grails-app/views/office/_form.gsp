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
<div class="fieldcontain ${hasErrors(bean: officeInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="office.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${userInstance?.email}"/>
</div>
<br/>
<fieldset><Legend>ORGANISATION AFFILIATION</Legend>
	<div class="table">
		<div class="row">
			<div class="cell">	
				<label for="affiliates">
					<g:message code="office.affiliates.label" default="Affiliated To:" />		
				</label>
			</div>
			<div class="cell">
				<g:each in="${com.cbc.Organisation.findAll{isMember==true}}" var="org" status="index">
					<g:checkBox name="affiliates" value="${org.id }" checked="${ officeInstance?.affiliates?.contains(org)}" />
					<label for="affiliates">${org }</label><br>
				</g:each>
			</div>
		</div>
	</div>
</fieldset>
<br/>
<fieldset><legend>GEOGRAPHICAL LOCATION</legend>
	<g:render template="../layouts/location" bean="${officeInstance?.location}" var="locationInstance" model="[mode:'edit']"></g:render>
</fieldset>

<%--SUPPORTING DOCUMENTS SECTION--%>
<fieldset><legend>SUPPORTING DOCUMENTS</legend>

<h1>Documents</h1>

<input type="file" name="documents"/>
<input type="file" name="documents"/>
<g:if test="${params?.action == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${officeInstance}" inputName="documents" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'attach.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:officeInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	


<h1>PICTURES</h1>
<input type="file" name="pictures"/>
<input type="file" name="pictures"/>
<g:if test="${params?.action == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${officeInstance}" inputName="documents" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:officeInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	
</fieldset>



