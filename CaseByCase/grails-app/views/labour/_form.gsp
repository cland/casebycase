<%@ page import="com.cbc.Labour" %>


<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'tradeUnionMember', 'error')} ">
	<label for="tradeUnionMember">
		<g:message code="labour.tradeUnionMember.label" default="Trade Union Member" />
		
	</label>
	<g:select name="tradeUnionMember" from="${labourInstance.constraints.tradeUnionMember.inList}" value="${labourInstance?.tradeUnionMember}" valueMessagePrefix="labour.tradeUnionMember" noSelection="['': '']"/>
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

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowAmount', 'error')} ">
	<label for="allowAmount">
		<g:message code="labour.allowAmount.label" default="Allow Amount" />
		
	</label>
	<g:field type="number" name="allowAmount" value="${fieldValue(bean: labourInstance, field: 'allowAmount')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowBenefit', 'error')} ">
	<label for="allowBenefit">
		<g:message code="labour.allowBenefit.label" default="Allow Benefit" />
		
	</label>
	<g:field type="number" name="allowBenefit" value="${fieldValue(bean: labourInstance, field: 'allowBenefit')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'hoursWorked', 'error')} ">
	<label for="hoursWorked">
		<g:message code="labour.hoursWorked.label" default="Hours Worked" />
		
	</label>
	<g:select name="hoursWorked" from="${labourInstance.constraints.hoursWorked.inList}" value="${labourInstance?.hoursWorked}" valueMessagePrefix="labour.hoursWorked" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'earnings', 'error')} ">
	<label for="earnings">
		<g:message code="labour.earnings.label" default="Earnings" />
		
	</label>
	<g:select name="earnings" from="${labourInstance.constraints.earnings.inList}" value="${labourInstance?.earnings}" valueMessagePrefix="labour.earnings" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leavedays', 'error')} ">
	<label for="leavedays">
		<g:message code="labour.leavedays.label" default="Leavedays" />
		
	</label>
	<g:select id="leavedays" name="leavedays.id" from="${com.cbc.LeaveDays.list()}" optionKey="id" value="${labourInstance?.leavedays?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'workhours', 'error')} ">
	<label for="workhours">
		<g:message code="labour.workhours.label" default="Workhours" />
		
	</label>
	<g:select id="workhours" name="workhours.id" from="${com.cbc.WorkHours.list()}" optionKey="id" value="${labourInstance?.workhours?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'earningsValue', 'error')} ">
	<label for="earningsValue">
		<g:message code="labour.earningsValue.label" default="Earnings Value" />
		
	</label>
	<g:textField name="earningsValue" value="${labourInstance?.earningsValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'hoursWorkedValue', 'error')} ">
	<label for="hoursWorkedValue">
		<g:message code="labour.hoursWorkedValue.label" default="Hours Worked Value" />
		
	</label>
	<g:field name="hoursWorkedValue" type="number" value="${labourInstance.hoursWorkedValue}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'specifyMembership', 'error')} ">
	<label for="specifyMembership">
		<g:message code="labour.specifyMembership.label" default="Specify Membership" />
		
	</label>
	<g:textField name="specifyMembership" value="${labourInstance?.specifyMembership}"/>
</div>

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

