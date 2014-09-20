<%@ page import="com.cbc.Labour" %>
<g:set var="isEditMode" value="${mode == "edit" }"/>
<g:hiddenField name="labour.labour.id" value="${labourInstance?.id }"/>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'tradeUnionMember', 'error')} ">
	<label for="tradeUnionMember">
		<g:message code="labour.tradeUnionMember.label" default="Trade Union Member" />
		
	</label>
	<g:select name="labour.labour.tradeUnionMember" from="${labourInstance.constraints.tradeUnionMember.inList}" value="${labourInstance?.tradeUnionMember}" valueMessagePrefix="labour.tradeUnionMember" noSelection="['': '']"/>
	<label for="specifyMembership">
		<g:message code="labour.specifyMembership.label" default="Specify, if yes:" />
		
	</label>
	<g:textField name="labour.labour.specifyMembership" value="${labourInstance?.specifyMembership}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'employerDetail', 'error')} ">
	<label for="employerDetail">
		<g:message code="labour.employerDetail.label" default="Employer Detail" />
		
	</label>
	<g:textField name="labour.labour.employerDetail" value="${labourInstance?.employerDetail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'unionAtWork', 'error')} ">
	<label for="unionAtWork">
		<g:message code="labour.unionAtWork.label" default="Union At Work" />
		
	</label>
	<g:select name="labour.labour.unionAtWork" from="${labourInstance.constraints.unionAtWork.inList}" value="${labourInstance?.unionAtWork}" valueMessagePrefix="labour.unionAtWork" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'memberOfWorkUnion', 'error')} ">
	<label for="memberOfWorkUnion">
		<g:message code="labour.memberOfWorkUnion.label" default="Member Of Work Union" />
		
	</label>
	<g:select name="labour.labour.memberOfWorkUnion" from="${labourInstance.constraints.memberOfWorkUnion.inList}" value="${labourInstance?.memberOfWorkUnion}" valueMessagePrefix="labour.memberOfWorkUnion" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="labour.name.label" default="Name" />
		
	</label>
	<g:textField name="labour.labour.name" value="${labourInstance?.name}"/>
</div>
<fieldset><legend>TYPE OF PROBLEM</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'wages', 'error')} ">
	<label for="wages">
		<g:message code="labour.wages.label" default="Wages" />
		
	</label>
	<g:select name="labour.labour.wages" from="${labourInstance.constraints.wages.inList}" value="${labourInstance?.wages}" valueMessagePrefix="labour.wages" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leaveProblem', 'error')} ">
	<label for="leaveProblem">
		<g:message code="labour.leaveProblem.label" default="Leave Problem" />
		
	</label>
	<g:select name="labour.labour.leaveProblem" from="${labourInstance.constraints.leaveProblem.inList}" value="${labourInstance?.leaveProblem}" valueMessagePrefix="labour.leaveProblem" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowProblem', 'error')} ">
	<label for="allowProblem">
		<g:message code="labour.allowProblem.label" default="Allow Problem" />
		
	</label>
	<g:select name="labour.labour.allowProblem" from="${labourInstance.constraints.allowProblem.inList}" value="${labourInstance?.allowProblem}" valueMessagePrefix="labour.allowProblem" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'benefitsProblem', 'error')} ">
	<label for="benefitsProblem">
		<g:message code="labour.benefitsProblem.label" default="Benefits Problem" />
		
	</label>
	<g:select name="labour.labour.benefitsProblem" from="${labourInstance.constraints.benefitsProblem.inList}" value="${labourInstance?.benefitsProblem}" valueMessagePrefix="labour.benefitsProblem" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'healthAndSafety', 'error')} ">
	<label for="healthAndSafety">
		<g:message code="labour.healthAndSafety.label" default="Health And Safety" />
		
	</label>
	<g:select name="labour.labour.healthAndSafety" from="${labourInstance.constraints.healthAndSafety.inList}" value="${labourInstance?.healthAndSafety}" valueMessagePrefix="labour.healthAndSafety" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'dismisal', 'error')} ">
	<label for="dismisal">
		<g:message code="labour.dismisal.label" default="Dismisal" />
		
	</label>
	<g:select name="labour.labour.dismisal" from="${labourInstance.constraints.dismisal.inList}" value="${labourInstance?.dismisal}" valueMessagePrefix="labour.dismisal" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'uif', 'error')} ">
	<label for="uif">
		<g:message code="labour.uif.label" default="Uif" />
		
	</label>
	<g:select name="labour.labour.uif" from="${labourInstance.constraints.uif.inList}" value="${labourInstance?.uif}" valueMessagePrefix="labour.uif" noSelection="['': '']"/>
</div>
</fieldset>

<fieldset><legend>LABOUR CONTRACT</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowAmount', 'error')} ">
	<label for="allowAmount">
		<g:message code="labour.allowAmount.label" default="Allow Amount" />
		
	</label>
	<g:field type="number" name="labour.labour.allowAmount" value="${fieldValue(bean: labourInstance, field: 'allowAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowBenefit', 'error')} ">
	<label for="allowBenefit">
		<g:message code="labour.allowBenefit.label" default="Allow Benefit" />
	
	</label>
	
	<g:field type="number" name="labour.labour.allowBenefit" value="${fieldValue(bean: labourInstance, field: 'allowBenefit')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'hoursWorked', 'error')} ">
	<label for="hoursWorked">
		<g:message code="labour.hoursWorked.label" default="Hours Worked" />
	</label>
	<g:textField name="labour.labour.hoursWorkedValue" value="${labourInstance?.hoursWorkedValue}"/>
	<g:select name="labour.labour.hoursWorked" from="${labourInstance.constraints.hoursWorked.inList}" value="${labourInstance?.hoursWorked}" valueMessagePrefix="labour.hoursWorked" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'earnings', 'error')} ">
	<label for="earnings">
		<g:message code="labour.earnings.label" default="Earnings" />
	</label>
	<g:textField name="labour.labour.earningsValue" value="${labourInstance?.earningsValue}"/>
	<g:select name="labour.labour.earnings" from="${labourInstance.constraints.earnings.inList}" value="${labourInstance?.earnings}" valueMessagePrefix="labour.earnings" noSelection="['': '']"/>
</div>


<fieldset><legend>WORK HOURS</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.overtime">
		<g:message code="workhours.overtime.label" default="Overtime" />
		
	</label>
	<g:textField name="labour.labour.overtime" value="${labourInstance?.workhours?.overtime}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.weekend">
		<g:message code="workhours.weekend.label" default="Saturday/Sunday" />
		
	</label>
	<g:textField name="labour.labour.weekend" value="${labourInstance?.workhours?.weekend}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours.holiday">
		<g:message code="workhours.holiday.label" default="Public Holiday" />
		
	</label>
	<g:textField name="labour.labour.holiday" value="${labourInstance?.workhours?.holiday}"/>
</div>
</fieldset>
<fieldset><legend>LEAVE DAYS</legend>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'annual', 'error')} ">
	<label for="leavedays.annual">
		<g:message code="leavedays.annual.label" default="Annual" />
		
	</label>
	<g:textField name="labour.labour.annual" value="${labourInstance?.leavedays?.annual}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays.sick">
		<g:message code="leavedays.sick.label" default="Sick" />
		
	</label>
	<g:textField name="labour.labour.sick" value="${labourInstance?.leavedays?.sick}"/>
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
