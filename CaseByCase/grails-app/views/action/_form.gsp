<%@ page import="com.cbc.Action" %>



<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="action.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${actionInstance?.date}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'actionToFrom', 'error')} ">
	<label for="actionToFrom">
		<g:message code="action.actionToFrom.label" default="Action To From" />
		
	</label>
	<g:textField name="actionToFrom" value="${actionInstance?.actionToFrom}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="action.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${actionInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="action.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${actionInstance?.subject}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'followUpStatus', 'error')} required">
	<label for="followUpStatus">
		<g:message code="action.followUpStatus.label" default="Follow Up Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="followUpStatus" from="${actionInstance.constraints.followUpStatus.inList}" required="" value="${actionInstance?.followUpStatus}" valueMessagePrefix="action.followUpStatus"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'disbursementAmount', 'error')} required">
	<label for="disbursementAmount">
		<g:message code="action.disbursementAmount.label" default="Disbursement Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="disbursementAmount" value="${fieldValue(bean: actionInstance, field: 'disbursementAmount')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'isPrivate', 'error')} ">
	<label for="isPrivate">
		<g:message code="action.isPrivate.label" default="Is Private" />
		
	</label>
	<g:checkBox name="isPrivate" value="${actionInstance?.isPrivate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="action.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${actionInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="action.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${actionInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'actionOwner', 'error')} required">
	<label for="actionOwner">
		<g:message code="action.actionOwner.label" default="Action Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="actionOwner" name="actionOwner.id" from="${com.cbc.User.list()}" optionKey="id" required="" value="${actionInstance?.actionOwner?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'actionType', 'error')} required">
	<label for="actionType">
		<g:message code="action.actionType.label" default="Action Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="actionType" name="actionType.id" from="${com.cbc.ActionType.list()}" optionKey="id" required="" value="${actionInstance?.actionType?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'followUpDate', 'error')} required">
	<label for="followUpDate">
		<g:message code="action.followUpDate.label" default="Follow Up Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="followUpDate" precision="day"  value="${actionInstance?.followUpDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'followers', 'error')} ">
	<label for="followers">
		<g:message code="action.followers.label" default="Followers" />
		
	</label>
	<g:select name="followers" from="${com.cbc.User.list()}" multiple="multiple" optionKey="id" size="5" value="${actionInstance?.followers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'thiscase', 'error')} required">
	<label for="thiscase">
		<g:message code="action.thiscase.label" default="Thiscase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="thiscase" name="thiscase.id" from="${com.cbc.Case.list()}" optionKey="id" required="" value="${actionInstance?.thiscase?.id}" class="many-to-one"/>
</div>

