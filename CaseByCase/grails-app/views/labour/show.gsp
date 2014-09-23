
<%@ page import="com.cbc.Labour" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'labour.label', default: 'Labour')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-labour" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					here edit...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-labour" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- *** START TABS *** -->
			<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Details</a></li>
					<li><a href="#tab-2">Other</a></li>		
				</ul>
				<div id="tab-1">
					<ol class="property-list labour">
						
							<g:if test="${labourInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="labour.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${labourInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="labour.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${labourInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.tradeUnionMember}">
							<li class="fieldcontain">
								<span id="tradeUnionMember-label" class="property-label"><g:message code="labour.tradeUnionMember.label" default="Trade Union Member" /></span>
								
									<span class="property-value" aria-labelledby="tradeUnionMember-label"><g:fieldValue bean="${labourInstance}" field="tradeUnionMember"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.employerDetail}">
							<li class="fieldcontain">
								<span id="employerDetail-label" class="property-label"><g:message code="labour.employerDetail.label" default="Employer Detail" /></span>
								
									<span class="property-value" aria-labelledby="employerDetail-label"><g:fieldValue bean="${labourInstance}" field="employerDetail"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.unionAtWork}">
							<li class="fieldcontain">
								<span id="unionAtWork-label" class="property-label"><g:message code="labour.unionAtWork.label" default="Union At Work" /></span>
								
									<span class="property-value" aria-labelledby="unionAtWork-label"><g:fieldValue bean="${labourInstance}" field="unionAtWork"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.memberOfWorkUnion}">
							<li class="fieldcontain">
								<span id="memberOfWorkUnion-label" class="property-label"><g:message code="labour.memberOfWorkUnion.label" default="Member Of Work Union" /></span>
								
									<span class="property-value" aria-labelledby="memberOfWorkUnion-label"><g:fieldValue bean="${labourInstance}" field="memberOfWorkUnion"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.hoursWorked}">
							<li class="fieldcontain">
								<span id="hoursWorked-label" class="property-label"><g:message code="labour.hoursWorked.label" default="Hours Worked" /></span>
								
									<span class="property-value" aria-labelledby="hoursWorked-label"><g:fieldValue bean="${labourInstance}" field="hoursWorked"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.earnings}">
							<li class="fieldcontain">
								<span id="earnings-label" class="property-label"><g:message code="labour.earnings.label" default="Earnings" /></span>
								
									<span class="property-value" aria-labelledby="earnings-label"><g:fieldValue bean="${labourInstance}" field="earnings"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.leavedays}">
							<li class="fieldcontain">
								<span id="leavedays-label" class="property-label"><g:message code="labour.leavedays.label" default="Leavedays" /></span>
								
									<span class="property-value" aria-labelledby="leavedays-label"><g:link controller="leaveDays" action="show" id="${labourInstance?.leavedays?.id}">${labourInstance?.leavedays?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.workhours}">
							<li class="fieldcontain">
								<span id="workhours-label" class="property-label"><g:message code="labour.workhours.label" default="Workhours" /></span>
								
									<span class="property-value" aria-labelledby="workhours-label"><g:link controller="workHours" action="show" id="${labourInstance?.workhours?.id}">${labourInstance?.workhours?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.earningsValue}">
							<li class="fieldcontain">
								<span id="earningsValue-label" class="property-label"><g:message code="labour.earningsValue.label" default="Earnings Value" /></span>
								
									<span class="property-value" aria-labelledby="earningsValue-label"><g:fieldValue bean="${labourInstance}" field="earningsValue"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.hoursWorkedValue}">
							<li class="fieldcontain">
								<span id="hoursWorkedValue-label" class="property-label"><g:message code="labour.hoursWorkedValue.label" default="Hours Worked Value" /></span>
								
									<span class="property-value" aria-labelledby="hoursWorkedValue-label"><g:fieldValue bean="${labourInstance}" field="hoursWorkedValue"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.specifyMembership}">
							<li class="fieldcontain">
								<span id="specifyMembership-label" class="property-label"><g:message code="labour.specifyMembership.label" default="Specify Membership" /></span>
								
									<span class="property-value" aria-labelledby="specifyMembership-label"><g:fieldValue bean="${labourInstance}" field="specifyMembership"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.wages}">
							<li class="fieldcontain">
								<span id="wages-label" class="property-label"><g:message code="labour.wages.label" default="Wages" /></span>
								
									<span class="property-value" aria-labelledby="wages-label"><g:link controller="problemType" action="show" id="${labourInstance?.wages?.id}">${labourInstance?.wages?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.leaveProblem}">
							<li class="fieldcontain">
								<span id="leaveProblem-label" class="property-label"><g:message code="labour.leaveProblem.label" default="Leave Problem" /></span>
								
									<span class="property-value" aria-labelledby="leaveProblem-label"><g:link controller="problemType" action="show" id="${labourInstance?.leaveProblem?.id}">${labourInstance?.leaveProblem?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.allowProblem}">
							<li class="fieldcontain">
								<span id="allowProblem-label" class="property-label"><g:message code="labour.allowProblem.label" default="Allow Problem" /></span>
								
									<span class="property-value" aria-labelledby="allowProblem-label"><g:link controller="problemType" action="show" id="${labourInstance?.allowProblem?.id}">${labourInstance?.allowProblem?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.benefitsProblem}">
							<li class="fieldcontain">
								<span id="benefitsProblem-label" class="property-label"><g:message code="labour.benefitsProblem.label" default="Benefits Problem" /></span>
								
									<span class="property-value" aria-labelledby="benefitsProblem-label"><g:link controller="problemType" action="show" id="${labourInstance?.benefitsProblem?.id}">${labourInstance?.benefitsProblem?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.healthAndSafety}">
							<li class="fieldcontain">
								<span id="healthAndSafety-label" class="property-label"><g:message code="labour.healthAndSafety.label" default="Health And Safety" /></span>
								
									<span class="property-value" aria-labelledby="healthAndSafety-label"><g:link controller="problemType" action="show" id="${labourInstance?.healthAndSafety?.id}">${labourInstance?.healthAndSafety?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.dismisal}">
							<li class="fieldcontain">
								<span id="dismisal-label" class="property-label"><g:message code="labour.dismisal.label" default="Dismisal" /></span>
								
									<span class="property-value" aria-labelledby="dismisal-label"><g:link controller="problemType" action="show" id="${labourInstance?.dismisal?.id}">${labourInstance?.dismisal?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.uif}">
							<li class="fieldcontain">
								<span id="uif-label" class="property-label"><g:message code="labour.uif.label" default="Uif" /></span>
								
									<span class="property-value" aria-labelledby="uif-label"><g:link controller="problemType" action="show" id="${labourInstance?.uif?.id}">${labourInstance?.uif?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.allowAmount}">
							<li class="fieldcontain">
								<span id="allowAmount-label" class="property-label"><g:message code="labour.allowAmount.label" default="Allow Amount" /></span>
								
									<span class="property-value" aria-labelledby="allowAmount-label"><g:link controller="allowanceAmount" action="show" id="${labourInstance?.allowAmount?.id}">${labourInstance?.allowAmount?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.allowBenefit}">
							<li class="fieldcontain">
								<span id="allowBenefit-label" class="property-label"><g:message code="labour.allowBenefit.label" default="Allow Benefit" /></span>
								
									<span class="property-value" aria-labelledby="allowBenefit-label"><g:link controller="benefitsAmount" action="show" id="${labourInstance?.allowBenefit?.id}">${labourInstance?.allowBenefit?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="labour.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${labourInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="labour.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${labourInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${labourInstance?.thiscase}">
							<li class="fieldcontain">
								<span id="thiscase-label" class="property-label"><g:message code="labour.thiscase.label" default="Thiscase" /></span>
								
									<span class="property-value" aria-labelledby="thiscase-label"><g:link controller="case" action="show" id="${labourInstance?.thiscase?.id}">${labourInstance?.thiscase?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:labourInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${labourInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
		<script>
			$(document).ready(function() {		
				$("#accordion" ).accordion({ active: cbc_params.active_sidebar() });
			
				$("#tabs").tabs(
								{
								active:cbc_params.active_tab(),
								create: function (event,ui){	
									//executed after is created								
									$('#tabs').show()
								},
								show: function(event,ui){
									//on every tabs clicked
								},
								beforeLoad : function(event, ui) {
										ui.jqXHR.error(function() {
											ui.panel
											.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
										});
									}
						});		                
			});  
		</script>	
</script>		
	</body>
</html>
