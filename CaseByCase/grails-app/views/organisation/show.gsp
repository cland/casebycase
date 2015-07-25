
<%@ page import="com.cbc.Organisation" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'organisation.label', default: 'Organisation')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-organisation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span>
					<g:link controller="organisation" action="index" >Organisation List</g:link> 
				<span class="r-arrow"></span> 
				<span class="current-crump">
					${organisationInstance?.name }
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-organisation" class="content scaffold-show" role="main">
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
					<ol class="property-list organisation">
						
							<g:if test="${organisationInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="organisation.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${organisationInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${organisationInstance?.status}">
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="organisation.status.label" default="Status" /></span>
								
									<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${organisationInstance}" field="status"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${organisationInstance?.phoneNo}">
							<li class="fieldcontain">
								<span id="phoneNo-label" class="property-label"><g:message code="organisation.phoneNo.label" default="Phone No" /></span>
								
									<span class="property-value" aria-labelledby="phoneNo-label"><g:fieldValue bean="${organisationInstance}" field="phoneNo"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${organisationInstance?.email}">
							<li class="fieldcontain">
								<span id="email-label" class="property-label"><g:message code="organisation.email.label" default="Email" /></span>
								
									<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${organisationInstance}" field="email"/></span>
								
							</li>
							</g:if>
							<g:if test="${organisationInstance?.staffCount}">
							<li class="fieldcontain">
								<span id="staffcount-label" class="property-label"><g:message code="organisation.staffCount.label" default="Number of employees" /></span>
								
									<span class="property-value" aria-labelledby="staffcount-label"><g:fieldValue bean="${organisationInstance}" field="staffCount"/></span>
								
							</li>
							</g:if>
							<g:if test="${organisationInstance?.sector}">
							<li class="fieldcontain">
								<label for="sector">
									<g:message code="organisation.sector.label" default="Sector" />		
								</label>
								<div style="width:70%;float:right;">
									<g:each in="${organisationInstance?.sector }" var="keyword" status="index">
										 <span class="property-value"><span class="r-arrow"></span> ${keyword }</span><br>
									</g:each>
								</div>
							</li>
							</g:if>
							<g:if test="${organisationInstance?.isLabourBroker}">
							<li class="fieldcontain">
								<span id="isLabourBroker-label" class="property-label"><g:message code="organisation.isLabourBroker.label" default="Is Labour Broker" /></span>								
									<span class="property-value" aria-labelledby="isLabourBroker-label">
									<g:formatBoolean boolean="${organisationInstance?.isLabourBroker}" true="yes" false="no"/>
									</span>								
							</li>
							</g:if>
						
							<g:if test="${organisationInstance?.isMember}">
							<li class="fieldcontain">
								<span id="isMember-label" class="property-label"><g:message code="organisation.isMember.label" default="Is Member" /></span>
								
									<span class="property-value" aria-labelledby="isMember-label">
									<g:formatBoolean boolean="${organisationInstance?.isMember}" true="yes" false="no"/>
									</span>
								
							</li>
							</g:if>
							
							
							<g:if test="${organisationInstance?.isHost}">
							<li class="fieldcontain">
								<span id="isHost-label" class="property-label"><g:message code="organisation.isHost.label" default="Is Host" /></span>
								
									<span class="property-value" aria-labelledby="isHost-label">
									<g:formatBoolean boolean="${organisationInstance?.isHost}" true="yes" false="no"/>
									</span>
								
							</li>
							</g:if>
							<g:if test="${organisationInstance?.staff}">
							<li class="fieldcontain">
								<span id="staff-label" class="property-label"><g:message code="organisation.staff.label" default="Staff" /></span>
								
									<g:each in="${organisationInstance.staff}" var="s">
									<span class="property-value" aria-labelledby="staff-label"><g:link controller="person" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:organisationInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${organisationInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
	
	</body>
</html>
