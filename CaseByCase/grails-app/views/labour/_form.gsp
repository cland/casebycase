<%@ page import="com.cbc.Labour" %>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'tradeUnionMember', 'error')} ">
	<label for="labour.tradeUnionMember">
		<g:message code="labour.tradeUnionMember.label" default="Trade Union Member" />
		 
	</label>
	<g:select name="tradeUnionMember" from="${com.cbc.Labour.constraints.tradeUnionMember.inList}" value="${labourInstance?.tradeUnionMember}" valueMessagePrefix="labour.tradeUnionMember" noSelection="['': '']"/>
	<label for="labour.specifyMembership"> 
		<g:message code="labour.specifyMembership.label" default="Specify, if yes:" />	
	</label>
	<g:textField name="specifyMembership" value="${labourInstance?.specifyMembership}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'employerDetail', 'error')} ">
	<label for="labour.employerDetail">
		<g:message code="labour.employerDetail.label" default="Employer contact details" />
		
	</label>
	<g:textArea name="employerDetail">${labourInstance?.employerDetail}</g:textArea>	
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'unionAtWork', 'error')} ">
	<label for="labour.unionAtWork">
		<g:message code="labour.unionAtWork.label" default="Is there a union at your workplace?" />
	</label>
	<g:select name="unionAtWork" from="${com.cbc.Labour.constraints.unionAtWork.inList}" value="${labourInstance?.unionAtWork}" valueMessagePrefix="labour.unionAtWork" noSelection="['': '']"/>
	<label for="labour.specifyWorkUnion">
		<g:message code="labour.specifyWorkUnion.label" default="Specify, if yes:" />	
	</label>
	<g:textField name="specifyWorkUnion" value="${labourInstance?.specifyWorkUnion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'memberOfWorkUnion', 'error')} ">
	<label for="labour.memberOfWorkUnion">
		<g:message code="labour.memberOfWorkUnion.label" default="If there is a union, are you a member of that union?" />
		
	</label>
	<g:select name="memberOfWorkUnion" from="${com.cbc.Labour.constraints.memberOfWorkUnion.inList}" value="${labourInstance?.memberOfWorkUnion}" valueMessagePrefix="labour.memberOfWorkUnion" noSelection="['': '']"/>
</div>

<fieldset><legend>TYPE OF PROBLEM</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowProblem', 'error')} ">
	<label for="labour.allowProblem">
		<g:message code="labour.allowProblem.label" default="Allowance" />
		
	</label>
	<g:select id="allowProblem" name="allowProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Allowance")?.problemTypes}" optionKey="id"  value="${labourInstance?.allowProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'benefitsProblem', 'error')} ">
	<label for="labour.benefitsProblem">
		<g:message code="labour.benefitsProblem.label" default="Benefits" />
		
	</label>
	<g:select id="benefitsProblem" name="benefitsProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Benefits")?.problemTypes}" optionKey="id"  value="${labourInstance?.benefitsProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'dismisal', 'error')} ">
	<label for="labour.dismisal">
		<g:message code="labour.dismisal.label" default="Dismisal" />
		
	</label>
	<g:select id="dismisal" name="dismisal.id" from="${com.cbc.lookup.ProblemType.findByName("Dismisal")?.problemTypes}" optionKey="id"  value="${labourInstance?.dismisal?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'healthAndSafety', 'error')} ">
	<label for="labour.healthAndSafety">
		<g:message code="labour.healthAndSafety.label" default="Health And Safety" />
		
	</label>
	<g:select id="healthAndSafety" name="healthAndSafety.id" from="${com.cbc.lookup.ProblemType.findByName("HealthAndSafety")?.problemTypes}" optionKey="id" value="${labourInstance?.healthAndSafety?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leaveProblem', 'error')} ">
	<label for="labour.leaveProblem">
		<g:message code="labour.leaveProblem.label" default="Leave Problem" />
		
	</label>
	<g:select id="leaveProblem" name="leaveProblem.id" from="${com.cbc.lookup.ProblemType.findByName("Leave")?.problemTypes}" optionKey="id"  value="${labourInstance?.leaveProblem?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'uif', 'error')} ">
	<label for="labour.uif">
		<g:message code="labour.uif.label" default="Uif" />
		
	</label>
	<g:select id="uif" name="uif.id" from="${com.cbc.lookup.ProblemType.findByName("UIF")?.problemTypes}" optionKey="id"  value="${labourInstance?.uif?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'wages', 'error')}">
	<label for="labour.wages">
		<g:message code="labour.wages.label" default="Wages" />
	</label>
	<g:select id="wages" name="wages.id" from="${com.cbc.lookup.ProblemType.findByName("Wages")?.problemTypes}" optionKey="id"  value="${labourInstance?.wages?.id}" class="many-to-one" noSelection="['':'-select-']"/>
