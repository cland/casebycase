<%@ page import="com.cbc.Labour" %>
<g:set var="isEditMode" value="${mode == "edit" }"/>
<g:hiddenField name="labour.id" value="${labourInstance?.id }"/>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'tradeUnionMember', 'error')} ">
	<label for="tradeUnionMember">
		<g:message code="labour.tradeUnionMember.label" default="Trade Union Member" />
		
	</label>
	<g:select name="labour.tradeUnionMember" from="${com.cbc.Labour.constraints.tradeUnionMember.inList}" value="${labourInstance?.tradeUnionMember}" valueMessagePrefix="labour.tradeUnionMember" noSelection="['': '']"/>
	<label for="specifyMembership">
		<g:message code="labour.specifyMembership.label" default="Specify, if yes:" />
		
	</label>
	<g:textField name="labour.specifyMembership" value="${labourInstance?.specifyMembership}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'employerDetail', 'error')} ">
	<label for="employerDetail">
		<g:message code="labour.employerDetail.label" default="Employer contact details" />
		
	</label>
	<g:textArea name="labour.employerDetail">${labourInstance?.employerDetail}</g:textArea>
	
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'unionAtWork', 'error')} ">
	<label for="unionAtWork">
		<g:message code="labour.unionAtWork.label" default="Union in workplace?" />
	</label>
	<g:select name="labour.unionAtWork" from="${com.cbc.Labour.constraints.unionAtWork.inList}" value="${labourInstance?.unionAtWork}" valueMessagePrefix="labour.unionAtWork" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'memberOfWorkUnion', 'error')} ">
	<label for="memberOfWorkUnion">
		<g:message code="labour.memberOfWorkUnion.label" default="Member of the union?" />
		
	</label>
	<g:select name="labour.memberOfWorkUnion" from="${com.cbc.Labour.constraints.memberOfWorkUnion.inList}" value="${labourInstance?.memberOfWorkUnion}" valueMessagePrefix="labour.memberOfWorkUnion" noSelection="['': '']"/>
</div>

<fieldset><legend>TYPE OF PROBLEM</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowProblem', 'error')} required">
	<label for="allowProblem">
		<g:message code="labour.allowProblem.label" default="Allow Problem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="allowProblem" name="labour.allowProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Allowance")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.allowProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'benefitsProblem', 'error')} required">
	<label for="benefitsProblem">
		<g:message code="labour.benefitsProblem.label" default="Benefits Problem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="benefitsProblem" name="labour.benefitsProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Benefits")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.benefitsProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'dismisal', 'error')} required">
	<label for="dismisal">
		<g:message code="labour.dismisal.label" default="Dismisal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dismisal" name="labour.dismisal.id" from="${com.cbc.lookup.ProblemType.findByName("Dismisal")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.dismisal?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'healthAndSafety', 'error')} required">
	<label for="healthAndSafety">
		<g:message code="labour.healthAndSafety.label" default="Health And Safety" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="healthAndSafety" name="labour.healthAndSafety.id" from="${com.cbc.lookup.ProblemType.findByName("HealthAndSafety")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.healthAndSafety?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leaveProblem', 'error')} required">
	<label for="leaveProblem">
		<g:message code="labour.leaveProblem.label" default="Leave Problem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="leaveProblem" name="labour.leaveProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Leave")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.leaveProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'uif', 'error')} required">
	<label for="uif">
		<g:message code="labour.uif.label" default="Uif" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="uif" name="labour.uif.id" from="${com.cbc.lookup.ProblemType.findByName("UIF")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.uif?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'wages', 'error')} required">
	<label for="wages">
		<g:message code="labour.wages.label" default="Wages" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wages" name="labour.wages.id" from="${com.cbc.lookup.ProblemType.findByName("Wages")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.wages?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>
</fieldset>

<fieldset><legend>LABOUR CONTRACT</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'hoursWorked', 'error')} ">
	<label for="hoursWorked">
		<g:message code="labour.hoursWorked.label" default="Hours Worked" />
	</label>
	<g:textField name="labour.hoursWorkedValue" value="${labourInstance?.hoursWorkedValue}"/>
	<g:select name="labour.hoursWorked" from="${com.cbc.Labour.constraints.hoursWorked.inList}" value="${labourInstance?.hoursWorked}" valueMessagePrefix="labour.hoursWorked" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'earnings', 'error')} ">
	<label for="earnings">
		<g:message code="labour.earnings.label" default="Earnings" />
	</label>
	<g:textField name="labour.earningsValue" value="${labourInstance?.earningsValue}"/>
	<g:select name="labour.earnings" from="${com.cbc.Labour.constraints.earnings.inList}" value="${labourInstance?.earnings}" valueMessagePrefix="labour.earnings" noSelection="['': '']"/>
</div>
<fieldset><legend>Work Hours</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.overtime">
		<g:message code="workhours.overtime.label" default="Overtime" />
		
	</label>
	<g:textField name="labour.overtime" value="${labourInstance?.workhours?.overtime}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.weekend">
		<g:message code="workhours.weekend.label" default="Saturday/Sunday" />
		
	</label>
	<g:textField name="labour.weekend" value="${labourInstance?.workhours?.weekend}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.holiday">
		<g:message code="workhours.holiday.label" default="Public Holiday" />
		
	</label>
	<g:textField name="labour.holiday" value="${labourInstance?.workhours?.holiday}"/>
</div>
</fieldset>
<fieldset><legend>Allowance Amount</legend>
	<label for="allowAmount.nightWork">
		<g:message code="allowamount.nightwork.label" default="Night Work" />	
	</label>
	<g:field type="number" name="labour.annual" value="${labourInstance?.allowAmount?.nightWork}"/>
</fieldset>
<fieldset><legend>Benefits Amount</legend>
	<label for="allowBenefit.pensionFund">
		<g:message code="allowbenefit.pensionfund.label" default="Provident/Pension Fund" />	
	</label>
	<g:field type="number" name="labour.annual" value="${labourInstance?.allowBenefit?.pensionFund}"/>
</fieldset>
<fieldset><legend>Leave Days</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'annual', 'error')} ">
	<label for="leavedays.annual">
		<g:message code="leavedays.annual.label" default="Annual" />
		
	</label>
	<g:textField name="labour.annual" value="${labourInstance?.leavedays?.annual}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays.sick">
		<g:message code="leavedays.sick.label" default="Sick" />
		
	</label>
	<g:textField name="labour.sick" value="${labourInstance?.leavedays?.sick}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays.maternity">
		<g:message code="leavedays.maternity.label" default="Maternity" />
		
	</label>
	<g:textField name="labour.maternity" value="${labourInstance?.leavedays?.maternity}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays.family">
		<g:message code="leavedays.family.label" default="Family Responsibility" />
		
	</label>
	<g:textField name="labour.family" value="${labourInstance?.leavedays?.family}"/>
</div>
</fieldset>

</fieldset>