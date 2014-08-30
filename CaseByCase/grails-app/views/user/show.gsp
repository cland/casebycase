
<%@ page import="com.cbc.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- *** START TABS *** -->
			<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Login Details</a></li>
					<li class="hide"><a href="#tab-2">Personal Details</a></li>		
				</ul>
				<div id="tab-1">
				<fieldset><legend>Login Details</legend>
					<ol class="property-list user">
						
							<g:if test="${userInstance?.username}">
							<li class="fieldcontain">
								<span id="username-label" class="property-label"><g:message code="user.username.label" default="Username" /></span>
								
									<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${userInstance}" field="username"/></span>
								
							</li>
							</g:if>
						
													
							<g:if test="${userInstance?.email}">
							<li class="fieldcontain">
								<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
								
									<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
								
							</li>
							</g:if>

							<g:if test="${userInstance?.accountExpired}">
							<li class="fieldcontain">
								<span id="accountExpired-label" class="property-label"><g:message code="user.accountExpired.label" default="Account Expired" /></span>
								
									<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" true="yes" false="no"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${userInstance?.accountLocked}">
							<li class="fieldcontain">
								<span id="accountLocked-label" class="property-label"><g:message code="user.accountLocked.label" default="Account Locked" /></span>
								
									<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}"  true="yes" false="no"/></span>
								
							</li>
							</g:if>
						
							
							<g:if test="${userInstance?.enabled}">
							<li class="fieldcontain">
								<span id="enabled-label" class="property-label"><g:message code="user.enabled.label" default="Enabled" /></span>
								
									<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}"  true="yes" false="no"/></span>
								
							</li>
							</g:if>
			
							<g:if test="${userInstance?.passwordExpired}">
							<li class="fieldcontain">
								<span id="passwordExpired-label" class="property-label"><g:message code="user.passwordExpired.label" default="Password Expired" /></span>
								
									<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}"  true="yes" false="no"/></span>
								
							</li>
							</g:if>
						</ol>
					</fieldset>
					<fieldset><legend>Personal Details</legend>
							<div class="table">
								<div class="row">
									<div class="cell"><label for="person.firstName"><g:message code="person.firstName.label" default="First Name" /></label></div>
									<div class="cell">${userInstance?.person?.firstName}</div>
									<div class="cell">
										<label for="person.gender"><g:message code="person.gender.label" default="Gender" /></label>
									</div>
									<div class="cell">
										${userInstance?.person?.gender}
									</div>
								</div>
								<div class="row">
									<div class="cell"><label for="person.lastName"><g:message code="person.lastName.label" default="Last Name" />	</label></div>
									<div class="cell">${userInstance?.person?.lastName}</div>
									<div class="cell"><label for="person.race"><g:message code="user.race.label" default="Race" /></label></div>
									<div class="cell">${userInstance?.person?.race}</div>
								</div>
								<div class="row">
									<div class="cell"><label for="office"><g:message code="person.office.label" default="Office" /><span class="required-indicator">*</span></label></div>
									<div class="cell">${userInstance?.person?.office}</div>
									<div class="cell"></div>
									<div class="cell"></div>
								</div>				
							</div>
						</fieldset>						
					<fieldset><legend>Access Rights</legend>
						<div>							
							<table id="groups-table-office">
							<thead>
								<tr>
									<th></th>
									<g:sortableColumn property="name" title="${message(code: 'roleGroup.name.label', default: 'Group Name')}" />					
									<g:sortableColumn property="description" title="${message(code: 'roleGroup.description.label', default: 'Description')}" />					
								</tr>
							</thead>
							<tbody id="groups-list">
							<g:each in="${userInstance?.authorities}" status="i" var="roleGroupInstance">								
								<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">									
									<td></td>
									<td><g:link controller="roleGroup" action="show" id="${roleGroupInstance.id}">${fieldValue(bean: roleGroupInstance, field: "name")}</g:link></td>					
									<td>${fieldValue(bean: roleGroupInstance, field: "description")}</td>					
								</tr>
							</g:each>
							</tbody>
							</table>
						</div>	
					</fieldset>	
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
