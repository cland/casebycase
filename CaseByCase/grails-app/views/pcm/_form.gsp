<%@ page import="com.cbc.Pcm" %>



<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="pcm.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${pcmInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="pcm.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${pcmInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'agegroup', 'error')} required">
	<label for="agegroup">
		<g:message code="pcm.agegroup.label" default="Agegroup" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="agegroup" name="agegroup.id" from="${com.cbc.AgeGroup.list()}" optionKey="id" required="" value="${pcmInstance?.agegroup?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="pcm.content.label" default="Content" />
		
	</label>
	<g:textField name="content" value="${pcmInstance?.content}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pcm.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${pcmInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="pcm.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${pcmInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'pcmDate', 'error')} required">
	<label for="pcmDate">
		<g:message code="pcm.pcmDate.label" default="Pcm Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="pcmDate" precision="day"  value="${pcmInstance?.pcmDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'receiver', 'error')} ">
	<label for="receiver">
		<g:message code="pcm.receiver.label" default="Receiver" />
		
	</label>
	<g:textField name="receiver" value="${pcmInstance?.receiver}"/>
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

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'region', 'error')} required">
	<label for="region">
		<g:message code="pcm.region.label" default="Region" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="region" name="region.id" from="${com.cbc.Region.list()}" optionKey="id" required="" value="${pcmInstance?.region?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'sender', 'error')} ">
	<label for="sender">
		<g:message code="pcm.sender.label" default="Sender" />
		
	</label>
	<g:textField name="sender" value="${pcmInstance?.sender}"/>
</div>

