
<%@ page import="com.cbc.Action" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'action.label', default: 'Action')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-action" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-action" class="content scaffold-show" role="main">
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
					<ol class="property-list action">
						
							<g:if test="${actionInstance?.date}">
							<li class="fieldcontain">
								<span id="date-label" class="property-label"><g:message code="action.date.label" default="Date" /></span>
								
									<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${actionInstance?.date}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.actionToFrom}">
							<li class="fieldcontain">
								<span id="actionToFrom-label" class="property-label"><g:message code="action.actionToFrom.label" default="Action To From" /></span>
								
									<span class="property-value" aria-labelledby="actionToFrom-label"><g:fieldValue bean="${actionInstance}" field="actionToFrom"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.description}">
							<li class="fieldcontain">
								<span id="description-label" class="property-label"><g:message code="action.description.label" default="Description" /></span>
								
									<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${actionInstance}" field="description"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.subject}">
							<li class="fieldcontain">
								<span id="subject-label" class="property-label"><g:message code="action.subject.label" default="Subject" /></span>
								
									<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${actionInstance}" field="subject"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.followUpStatus}">
							<li class="fieldcontain">
								<span id="followUpStatus-label" class="property-label"><g:message code="action.followUpStatus.label" default="Follow Up Status" /></span>
								
									<span class="property-value" aria-labelledby="followUpStatus-label"><g:fieldValue bean="${actionInstance}" field="followUpStatus"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.disbursementAmount}">
							<li class="fieldcontain">
								<span id="disbursementAmount-label" class="property-label"><g:message code="action.disbursementAmount.label" default="Disbursement Amount" /></span>
								
									<span class="property-value" aria-labelledby="disbursementAmount-label"><g:fieldValue bean="${actionInstance}" field="disbursementAmount"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.isPrivate}">
							<li class="fieldcontain">
								<span id="isPrivate-label" class="property-label"><g:message code="action.isPrivate.label" default="Is Private" /></span>
								
									<span class="property-value" aria-labelledby="isPrivate-label"><g:formatBoolean boolean="${actionInstance?.isPrivate}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="action.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${actionInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="action.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${actionInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.actionOwner}">
							<li class="fieldcontain">
								<span id="actionOwner-label" class="property-label"><g:message code="action.actionOwner.label" default="Action Owner" /></span>
								
									<span class="property-value" aria-labelledby="actionOwner-label"><g:link controller="user" action="show" id="${actionInstance?.actionOwner?.id}">${actionInstance?.actionOwner?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.actionType}">
							<li class="fieldcontain">
								<span id="actionType-label" class="property-label"><g:message code="action.actionType.label" default="Action Type" /></span>
								
									<span class="property-value" aria-labelledby="actionType-label"><g:link controller="actionType" action="show" id="${actionInstance?.actionType?.id}">${actionInstance?.actionType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="action.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${actionInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.followUpDate}">
							<li class="fieldcontain">
								<span id="followUpDate-label" class="property-label"><g:message code="action.followUpDate.label" default="Follow Up Date" /></span>
								
									<span class="property-value" aria-labelledby="followUpDate-label"><g:formatDate date="${actionInstance?.followUpDate}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.followers}">
							<li class="fieldcontain">
								<span id="followers-label" class="property-label"><g:message code="action.followers.label" default="Followers" /></span>
								
									<g:each in="${actionInstance.followers}" var="f">
									<span class="property-value" aria-labelledby="followers-label"><g:link controller="user" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="action.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${actionInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${actionInstance?.thiscase}">
							<li class="fieldcontain">
								<span id="thiscase-label" class="property-label"><g:message code="action.thiscase.label" default="Thiscase" /></span>
								
									<span class="property-value" aria-labelledby="thiscase-label"><g:link controller="case" action="show" id="${actionInstance?.thiscase?.id}">${actionInstance?.thiscase?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:actionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${actionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
