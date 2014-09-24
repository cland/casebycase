<%@ page import="com.cbc.Labour" %>
<g:set var="labourInstance" value="${caseInstance?.labour}"/>
<g:set var="isEditMode" value="${mode == "edit" }"/>
<g:hiddenField name="labour.id" value="${labourInstance?.id }"/>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'tradeUnionMember', 'error')} ">
	<label for="labour.tradeUnionMember">
		<g:message code="labour.tradeUnionMember.label" default="Trade Union Member" />
	</label>
	<g:if test="${isEditMode }">
	<g:select name="labour.tradeUnionMember" from="${com.cbc.Labour.constraints.tradeUnionMember.inList}" value="${labourInstance?.tradeUnionMember}" valueMessagePrefix="labour.tradeUnionMember" noSelection="['': '']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.tradeUnionMember }</span></g:else>
	<br/>
	<label for="labour.specifyMembership">
		<g:message code="labour.specifyMembership.label" default="Specify, if yes:" />	
	</label>
	<g:if test="${isEditMode }">
		<g:textField name="labour.specifyMembership" value="${labourInstance?.specifyMembership}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.specifyMembership }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'employerDetail', 'error')} ">
	<label for="labour.employerDetail">
		<g:message code="labour.employerDetail.label" default="Employer contact details" />
	</label>
	<g:if test="${isEditMode }">
		<g:textArea name="labour.employerDetail">${labourInstance?.employerDetail}</g:textArea>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.employerDetail }</span></g:else>	
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'unionAtWork', 'error')} ">
	<label for="labour.unionAtWork">
		<g:message code="labour.unionAtWork.label" default="Is there a union at your workplace?" />
	</label>
	<g:if test="${isEditMode }">
		<g:select name="labour.unionAtWork" from="${com.cbc.Labour.constraints.unionAtWork.inList}" value="${labourInstance?.unionAtWork}" valueMessagePrefix="labour.unionAtWork" noSelection="['': '']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.unionAtWork }</span></g:else>
	<br/>
	<label for="labour.specifyWorkUnion">
		<g:message code="labour.specifyWorkUnion.label" default="Specify, if yes:" />	
	</label>
	<g:if test="${isEditMode }">
		<g:textField name="labour.specifyWorkUnion" value="${labourInstance?.specifyWorkUnion}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.specifyWorkUnion }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'memberOfWorkUnion', 'error')} ">
	<label for="labour.memberOfWorkUnion">
		<g:message code="labour.memberOfWorkUnion.label" default="If there is a union, are you a member of that union?" />		
	</label>
	<g:if test="${isEditMode }">
		<g:select name="labour.memberOfWorkUnion" from="${com.cbc.Labour.constraints.memberOfWorkUnion.inList}" value="${labourInstance?.memberOfWorkUnion}" valueMessagePrefix="labour.memberOfWorkUnion" noSelection="['': '']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.memberOfWorkUnion }</span></g:else>	