</div>
</fieldset>

<fieldset><legend>LABOUR CONTRACT</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'hoursWorked', 'error')} ">
	<label for="labour.hoursWorked">
		<g:message code="labour.hoursWorked.label" default="Hours Worked" />
	</label>
	<g:textField name="hoursWorkedValue" value="${labourInstance?.hoursWorkedValue}"/>
	<g:select name="hoursWorked" from="${com.cbc.Labour.constraints.hoursWorked.inList}" value="${labourInstance?.hoursWorked}" valueMessagePrefix="labour.hoursWorked" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'earnings', 'error')} ">
	<label for="labour.earnings">
		<g:message code="labour.earnings.label" default="Earnings" />
	</label>
	<g:textField name="earningsValue" value="${labourInstance?.earningsValue}"/>
	<g:select name="earnings" from="${com.cbc.Labour.constraints.earnings.inList}" value="${labourInstance?.earnings}" valueMessagePrefix="labour.earnings" noSelection="['': '']"/>
</div>
<fieldset><legend>Work Hours</legend>
<g:hiddenField name="workhours.id" value="${labourInstance?.workhours?.id }"/>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.daily">
		<g:message code="workhours.daily.label" default="Daily" />
		
	</label>
	<g:textField name="workhours.daily" value="${labourInstance?.workhours?.daily}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.overtime">
		<g:message code="workhours.overtime.label" default="Overtime" />
		
	</label>
	<g:textField name="workhours.overtime" value="${labourInstance?.workhours?.overtime}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.weekend">
		<g:message code="workhours.weekend.label" default="Saturday/Sunday" />
		
	</label>
	<g:textField name="workhours.weekend" value="${labourInstance?.workhours?.weekend}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="labour.workhours.holiday">
		<g:message code="workhours.holiday.label" default="Public Holiday" />
		
	</label>
	<g:textField name="workhours.holiday" value="${labourInstance?.workhours?.holiday}"/>
</div>
</fieldset>
<fieldset><legend>Allowance Amount</legend>
	<label for="labour.allowAmount.nightWork">
		<g:message code="allowamount.nightwork.label" default="Night Work" />	
	</label>
	<g:hiddenField name="allowAmount.id" value="${labourInstance?.allowAmount?.id }"/>
	<g:field type="number" name="allowAmount.nightWork" value="${labourInstance?.allowAmount?.nightWork}" step="0.01"/>
</fieldset>
<fieldset><legend>Benefits Amount</legend>
	<label for="labour.allowBenefit.pensionFund">
		<g:message code="allowbenefit.pensionfund.label" default="Provident/Pension Fund" />	
	</label>
	<g:hiddenField name="allowBenefit.id" value="${labourInstance?.allowBenefit?.id }"/>
	<g:field type="number" name="allowBenefit.pensionFund" value="${labourInstance?.allowBenefit?.pensionFund} " step="0.01"/>
</fieldset>
<fieldset><legend>Leave Days</legend>
<g:hiddenField name="leavedays.id" value="${labourInstance?.leavedays?.id }"/>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'annual', 'error')} ">
	<label for="labour.leavedays.annual">
		<g:message code="leavedays.annual.label" default="Annual" />
		
	</label>
	<g:textField name="leavedays.annual" value="${labourInstance?.leavedays?.annual}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="labour.leavedays.sick">
		<g:message code="leavedays.sick.label" default="Sick" />
		
	</label>
	<g:textField name="leavedays.sick" value="${labourInstance?.leavedays?.sick}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="labour.leavedays.maternity">
		<g:message code="leavedays.maternity.label" default="Maternity" />
		
	</label>
	<g:textField name="leavedays.maternity" value="${labourInstance?.leavedays?.maternity}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="labour.leavedays.family">
		<g:message code="leavedays.family.label" default="Family Responsibility" />
		
	</label>
	<g:textField name="leavedays.family" value="${labourInstance?.leavedays?.family}"/>
</div>
</fieldset>

</fieldset>

