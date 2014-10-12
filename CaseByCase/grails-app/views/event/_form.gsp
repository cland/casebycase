<%@ page import="com.cbc.Event" %>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'topic', 'error')} required">
	<label for="topic">
		<g:message code="event.topic.label" default="Topic" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topic" required="" value="${eventInstance?.topic}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'refno', 'error')} required">
	<label for="refno">
		<g:message code="event.refno.label" default="Reference No." />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="refno" required="" value="${eventInstance?.refno}"/>
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
	<g:textArea name="description">${eventInstance?.description}</g:textArea>
	
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'objective', 'error')} ">
	<label for="objective">
		<g:message code="event.objective.label" default="Objective" />
		
	</label>
	<g:textArea name="objective">${eventInstance?.objective}</g:textArea>	
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
<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'femaleYouth', 'error')} required">
	<label for="femaleYouth">
		<g:message code="event.femaleYouth.label" default="Female Youth" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="femaleYouth" type="number" value="${eventInstance.femaleYouth}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'maleYouth', 'error')} required">
	<label for="maleYouth">
		<g:message code="event.maleYouth.label" default="Male Youth" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="maleYouth" type="number" value="${eventInstance.maleYouth}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventParticipants', 'error')} required">
	<label for="eventParticipants">
		<g:message code="event.eventParticipants.label" default="Event Participants" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="eventParticipants" name="eventParticipants.id" from="${com.cbc.EventParticipant.list()}" optionKey="id" required="" value="${eventInstance?.eventParticipants?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'eventType', 'error')} required">
	<label for="eventType">
		<g:message code="event.eventType.label" default="Event Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="eventType" name="eventType.id" from="${com.cbc.EventType.list()}" optionKey="id" required="" value="${eventInstance?.eventType?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'focusAreas', 'error')} ">
	<label for="focusAreas">
		<g:message code="event.focusAreas.label" default="Focus Areas" />
		
	</label>
	<div class="property-value">
	<g:each in="${com.cbc.EventFocusArea.list()}" var="u" status="index">
		<g:checkBox name="focusAreas" value="${u.id }" checked="${ eventInstance?.focusAreas?.contains(u)}" />
		<span>${u }</span><br>
	</g:each>
	</div>
<%--	<g:select name="focusAreas" from="${com.cbc.EventFocusArea.list()}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.focusAreas*.id}" class="many-to-many"/>--%>
</div>
<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'outcome', 'error')} required">
	<label for="outcome">
		<g:message code="event.outcome.label" default="Outcome" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="outcome" name="outcome.id" from="${com.cbc.EventOutcome.list()}" optionKey="id" required="" value="${eventInstance?.outcome?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'office', 'error')} required">
	<label for="office">
		<g:message code="event.office.label" default="Office" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField id="office" name="office.id" value="${(eventInstance?.office?eventInstance?.office?.id : cbcApiService?.getUserPrimaryOffice()?.id)}" />
	<span>
		${(eventInstance?.office ? eventInstance?.office : cbcApiService?.getUserPrimaryOffice())}
	</span>
<%--	<g:select id="office" name="office.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${eventInstance?.office?.id}" class="many-to-one"/>--%>
</div>



<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="event.user.label" default="Event caseworker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="fullname" id="user" name="user.id" from="${cbcApiService?.getStaffForOffice(eventInstance?.office,params)}" optionKey="id" required="" value="${eventInstance?.user?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: eventInstance, field: 'followers', 'error')} ">
	<label for="followers">
		<g:message code="event.followers.label" default="Other workers" />	
	</label>
	<div class="property-value">
	<g:each in="${cbcApiService?.getStaffForOffice(eventInstance?.office,params)}" var="u" status="index">
		<g:checkBox name="followers" value="${u.id }" checked="${ eventInstance?.followers?.contains(u)}" />
		<span>${u?.getFullname() }</span><br>
	</g:each>
	</div>
<%--	<g:select name="followers" from="${cbcApiService?.getStaffForOffice(eventInstance?.office,params)}" multiple="multiple" optionKey="id" size="5" value="${eventInstance?.followers*.id}" class="many-to-many"/>--%>
</div>

<%--SUPPORTING DOCUMENTS SECTION--%>
<fieldset><legend>SUPPORTING DOCUMENTS</legend>

<h1>Documents</h1>

<input type="file" name="documents"/>
<input type="file" name="documents"/>
<g:if test="${params?.action == false }">
<br/>
	<div id="attachments" class="attachments">
			<attachments:each bean="${eventInstance}" inputName="documents" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'attach.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:eventInstance.id,absolute:true)}" />
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
			<attachments:each bean="${eventInstance}" inputName="documents" status="i">	
			<div class="photo-display float-left">
			<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
				<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
				<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
				${attachment.niceLength}
				<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
					returnPageURI="${createLink(action:'show', id:eventInstance.id,absolute:true)}" />
			</div>	
				<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
			
			</attachments:each>
			<div style="clear:both"></div>
	</div>
</g:if>	
</fieldset>