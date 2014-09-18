
<%@ page import="com.cbc.location.Region" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'region.label', default: 'Region')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-region" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					Region: ${regionInstance?.name }
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-region" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- *** START TABS *** -->
			<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Details</a></li>
					<li><a href="#tab-2">Access Rights</a></li>	
				</ul>
				<div id="tab-1">
					<ol class="property-list region">
						
							<g:if test="${regionInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="region.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${regionInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${regionInstance?.code}">
							<li class="fieldcontain">
								<span id="code-label" class="property-label"><g:message code="region.code.label" default="Code" /></span>
								
									<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${regionInstance}" field="code"/></span>
								
							</li>
							</g:if>

							<g:if test="${regionInstance?.cities}">
							<li class="fieldcontain">
								<span id="cities-label" class="property-label"><g:message code="region.cities.label" default="Cities" /></span>
								
									<g:each in="${regionInstance.cities}" var="c">
									<span class="property-value" aria-labelledby="cities-label"><g:link controller="city" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${regionInstance?.country}">
							<li class="fieldcontain">
								<span id="country-label" class="property-label"><g:message code="region.country.label" default="Country" /></span>
								
									<span class="property-value" aria-labelledby="country-label"><g:link controller="country" action="show" id="${regionInstance?.country?.id}">${regionInstance?.country?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>

							<g:if test="${regionInstance?.districts}">
							<li class="fieldcontain">
								<span id="districts-label" class="property-label"><g:message code="region.districts.label" default="Districts" /></span>
									<g:each in="${regionInstance.districts}" var="d">
										<span class="property-value" aria-labelledby="districts-label"><g:link controller="district" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
									</g:each>							
							</li>
							</g:if>													
						</ol>
				</div>
				
				<div id="tab-2">
					<br/><h2>Groups</h2>
					<div>
						<table>
						<thead>
							<tr>				
								<g:sortableColumn property="name" title="${message(code: 'roleGroup.name.label', default: 'Name')}" />					
								<g:sortableColumn property="description" title="${message(code: 'roleGroup.description.label', default: 'Description')}" />						
							</tr>
						</thead>
						<tbody>
						<g:each in="${regionInstance?.regionGroups}" status="i" var="roleGroupInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							
								<td><g:link controller="roleGroup" action="show" id="${roleGroupInstance.id}">${fieldValue(bean: roleGroupInstance, field: "name")}</g:link></td>
							
								<td>${fieldValue(bean: roleGroupInstance, field: "description")}</td>
							
							</tr>
						</g:each>
						</tbody>
						</table>
					</div>
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:regionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${regionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
