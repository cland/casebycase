
<%@ page import="com.cbc.lookup.ProblemType" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'problemType.label', default: 'ProblemType')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-problemType" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
					<g:link controller="problemType" action="index" >Problem Types</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					Problem type: ${problemTypeInstance?.name }
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-problemType" class="content scaffold-show" role="main">
			<h1>
				<g:message code="default.show.label" args="[entityName]" /> 
				
			</h1>
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
					<ol class="property-list problemType">
						
							<g:if test="${problemTypeInstance?.problemType}">
							<li class="fieldcontain">
								<span id="problemType-label" class="property-label"><g:message code="problemType.problemType.label" default="Problem Type" /></span>
								
									<span class="property-value" aria-labelledby="problemType-label"><g:link controller="problemType" action="show" id="${problemTypeInstance?.problemType?.id}">${problemTypeInstance?.problemType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
				
							<g:if test="${problemTypeInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="problemType.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${problemTypeInstance}" field="name"/></span>
								
							</li>
							</g:if>
						<g:if test="${problemTypeInstance?.label}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="problemType.label.label" default="Label" /></span>
								
									<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${problemTypeInstance}" field="label"/></span>
								
							</li>
							</g:if>
							<g:if test="${problemTypeInstance?.problemTypes}">
							<li class="fieldcontain">
								<span id="problemTypes-label" class="property-label"><g:message code="problemType.problemTypes.label" default="Problem Types" /></span>
								
									<g:each in="${problemTypeInstance.problemTypes}" var="p">
									<span class="property-value" aria-labelledby="problemTypes-label">
									<g:link controller="problemType" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:problemTypeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${problemTypeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
