<%@ page import="com.cbc.Pcm" %>

<fieldset><legend>PCM DETAILS</legend>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'pcmDate', 'error')} required">
	<label for="pcmDate">
		<g:message code="pcm.pcmDate.label" default="Please Call Me Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="pcmDate" precision="day"  value="${pcmInstance?.pcmDate}"  />
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'sender', 'error')} ">
	<label for="sender">
		<g:message code="pcm.sender.label" default="Sender" />
		
	</label>
	<g:textField name="sender" value="${pcmInstance?.sender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="pcm.content.label" default="Content" />		
	</label>
	<g:textArea name="content" >${pcmInstance?.content}</g:textArea>
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'receiver', 'error')} ">
	<label for="receiver">
		<g:message code="pcm.receiver.label" default="Receiver" />
		
	</label>
	<g:textField name="receiver" value="${pcmInstance?.receiver}"/>
</div>
</fieldset>
<br/>

<fieldset><legend>CLIENT DETAILS</legend>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="pcm.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${pcmInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'agegroup', 'error')} required">
	<label for="agegroup">
		<g:message code="pcm.agegroup.label" default="Age Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="agegroup" name="agegroup.id" from="${com.cbc.AgeGroup.list()}" optionKey="id" required="" value="${pcmInstance?.agegroup?.id}" class="many-to-one" noSelection="['null':'-select one-']"/>
</div>
</fieldset>
<br/>
<fieldset><legend>LOCATION</legend>
	<g:render template="../layouts/location" bean="${officeInstance?.location}" var="locationInstance" model="[mode:'edit',hideList:['suburb','township','description','longlat']]"></g:render>
</fieldset>
<br/>

<fieldset><legend>CASE</legend>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pcm.description.label" default="Description" />
		
	</label>
	<g:textArea name="description">${pcmInstance?.description}</g:textArea>
	
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'referredBy', 'error')} ">
	<label for="referredBy">
		<g:message code="pcm.referredBy.label" default="Referred By" />
		
	</label>
	<g:textField name="referredBy" value="${pcmInstance?.referredBy}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'referredTo', 'error')} required">
	<label for="referredTo">
		<g:message code="pcm.referredTo.label" default="Referred To" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="referredTo" name="referredTo.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${pcmInstance?.referredTo?.id}" class="many-to-one"/>
</div>
</fieldset>