</div>
<br/>
<fieldset><legend>TYPE OF PROBLEM</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowProblem', 'error')} ">
	<label for="labour.allowProblem">
		<g:message code="labour.allowProblem.label" default="Allow Problem" />		
	</label>
	<g:if test="${isEditMode }">
		<g:select id="allowProblem" name="labour.allowProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Allowance")?.problemTypes}" optionKey="id"  value="${labourInstance?.allowProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.allowProblem }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'benefitsProblem', 'error')} ">
	<label for="labour.benefitsProblem">
		<g:message code="labour.benefitsProblem.label" default="Benefits Problem" />
		
	</label>
	<g:if test="${isEditMode }">
		<g:select id="benefitsProblem" name="labour.benefitsProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Benefits")?.problemTypes}" optionKey="id"  value="${labourInstance?.benefitsProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.benefitsProblem }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'dismisal', 'error')} ">
	<label for="labour.dismisal">
		<g:message code="labour.dismisal.label" default="Dismisal" />		
	</label>
	<g:if test="${isEditMode }">
		<g:select id="dismisal" name="labour.dismisal.id" from="${com.cbc.lookup.ProblemType.findByName("Dismisal")?.problemTypes}" optionKey="id"  value="${labourInstance?.dismisal?.id}" class="many-to-one" noSelection="['':'-select-']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.dismisal }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'healthAndSafety', 'error')} ">
	<label for="labour.healthAndSafety">
		<g:message code="labour.healthAndSafety.label" default="Health And Safety" />	
	</label>
	<g:if test="${isEditMode }">
		<g:select id="healthAndSafety" name="labour.healthAndSafety.id" from="${com.cbc.lookup.ProblemType.findByName("HealthAndSafety")?.problemTypes}" optionKey="id" value="${labourInstance?.healthAndSafety?.id}" class="many-to-one" noSelection="['':'-select-']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.healthAndSafety }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leaveProblem', 'error')} ">
	<label for="labour.leaveProblem">
		<g:message code="labour.leaveProblem.label" default="Leave Problem" />
		
	</label>
	<g:if test="${isEditMode }">
		<g:select id="leaveProblem" name="labour.leaveProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Leave")?.problemTypes}" optionKey="id"  value="${labourInstance?.leaveProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.leaveProblem }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'uif', 'error')} ">
	<label for="labour.uif">
		<g:message code="labour.uif.label" default="Uif" />	
	</label>
	<g:if test="${isEditMode }">
		<g:select id="uif" name="labour.uif.id" from="${com.cbc.lookup.ProblemType.findByName("UIF")?.problemTypes}" optionKey="id"  value="${labourInstance?.uif?.id}" class="many-to-one" noSelection="['':'-select-']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.uif }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'wages', 'error')}">
	<label for="labour.wages">
		<g:message code="labour.wages.label" default="Wages" />
	</label>
	<g:if test="${isEditMode }">
		<g:select id="wages" name="labour.wages.id" from="${com.cbc.lookup.ProblemType.findByName("Wages")?.problemTypes}" optionKey="id"  value="${labourInstance?.wages?.id}" class="many-to-one" noSelection="['':'-select-']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.wages }</span></g:else>
</div>
</fieldset>

<fieldset><legend>LABOUR CONTRACT</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'hoursWorked', 'error')} ">
	<label for="labour.hoursWorked">
		<g:message code="labour.hoursWorked.label" default="Hours Worked" />
	</label>
	<g:if test="${isEditMode }">
	<g:textField name="labour.hoursWorkedValue" value="${labourInstance?.hoursWorkedValue}"/>
	<g:select name="labour.hoursWorked" from="${com.cbc.Labour.constraints.hoursWorked.inList}" value="${labourInstance?.hoursWorked}" valueMessagePrefix="labour.hoursWorked" noSelection="['': '']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.hoursWorkedValue } ${labourInstance?.hoursWorked }</span></g:else>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'earnings', 'error')} ">
	<label for="labour.earnings">
		<g:message code="labour.earnings.label" default="Earnings" />
	</label>
	<g:if test = "${isEditMode }">
	<g:textField name="labour.earningsValue" value="${labourInstance?.earningsValue}"/>
	<g:select name="labour.earnings" from="${com.cbc.Labour.constraints.earnings.inList}" value="${labourInstance?.earnings}" valueMessagePrefix="labour.earnings" noSelection="['': '']"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.earningsValue } ${labourInstance?.earnings }</span></g:else>
