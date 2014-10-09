
<%@ page import="com.cbc.Eviction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eviction.label', default: 'Eviction')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-eviction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-eviction" class="content scaffold-show" role="main">
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
					<ol class="property-list eviction">
						
							<g:if test="${evictionInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="eviction.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${evictionInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="eviction.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${evictionInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.livestock}">
							<li class="fieldcontain">
								<span id="livestock-label" class="property-label"><g:message code="eviction.livestock.label" default="Livestock" /></span>
								
									<span class="property-value" aria-labelledby="livestock-label"><g:link controller="livestock" action="show" id="${evictionInstance?.livestock?.id}">${evictionInstance?.livestock?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dwellingType}">
							<li class="fieldcontain">
								<span id="dwellingType-label" class="property-label"><g:message code="eviction.dwellingType.label" default="Dwelling Type" /></span>
								
									<span class="property-value" aria-labelledby="dwellingType-label"><g:link controller="keywords" action="show" id="${evictionInstance?.dwellingType?.id}">${evictionInstance?.dwellingType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.landConsentType}">
							<li class="fieldcontain">
								<span id="landConsentType-label" class="property-label"><g:message code="eviction.landConsentType.label" default="Land Consent Type" /></span>
								
									<span class="property-value" aria-labelledby="landConsentType-label"><g:link controller="keywords" action="show" id="${evictionInstance?.landConsentType?.id}">${evictionInstance?.landConsentType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="eviction.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${evictionInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.evictionBy}">
							<li class="fieldcontain">
								<span id="evictionBy-label" class="property-label"><g:message code="eviction.evictionBy.label" default="Eviction By" /></span>
								
									<span class="property-value" aria-labelledby="evictionBy-label"><g:link controller="keywords" action="show" id="${evictionInstance?.evictionBy?.id}">${evictionInstance?.evictionBy?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="eviction.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${evictionInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:evictionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${evictionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
