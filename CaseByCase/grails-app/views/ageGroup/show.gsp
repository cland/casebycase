
<%@ page import="com.cbc.AgeGroup" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ageGroup.label', default: 'AgeGroup')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-ageGroup" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-ageGroup" class="content scaffold-show" role="main">
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
					<ol class="property-list ageGroup">
						
							<g:if test="${ageGroupInstance?.lowerAge}">
							<li class="fieldcontain">
								<span id="lowerAge-label" class="property-label"><g:message code="ageGroup.lowerAge.label" default="Lower Age" /></span>
								
									<span class="property-value" aria-labelledby="lowerAge-label"><g:fieldValue bean="${ageGroupInstance}" field="lowerAge"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${ageGroupInstance?.upperAge}">
							<li class="fieldcontain">
								<span id="upperAge-label" class="property-label"><g:message code="ageGroup.upperAge.label" default="Upper Age" /></span>
								
									<span class="property-value" aria-labelledby="upperAge-label"><g:fieldValue bean="${ageGroupInstance}" field="upperAge"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${ageGroupInstance?.gender}">
							<li class="fieldcontain">
								<span id="gender-label" class="property-label"><g:message code="ageGroup.gender.label" default="Gender" /></span>
								
									<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${ageGroupInstance}" field="gender"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${ageGroupInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="ageGroup.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${ageGroupInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${ageGroupInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="ageGroup.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${ageGroupInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${ageGroupInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="ageGroup.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ageGroupInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${ageGroupInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="ageGroup.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${ageGroupInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${ageGroupInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="ageGroup.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${ageGroupInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:ageGroupInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${ageGroupInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
