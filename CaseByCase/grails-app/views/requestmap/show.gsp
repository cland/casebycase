
<%@ page import="com.cbc.Requestmap" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requestmap.label', default: 'Requestmap')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-requestmap" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-requestmap" class="content scaffold-show" role="main">
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
					<ol class="property-list requestmap">
						
							<g:if test="${requestmapInstance?.url}">
							<li class="fieldcontain">
								<span id="url-label" class="property-label"><g:message code="requestmap.url.label" default="Url" /></span>
								
									<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${requestmapInstance}" field="url"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${requestmapInstance?.configAttribute}">
							<li class="fieldcontain">
								<span id="configAttribute-label" class="property-label"><g:message code="requestmap.configAttribute.label" default="Config Attribute" /></span>
								
									<span class="property-value" aria-labelledby="configAttribute-label"><g:fieldValue bean="${requestmapInstance}" field="configAttribute"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${requestmapInstance?.httpMethod}">
							<li class="fieldcontain">
								<span id="httpMethod-label" class="property-label"><g:message code="requestmap.httpMethod.label" default="Http Method" /></span>
								
									<span class="property-value" aria-labelledby="httpMethod-label"><g:fieldValue bean="${requestmapInstance}" field="httpMethod"/></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:requestmapInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${requestmapInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
