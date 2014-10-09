
<%@ page import="com.cbc.Livestock" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'livestock.label', default: 'Livestock')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-livestock" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-livestock" class="content scaffold-show" role="main">
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
					<ol class="property-list livestock">
						
							<g:if test="${livestockInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="livestock.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${livestockInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="livestock.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${livestockInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.cat}">
							<li class="fieldcontain">
								<span id="cat-label" class="property-label"><g:message code="livestock.cat.label" default="Cat" /></span>
								
									<span class="property-value" aria-labelledby="cat-label"><g:fieldValue bean="${livestockInstance}" field="cat"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.chicken}">
							<li class="fieldcontain">
								<span id="chicken-label" class="property-label"><g:message code="livestock.chicken.label" default="Chicken" /></span>
								
									<span class="property-value" aria-labelledby="chicken-label"><g:fieldValue bean="${livestockInstance}" field="chicken"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.cow}">
							<li class="fieldcontain">
								<span id="cow-label" class="property-label"><g:message code="livestock.cow.label" default="Cow" /></span>
								
									<span class="property-value" aria-labelledby="cow-label"><g:fieldValue bean="${livestockInstance}" field="cow"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="livestock.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${livestockInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.dog}">
							<li class="fieldcontain">
								<span id="dog-label" class="property-label"><g:message code="livestock.dog.label" default="Dog" /></span>
								
									<span class="property-value" aria-labelledby="dog-label"><g:fieldValue bean="${livestockInstance}" field="dog"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.goat}">
							<li class="fieldcontain">
								<span id="goat-label" class="property-label"><g:message code="livestock.goat.label" default="Goat" /></span>
								
									<span class="property-value" aria-labelledby="goat-label"><g:fieldValue bean="${livestockInstance}" field="goat"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.horse}">
							<li class="fieldcontain">
								<span id="horse-label" class="property-label"><g:message code="livestock.horse.label" default="Horse" /></span>
								
									<span class="property-value" aria-labelledby="horse-label"><g:fieldValue bean="${livestockInstance}" field="horse"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="livestock.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${livestockInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.other}">
							<li class="fieldcontain">
								<span id="other-label" class="property-label"><g:message code="livestock.other.label" default="Other" /></span>
								
									<span class="property-value" aria-labelledby="other-label"><g:fieldValue bean="${livestockInstance}" field="other"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${livestockInstance?.sheep}">
							<li class="fieldcontain">
								<span id="sheep-label" class="property-label"><g:message code="livestock.sheep.label" default="Sheep" /></span>
								
									<span class="property-value" aria-labelledby="sheep-label"><g:fieldValue bean="${livestockInstance}" field="sheep"/></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:livestockInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${livestockInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
