<%@ page import="com.cbc.Labour" %>



<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="labour.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${labourInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="labour.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${labourInstance.createdBy}" required=""/>
</div>

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

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'wages', 'error')} ">
	<label for="wages">
		<g:message code="labour.wages.label" default="Wages" />
		
	</label>
	<g:select id="wages" name="wages.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${labourInstance?.wages?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'leaveProblem', 'error')} ">
	<label for="leaveProblem">
		<g:message code="labour.leaveProblem.label" default="Leave Problem" />
		
	</label>
	<g:select id="leaveProblem" name="leaveProblem.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${labourInstance?.leaveProblem?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowProblem', 'error')} ">
	<label for="allowProblem">
		<g:message code="labour.allowProblem.label" default="Allow Problem" />
		
	</label>
	<g:select id="allowProblem" name="allowProblem.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${labourInstance?.allowProblem?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'benefitsProblem', 'error')} ">
	<label for="benefitsProblem">
		<g:message code="labour.benefitsProblem.label" default="Benefits Problem" />
		
	</label>
	<g:select id="benefitsProblem" name="benefitsProblem.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${labourInstance?.benefitsProblem?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'healthAndSafety', 'error')} ">
	<label for="healthAndSafety">
		<g:message code="labour.healthAndSafety.label" default="Health And Safety" />
		
	</label>
	<g:select id="healthAndSafety" name="healthAndSafety.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${labourInstance?.healthAndSafety?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'dismisal', 'error')} ">
	<label for="dismisal">
		<g:message code="labour.dismisal.label" default="Dismisal" />
		
	</label>
	<g:select id="dismisal" name="dismisal.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${labourInstance?.dismisal?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'uif', 'error')} ">
	<label for="uif">
		<g:message code="labour.uif.label" default="Uif" />
		
	</label>
	<g:select id="uif" name="uif.id" from="${com.cbc.lookup.ProblemType.list()}" optionKey="id" value="${labourInstance?.uif?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowAmount', 'error')} required">
	<label for="allowAmount">
		<g:message code="labour.allowAmount.label" default="Allow Amount" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="allowAmount" name="allowAmount.id" from="${com.cbc.AllowanceAmount.list()}" optionKey="id" required="" value="${labourInstance?.allowAmount?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'allowBenefit', 'error')} required">
	<label for="allowBenefit">
		<g:message code="labour.allowBenefit.label" default="Allow Benefit" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="allowBenefit" name="allowBenefit.id" from="${com.cbc.BenefitsAmount.list()}" optionKey="id" required="" value="${labourInstance?.allowBenefit?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: labourInstance, field: 'thiscase', 'error')} required">
	<label for="thiscase">
		<g:message code="labour.thiscase.label" default="Thiscase" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="thiscase" name="thiscase.id" from="${com.cbc.Case.list()}" optionKey="id" required="" value="${labourInstance?.thiscase?.id}" class="many-to-one"/>
</div>

