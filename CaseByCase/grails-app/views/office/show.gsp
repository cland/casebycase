
<%@ page import="com.cbc.Office" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					here edit...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default=""></g:sideMenu> 
		</div>
		<div id="show-office" class="content scaffold-show" role="main">
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
					<ol class="property-list office">
						
							<g:if test="${officeInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="office.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${officeInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.code}">
							<li class="fieldcontain">
								<span id="code-label" class="property-label"><g:message code="office.code.label" default="Code" /></span>
								
									<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${officeInstance}" field="code"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.status}">
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="office.status.label" default="Status" /></span>
								
									<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${officeInstance}" field="status"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.contactNumber}">
							<li class="fieldcontain">
								<span id="contactNumber-label" class="property-label"><g:message code="office.contactNumber.label" default="Contact Number" /></span>
								
									<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${officeInstance}" field="contactNumber"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.cellphoneNumber}">
							<li class="fieldcontain">
								<span id="cellphoneNumber-label" class="property-label"><g:message code="office.cellphoneNumber.label" default="Cellphone Number" /></span>
								
									<span class="property-value" aria-labelledby="cellphoneNumber-label"><g:fieldValue bean="${officeInstance}" field="cellphoneNumber"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.faxNumber}">
							<li class="fieldcontain">
								<span id="faxNumber-label" class="property-label"><g:message code="office.faxNumber.label" default="Fax Number" /></span>
								
									<span class="property-value" aria-labelledby="faxNumber-label"><g:fieldValue bean="${officeInstance}" field="faxNumber"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.affiliates}">
							<li class="fieldcontain">
								<span id="affiliates-label" class="property-label"><g:message code="office.affiliates.label" default="Affiliates" /></span>
								
									<g:each in="${officeInstance.affiliates}" var="a">
									<span class="property-value" aria-labelledby="affiliates-label"><g:link controller="organization" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.cases}">
							<li class="fieldcontain">
								<span id="cases-label" class="property-label"><g:message code="office.cases.label" default="Cases" /></span>
								
									<g:each in="${officeInstance.cases}" var="c">
									<span class="property-value" aria-labelledby="cases-label"><g:link controller="case" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${officeInstance?.staff}">
							<li class="fieldcontain">
								<span id="staff-label" class="property-label"><g:message code="office.staff.label" default="Staff" /></span>
								
									<g:each in="${officeInstance.staff}" var="s">
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
			
			<g:form url="[resource:officeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${officeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
