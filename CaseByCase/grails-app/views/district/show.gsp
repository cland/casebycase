
<%@ page import="com.cbc.location.District" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'district.label', default: 'District')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-district" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-district" class="content scaffold-show" role="main">
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
					<ol class="property-list district">
						
							<g:if test="${districtInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="district.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${districtInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${districtInstance?.code}">
							<li class="fieldcontain">
								<span id="code-label" class="property-label"><g:message code="district.code.label" default="Code" /></span>
								
									<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${districtInstance}" field="code"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${districtInstance?.municipalities}">
							<li class="fieldcontain">
								<span id="municipalities-label" class="property-label"><g:message code="district.municipalities.label" default="Municipalities" /></span>
								
									<g:each in="${districtInstance.municipalities}" var="m">
									<span class="property-value" aria-labelledby="municipalities-label"><g:link controller="municipality" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${districtInstance?.region}">
							<li class="fieldcontain">
								<span id="region-label" class="property-label"><g:message code="district.region.label" default="Region" /></span>
								
									<span class="property-value" aria-labelledby="region-label"><g:link controller="region" action="show" id="${districtInstance?.region?.id}">${districtInstance?.region?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:districtInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${districtInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
