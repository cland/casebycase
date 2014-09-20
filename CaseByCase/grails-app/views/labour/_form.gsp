<%@ page import="com.cbc.Labour" %>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'tradeUnionMember', 'error')} ">
	<label for="tradeUnionMember">
		<g:message code="labour.tradeUnionMember.label" default="Trade Union Member" />
		
	</label>
	<g:select name="tradeUnionMember" from="${labourInstance.constraints.tradeUnionMember.inList}" value="${labourInstance?.tradeUnionMember}" valueMessagePrefix="labour.tradeUnionMember" noSelection="['': '']"/>
	<label for="specifyMembership">
		<g:message code="labour.specifyMembership.label" default="Specify, if yes:" />
		
	</label>
	<g:textField name="specifyMembership" value="${labourInstance?.specifyMembership}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'employerDetail', 'error')} ">
	<label for="employerDetail">
		<g:message code="labour.employerDetail.label" default="Employer Detail" />
		
	</label>
	<g:textField name="employerDetail" value="${labourInstance?.employerDetail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'unionAtWork', 'error')} ">
	<label for="unionAtWork">
		<g:message code="labour.unionAtWork.label" default="Union At Work" />
		
	</label>
	<g:select name="unionAtWork" from="${labourInstance.constraints.unionAtWork.inList}" value="${labourInstance?.unionAtWork}" valueMessagePrefix="labour.unionAtWork" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'memberOfWorkUnion', 'error')} ">
	<label for="memberOfWorkUnion">
		<g:message code="labour.memberOfWorkUnion.label" default="Member Of Work Union" />
		
	</label>
	<g:select name="memberOfWorkUnion" from="${labourInstance.constraints.memberOfWorkUnion.inList}" value="${labourInstance?.memberOfWorkUnion}" valueMessagePrefix="labour.memberOfWorkUnion" noSelection="['': '']"/>
</div>

<fieldset><legend>TYPE OF PROBLEM</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowProblem', 'error')} required">
	<label for="allowProblem">
		<g:message code="labour.allowProblem.label" default="Allow Problem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="allowProblem" name="allowProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Allowance")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.allowProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'benefitsProblem', 'error')} required">
	<label for="benefitsProblem">
		<g:message code="labour.benefitsProblem.label" default="Benefits Problem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="benefitsProblem" name="benefitsProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Benefits")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.benefitsProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'dismisal', 'error')} required">
	<label for="dismisal">
		<g:message code="labour.dismisal.label" default="Dismisal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dismisal" name="dismisal.id" from="${com.cbc.lookup.ProblemType.findByName("Dismisal")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.dismisal?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'healthAndSafety', 'error')} required">
	<label for="healthAndSafety">
		<g:message code="labour.healthAndSafety.label" default="Health And Safety" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="healthAndSafety" name="healthAndSafety.id" from="${com.cbc.lookup.ProblemType.findByName("HealthAndSafety")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.healthAndSafety?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leaveProblem', 'error')} required">
	<label for="leaveProblem">
		<g:message code="labour.leaveProblem.label" default="Leave Problem" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="leaveProblem" name="leaveProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Leave")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.leaveProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'uif', 'error')} required">
	<label for="uif">
		<g:message code="labour.uif.label" default="Uif" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="uif" name="uif.id" from="${com.cbc.lookup.ProblemType.findByName("UIF")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.uif?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'wages', 'error')} required">
	<label for="wages">
		<g:message code="labour.wages.label" default="Wages" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="wages" name="wages.id" from="${com.cbc.lookup.ProblemType.findByName("Wages")?.problemTypes}" optionKey="id" required="" value="${labourInstance?.wages?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>
</fieldset>

<fieldset><legend>LABOUR CONTRACT</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'hoursWorked', 'error')} ">
	<label for="hoursWorked">
		<g:message code="labour.hoursWorked.label" default="Hours Worked" />
	</label>
	<g:textField name="hoursWorkedValue" value="${labourInstance?.hoursWorkedValue}"/>
	<g:select name="hoursWorked" from="${labourInstance.constraints.hoursWorked.inList}" value="${labourInstance?.hoursWorked}" valueMessagePrefix="labour.hoursWorked" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'earnings', 'error')} ">
	<label for="earnings">
		<g:message code="labour.earnings.label" default="Earnings" />
	</label>
	<g:textField name="earningsValue" value="${labourInstance?.earningsValue}"/>
	<g:select name="earnings" from="${labourInstance.constraints.earnings.inList}" value="${labourInstance?.earnings}" valueMessagePrefix="labour.earnings" noSelection="['': '']"/>
</div>
<fieldset><legend>Work Hours</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.overtime">
		<g:message code="workhours.overtime.label" default="Overtime" />
		
	</label>
	<g:textField name="overtime" value="${labourInstance?.workhours?.overtime}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.weekend">
		<g:message code="workhours.weekend.label" default="Saturday/Sunday" />
		
	</label>
	<g:textField name="weekend" value="${labourInstance?.workhours?.weekend}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.holiday">
		<g:message code="workhours.holiday.label" default="Public Holiday" />
		
	</label>
	<g:textField name="holiday" value="${labourInstance?.workhours?.holiday}"/>
</div>
</fieldset>
<fieldset><legend>Allowance Amount</legend>
	<label for="allowAmount.nightWork">
		<g:message code="allowamount.nightwork.label" default="Night Work" />	
	</label>
	<g:field type="number" name="annual" value="${labourInstance?.allowAmount?.nightWork}"/>
</fieldset>
<fieldset><legend>Benefits Amount</legend>
	<label for="allowBenefit.pensionFund">
		<g:message code="allowbenefit.pensionfund.label" default="Provident/Pension Fund" />	
	</label>
	<g:field type="number" name="annual" value="${labourInstance?.allowBenefit?.pensionFund}"/>
</fieldset>
<fieldset><legend>Leave Days</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'annual', 'error')} ">
	<label for="leavedays.annual">
		<g:message code="leavedays.annual.label" default="Annual" />
		
	</label>
	<g:textField name="annual" value="${labourInstance?.leavedays?.annual}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays.sick">
		<g:message code="leavedays.sick.label" default="Sick" />
		
	</label>
	<g:textField name="sick" value="${labourInstance?.leavedays?.sick}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays.maternity">
		<g:message code="leavedays.maternity.label" default="Maternity" />
		
	</label>
	<g:textField name="maternity" value="${labourInstance?.leavedays?.maternity}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays.family">
		<g:message code="leavedays.family.label" default="Family Responsibility" />
		
	</label>
	<g:textField name="family" value="${labourInstance?.leavedays?.family}"/>
</div>
</fieldset>

</fieldset>