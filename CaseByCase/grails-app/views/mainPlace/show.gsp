
<%@ page import="com.cbc.location.MainPlace" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mainPlace.label', default: 'MainPlace')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-mainPlace" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-mainPlace" class="content scaffold-show" role="main">
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
					<ol class="property-list mainPlace">
						
							<g:if test="${mainPlaceInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="mainPlace.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${mainPlaceInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${mainPlaceInstance?.code}">
							<li class="fieldcontain">
								<span id="code-label" class="property-label"><g:message code="mainPlace.code.label" default="Code" /></span>
								
									<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${mainPlaceInstance}" field="code"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${mainPlaceInstance?.municipality}">
							<li class="fieldcontain">
								<span id="municipality-label" class="property-label"><g:message code="mainPlace.municipality.label" default="Municipality" /></span>
								
									<span class="property-value" aria-labelledby="municipality-label"><g:link controller="municipality" action="show" id="${mainPlaceInstance?.municipality?.id}">${mainPlaceInstance?.municipality?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${mainPlaceInstance?.suburbs}">
							<li class="fieldcontain">
								<span id="suburbs-label" class="property-label"><g:message code="mainPlace.suburbs.label" default="Suburbs" /></span>
								
									<g:each in="${mainPlaceInstance.suburbs}" var="s">
									<span class="property-value" aria-labelledby="suburbs-label"><g:link controller="suburb" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:mainPlaceInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mainPlaceInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