</div>
<fieldset><legend>Work Hours</legend>
<g:hiddenField name="labour.workhours.id" value="${labourInstance?.workhours?.id }"/>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.daily">
		<g:message code="workhours.daily.label" default="Daily" />		
	</label>
	<g:if test="${isEditMode }">
		<g:textField name="labour.workhours.daily" value="${labourInstance?.workhours?.daily}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.workhours?.daily }</span></g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.overtime">
		<g:message code="workhours.overtime.label" default="Overtime" />		
	</label>
	<g:if test="${isEditMode }">
		<g:textField name="labour.workhours.overtime" value="${labourInstance?.workhours?.overtime}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.workhours?.overtime }</span></g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.weekend">
		<g:message code="workhours.weekend.label" default="Saturday/Sunday" />		
	</label>
	<g:if test="${isEditMode }">
		<g:textField name="labour.workhours.weekend" value="${labourInstance?.workhours?.weekend}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.workhours?.weekend }</span></g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.holiday">
		<g:message code="workhours.holiday.label" default="Public Holiday" />		
	</label>
	<g:if test="${isEditMode }">
	<g:textField name="labour.workhours.holiday" value="${labourInstance?.workhours?.holiday}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.workhours?.holiday }</span></g:else>
</div>
</fieldset>
<fieldset><legend>Allowance Amount</legend>
	<label for="labour.allowAmount.nightWork">
		<g:message code="allowamount.nightwork.label" default="Night Work" />	
	</label>
	<g:hiddenField name="labour.allowAmount.id" value="${labourInstance?.allowAmount?.id }"/>
	<g:if test="${isEditMode }">
		<g:field type="number" name="labour.allowAmount.nightWork" value="${labourInstance?.allowAmount?.nightWork}"/>
	</g:if>
	<g:else><span class="property-value"><g:formatNumber number="${labourInstance?.allowAmount?.nightWork}" type="currency" currencyCode="ZAR" currencySymbol="R" /></span></g:else>
</fieldset>
<fieldset><legend>Benefits Amount</legend>
	<label for="labour.allowBenefit.pensionFund">
		<g:message code="allowbenefit.pensionfund.label" default="Provident/Pension Fund" />	
	</label>
	<g:if test="${isEditMode }">
		<g:hiddenField name="labour.allowBenefit.id" value="${labourInstance?.allowBenefit?.id }"/>
		<g:field type="number" name="labour.allowBenefit.pensionFund" value="${labourInstance?.allowBenefit?.pensionFund}"/>
	</g:if>
	<g:else><span class="property-value"><g:formatNumber number="${labourInstance?.allowBenefit?.pensionFund }" type="currency" currencyCode="ZAR" currencySymbol="R"/></span></g:else>
</fieldset>
<fieldset><legend>Leave Days</legend>
<g:hiddenField name="labour.leavedays.id" value="${labourInstance?.leavedays?.id }"/>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'annual', 'error')} ">
	<label for="labour.leavedays.annual">
		<g:message code="leavedays.annual.label" default="Annual" />		
	</label>
	<g:if test="${isEditMode }">
		<g:textField name="labour.leavedays.annual" value="${labourInstance?.leavedays?.annual}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.leavedays?.annual }</span></g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="labour.leavedays.sick">
		<g:message code="leavedays.sick.label" default="Sick" />		
	</label>
	<g:if test="${isEditMode }">
		<g:textField name="labour.leavedays.sick" value="${labourInstance?.leavedays?.sick}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.leavedays?.sick }</span></g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="labour.leavedays.maternity">
		<g:message code="leavedays.maternity.label" default="Maternity" />		
	</label>
	<g:if test="${isEditMode }">
	<g:textField name="labour.leavedays.maternity" value="${labourInstance?.leavedays?.maternity}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.leavedays?.maternity }</span></g:else>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="labour.leavedays.family">
		<g:message code="leavedays.family.label" default="Family Responsibility" />
	</label>
	<g:if test="${isEditMode }">
	<g:textField name="labour.leavedays.family" value="${labourInstance?.leavedays?.family}"/>
	</g:if>
	<g:else><span class="property-value">${labourInstance?.leavedays?.family }</span></g:else>
</div>
</fieldset>

</fieldset>