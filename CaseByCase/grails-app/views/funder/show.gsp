
<%@ page import="com.cbc.Funder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'funder.label', default: 'Funder')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-funder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-funder" class="content scaffold-show" role="main">
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
					<ol class="property-list funder">
						
							<g:if test="${funderInstance?.workNumber}">
							<li class="fieldcontain">
								<span id="workNumber-label" class="property-label"><g:message code="funder.workNumber.label" default="Work Number" /></span>
								
									<span class="property-value" aria-labelledby="workNumber-label"><g:fieldValue bean="${funderInstance}" field="workNumber"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.cellphone}">
							<li class="fieldcontain">
								<span id="cellphone-label" class="property-label"><g:message code="funder.cellphone.label" default="Cellphone" /></span>
								
									<span class="property-value" aria-labelledby="cellphone-label"><g:fieldValue bean="${funderInstance}" field="cellphone"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.amount}">
							<li class="fieldcontain">
								<span id="amount-label" class="property-label"><g:message code="funder.amount.label" default="Amount" /></span>
								
									<span class="property-value" aria-labelledby="amount-label"><g:fieldValue bean="${funderInstance}" field="amount"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.periodFrom}">
							<li class="fieldcontain">
								<span id="periodFrom-label" class="property-label"><g:message code="funder.periodFrom.label" default="Period From" /></span>
								
									<span class="property-value" aria-labelledby="periodFrom-label"><g:formatDate date="${funderInstance?.periodFrom}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.periodTo}">
							<li class="fieldcontain">
								<span id="periodTo-label" class="property-label"><g:message code="funder.periodTo.label" default="Period To" /></span>
								
									<span class="property-value" aria-labelledby="periodTo-label"><g:formatDate date="${funderInstance?.periodTo}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.funderType}">
							<li class="fieldcontain">
								<span id="funderType-label" class="property-label"><g:message code="funder.funderType.label" default="Funder Type" /></span>
								
									<span class="property-value" aria-labelledby="funderType-label"><g:fieldValue bean="${funderInstance}" field="funderType"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="funder.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${funderInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="funder.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${funderInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="funder.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${funderInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.event}">
							<li class="fieldcontain">
								<span id="event-label" class="property-label"><g:message code="funder.event.label" default="Event" /></span>
								
									<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${funderInstance?.event?.id}">${funderInstance?.event?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="funder.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${funderInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="funder.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${funderInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.orgs}">
							<li class="fieldcontain">
								<span id="orgs-label" class="property-label"><g:message code="funder.orgs.label" default="Orgs" /></span>
								
									<g:each in="${funderInstance.orgs}" var="o">
									<span class="property-value" aria-labelledby="orgs-label"><g:link controller="organisation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${funderInstance?.persons}">
							<li class="fieldcontain">
								<span id="persons-label" class="property-label"><g:message code="funder.persons.label" default="Persons" /></span>
								
									<g:each in="${funderInstance.persons}" var="p">
									<span class="property-value" aria-labelledby="persons-label"><g:link controller="person" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:funderInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${funderInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
