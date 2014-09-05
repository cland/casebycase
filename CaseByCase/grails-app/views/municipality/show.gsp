
<%@ page import="com.cbc.location.Municipality" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'municipality.label', default: 'Municipality')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-municipality" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-municipality" class="content scaffold-show" role="main">
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
					<ol class="property-list municipality">
						
							<g:if test="${municipalityInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="municipality.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${municipalityInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${municipalityInstance?.code}">
							<li class="fieldcontain">
								<span id="code-label" class="property-label"><g:message code="municipality.code.label" default="Code" /></span>
								
									<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${municipalityInstance}" field="code"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${municipalityInstance?.district}">
							<li class="fieldcontain">
								<span id="district-label" class="property-label"><g:message code="municipality.district.label" default="District" /></span>
								
									<span class="property-value" aria-labelledby="district-label"><g:link controller="district" action="show" id="${municipalityInstance?.district?.id}">${municipalityInstance?.district?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${municipalityInstance?.places}">
							<li class="fieldcontain">
								<span id="places-label" class="property-label"><g:message code="municipality.places.label" default="Places" /></span>
								
									<g:each in="${municipalityInstance.places}" var="p">
									<span class="property-value" aria-labelledby="places-label"><g:link controller="mainPlace" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:municipalityInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${municipalityInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
