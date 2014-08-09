
<%@ page import="com.cbc.Case" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'case.label', default: 'Case')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="sidenav-public" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#show-case" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-case" class="content scaffold-show" role="main">
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
					<ol class="property-list case">
						
							<g:if test="${caseInstance?.thisevent}">
							<li class="fieldcontain">
								<span id="thisevent-label" class="property-label"><g:message code="case.thisevent.label" default="Thisevent" /></span>
								
									<span class="property-value" aria-labelledby="thisevent-label"><g:link controller="event" action="show" id="${caseInstance?.thisevent?.id}">${caseInstance?.thisevent?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="case.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${caseInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="case.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${caseInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.actions}">
							<li class="fieldcontain">
								<span id="actions-label" class="property-label"><g:message code="case.actions.label" default="Actions" /></span>
								
									<g:each in="${caseInstance.actions}" var="a">
									<span class="property-value" aria-labelledby="actions-label"><g:link controller="action" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.amtRecovered}">
							<li class="fieldcontain">
								<span id="amtRecovered-label" class="property-label"><g:message code="case.amtRecovered.label" default="Amt Recovered" /></span>
								
									<span class="property-value" aria-labelledby="amtRecovered-label"><g:fieldValue bean="${caseInstance}" field="amtRecovered"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.bestPractice}">
							<li class="fieldcontain">
								<span id="bestPractice-label" class="property-label"><g:message code="case.bestPractice.label" default="Best Practice" /></span>
								
									<span class="property-value" aria-labelledby="bestPractice-label"><g:formatBoolean boolean="${caseInstance?.bestPractice}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.caseNumber}">
							<li class="fieldcontain">
								<span id="caseNumber-label" class="property-label"><g:message code="case.caseNumber.label" default="Case Number" /></span>
								
									<span class="property-value" aria-labelledby="caseNumber-label"><g:fieldValue bean="${caseInstance}" field="caseNumber"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.childHeadedHouse}">
							<li class="fieldcontain">
								<span id="childHeadedHouse-label" class="property-label"><g:message code="case.childHeadedHouse.label" default="Child Headed House" /></span>
								
									<span class="property-value" aria-labelledby="childHeadedHouse-label"><g:formatBoolean boolean="${caseInstance?.childHeadedHouse}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.clients}">
							<li class="fieldcontain">
								<span id="clients-label" class="property-label"><g:message code="case.clients.label" default="Clients" /></span>
								
									<g:each in="${caseInstance.clients}" var="c">
									<span class="property-value" aria-labelledby="clients-label"><g:link controller="person" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.dateClosed}">
							<li class="fieldcontain">
								<span id="dateClosed-label" class="property-label"><g:message code="case.dateClosed.label" default="Date Closed" /></span>
								
									<span class="property-value" aria-labelledby="dateClosed-label"><g:formatDate date="${caseInstance?.dateClosed}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="case.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${caseInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.dateOpen}">
							<li class="fieldcontain">
								<span id="dateOpen-label" class="property-label"><g:message code="case.dateOpen.label" default="Date Open" /></span>
								
									<span class="property-value" aria-labelledby="dateOpen-label"><g:formatDate date="${caseInstance?.dateOpen}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.description}">
							<li class="fieldcontain">
								<span id="description-label" class="property-label"><g:message code="case.description.label" default="Description" /></span>
								
									<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${caseInstance}" field="description"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="case.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${caseInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.office}">
							<li class="fieldcontain">
								<span id="office-label" class="property-label"><g:message code="case.office.label" default="Office" /></span>
								
									<span class="property-value" aria-labelledby="office-label"><g:link controller="office" action="show" id="${caseInstance?.office?.id}">${caseInstance?.office?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.orgclients}">
							<li class="fieldcontain">
								<span id="orgclients-label" class="property-label"><g:message code="case.orgclients.label" default="Orgclients" /></span>
								
									<g:each in="${caseInstance.orgclients}" var="o">
									<span class="property-value" aria-labelledby="orgclients-label"><g:link controller="organisation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.outcome}">
							<li class="fieldcontain">
								<span id="outcome-label" class="property-label"><g:message code="case.outcome.label" default="Outcome" /></span>
								
									<span class="property-value" aria-labelledby="outcome-label"><g:link controller="caseOutcome" action="show" id="${caseInstance?.outcome?.id}">${caseInstance?.outcome?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.priority}">
							<li class="fieldcontain">
								<span id="priority-label" class="property-label"><g:message code="case.priority.label" default="Priority" /></span>
								
									<span class="property-value" aria-labelledby="priority-label"><g:link controller="casePriority" action="show" id="${caseInstance?.priority?.id}">${caseInstance?.priority?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.problemStart}">
							<li class="fieldcontain">
								<span id="problemStart-label" class="property-label"><g:message code="case.problemStart.label" default="Problem Start" /></span>
								
									<span class="property-value" aria-labelledby="problemStart-label"><g:formatDate date="${caseInstance?.problemStart}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.specialCase}">
							<li class="fieldcontain">
								<span id="specialCase-label" class="property-label"><g:message code="case.specialCase.label" default="Special Case" /></span>
								
									<span class="property-value" aria-labelledby="specialCase-label"><g:formatBoolean boolean="${caseInstance?.specialCase}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.status}">
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="case.status.label" default="Status" /></span>
								
									<span class="property-value" aria-labelledby="status-label"><g:link controller="caseStatus" action="show" id="${caseInstance?.status?.id}">${caseInstance?.status?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.subject}">
							<li class="fieldcontain">
								<span id="subject-label" class="property-label"><g:message code="case.subject.label" default="Subject" /></span>
								
									<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${caseInstance}" field="subject"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.totalFemale}">
							<li class="fieldcontain">
								<span id="totalFemale-label" class="property-label"><g:message code="case.totalFemale.label" default="Total Female" /></span>
								
									<span class="property-value" aria-labelledby="totalFemale-label"><g:fieldValue bean="${caseInstance}" field="totalFemale"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.totalMale}">
							<li class="fieldcontain">
								<span id="totalMale-label" class="property-label"><g:message code="case.totalMale.label" default="Total Male" /></span>
								
									<span class="property-value" aria-labelledby="totalMale-label"><g:fieldValue bean="${caseInstance}" field="totalMale"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.totalUnknown}">
							<li class="fieldcontain">
								<span id="totalUnknown-label" class="property-label"><g:message code="case.totalUnknown.label" default="Total Unknown" /></span>
								
									<span class="property-value" aria-labelledby="totalUnknown-label"><g:fieldValue bean="${caseInstance}" field="totalUnknown"/></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:caseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${caseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
