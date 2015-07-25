<%@ page import="com.cbc.Organisation" %>
<%@ page import="com.cbc.SystemRoles" %>


<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="organisation.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${organisationInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="organisation.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${organisationInstance.constraints.status.inList}" required="" value="${organisationInstance?.status}" valueMessagePrefix="organisation.status"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'phoneNo', 'error')} ">
	<label for="phoneNo">
		<g:message code="organisation.phoneNo.label" default="Phone No" />
		
	</label>
	<g:textField name="phoneNo" pattern="${organisationInstance.constraints.phoneNo.matches}" value="${organisationInstance?.phoneNo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="organisation.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${organisationInstance?.email}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'staffCount', 'error')} ">
	<label for="staffCount">
		<g:message code="organisation.staffCount.label" default="Number of employees" />
		
	</label>
	<g:textField name="staffCount" value="${organisationInstance?.staffCount}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'sector', 'error')} ">
		<label for="sector">
			<g:message code="organisation.sector.label" default="Sector" />		
		</label>
		<div style="width:74%;float:right;">
			<span class="lookup-admin-key">Lookup: [Keywords:Sector]</span>
			<g:each in="${com.cbc.lookup.Keywords.findByName("Sectors")?.values}" var="keyword" status="index">
				<g:checkBox name="sector" value="${keyword.id }" checked="${ organisationInstance?.sector?.contains(keyword)}" />
				<label for="sector">${keyword }</label><br>
			</g:each>
		</div>
		<div style="clear:both;"></div>
</div>
<br/>		

<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'isLabourBroker', 'error')} ">
	<label for="isLabourBroker">
		<g:message code="organisation.isLabourBroker.label" default="Is Labour Broker" />
		
	</label>
	<g:checkBox name="isLabourBroker" value="${organisationInstance?.isLabourBroker}" />
</div>
<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'isMember', 'error')} ">
	<label for="isMember">
		<g:message code="organisation.isMember.label" default="Is Member" />
		
	</label>
	<g:checkBox name="isMember" value="${organisationInstance?.isMember}" />
</div>
</sec:ifAnyGranted>
<sec:ifAnyGranted roles="${SystemRoles.ROLE_DEVELOPER }">
	<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'isHost', 'error')} ">
		<label for="isHost">
			<g:message code="organisation.isHost.label" default="Is Host" />		
		</label>
		<g:checkBox name="isHost" value="${organisationInstance?.isHost}" />
	</div>
</sec:ifAnyGranted>
<%--<div class="fieldcontain ${hasErrors(bean: organisationInstance, field: 'staff', 'error')} ">--%>
<%--	<label for="staff">--%>
<%--		<g:message code="organisation.staff.label" default="Staff" />--%>
<%--		--%>
<%--	</label>--%>
<%--	<g:select name="staff" from="${com.cbc.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${organisationInstance?.staff*.id}" class="many-to-many"/>--%>
<%--</div>--%>

