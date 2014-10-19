<%@ page import="com.cbc.Action" %>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'subject', 'error')} required">
	<label for="subject">
		<g:message code="action.subject.label" default="Subject" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="subject" required="" value="${actionInstance?.subject}"/>
</div>

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
	<g:textArea name="description" required="">${actionInstance?.description}</g:textArea>
	
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'followUpStatus', 'error')} required">
	<label for="followUpStatus">
		<g:message code="action.followUpStatus.label" default="Follow Up Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="followUpStatus" from="${actionInstance.constraints.followUpStatus.inList}" required="" value="${actionInstance?.followUpStatus}" valueMessagePrefix="action.followUpStatus" noSelection="['':'-select one-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'isPrivate', 'error')} ">
	<label for="isPrivate">
		<g:message code="action.isPrivate.label" default="Is Private" />
		
	</label>
	<g:checkBox name="isPrivate" value="${actionInstance?.isPrivate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'actionOwner', 'error')} required">
	<label for="actionOwner">
		<g:message code="action.actionOwner.label" default="Action Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select optionValue="fullname" id="actionOwner" name="actionOwner.id" from="${cbcApiService?.getCaseWorkers(actionInstance?.thiscase?.office,params)}" optionKey="id" required="" value="${actionInstance?.actionOwner?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'actionType', 'error')} required">
	<label for="actionType">
		<g:message code="action.actionType.label" default="Action Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="actionType" name="actionType.id" from="${com.cbc.ActionType.list()}" optionKey="id" required="" value="${actionInstance?.actionType?.id}" class="many-to-one" noSelection="['':'-select one-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'followUpDate', 'error')} required">
	<label for="followUpDate">
		<g:message code="action.followUpDate.label" default="Follow Up Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="followUpDate" precision="day"  value="${actionInstance?.followUpDate}"  relativeYears="[0..3]"/>
</div>
<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'disbursementAmount', 'error')} required">
	<label for="disbursementAmount">
		<g:message code="action.disbursementAmount.label" default="Disbursement Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="disbursementAmount" type="number" value="${fieldValue(bean: actionInstance, field: 'disbursementAmount')}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: actionInstance, field: 'thiscase', 'error')} required">
	<label for="thiscase">
		<g:message code="action.thiscase.label" default="Case" />
		<span class="required-indicator">*</span>
	</label>
	<g:hiddenField name="thiscase.id" value="${actionInstance?.thiscase?.id}"/>
	<span>
		${(actionInstance?.thiscase ? actionInstance?.thiscase : 'No Case Selected')}
	</span>
<%--	<g:select id="thiscase" name="thiscase.id" from="${com.cbc.Case.list()}" optionKey="id" required="" value="${actionInstance?.thiscase?.id}" class="many-to-one"/>--%>
</div>

<%--SUPPORTING DOCUMENTS SECTION--%>
<fieldset><legend>SUPPORTING DOCUMENTS</legend>

	<h1>Documents</h1>
	
	<input type="file" name="documents"/>
	<input type="file" name="documents"/>
	<g:if test="${params?.action == false }">
	<br/>
		<div id="attachments" class="attachments">
				<attachments:each bean="${actionInstance}" inputName="documents" status="i">	
				<div class="photo-display float-left">
				<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
					<img src="${resource(dir:'images/icons',file:'attach.png',plugin:'famfamfam')}" />			
					<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
					${attachment.niceLength}
					<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
						returnPageURI="${createLink(action:'show', id:actionInstance.id,absolute:true)}" />
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
				<attachments:each bean="${actionInstance}" inputName="documents" status="i">	
				<div class="photo-display float-left">
				<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
					<img src="${resource(dir:'images/icons',file:'picture.png',plugin:'famfamfam')}" />			
					<attachments:downloadLink attachment="${attachment}" inline="true" withContentType="true" />
					${attachment.niceLength}
					<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
						returnPageURI="${createLink(action:'show', id:actionInstance.id,absolute:true)}" />
				</div>	
					<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
				
				</attachments:each>
				<div style="clear:both"></div>
		</div>
	</g:if>	
</fieldset>
