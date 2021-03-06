<%@ page import="com.cbc.SystemRoles" %>
<%@ page import="com.cbc.Pcm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pcm.label', default: 'Pcm')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-pcm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<g:link controller="pcm" action="index">PCM List</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					PCM: ${pcmInstance?.sender } - ${pcmInstance?.name }
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-pcm" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="['Please Call Me']" /></h1>
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
					<ol class="property-list pcm">
						<g:if test="${pcmInstance?.pcmDate}">
							<li class="fieldcontain">
								<span id="pcmDate-label" class="property-label"><g:message code="pcm.pcmDate.label" default="PCM Date" /></span>
								
									<span class="property-value" aria-labelledby="pcmDate-label"><g:formatDate date="${pcmInstance?.pcmDate}" /></span>
								
							</li>
							</g:if>
						<g:if test="${pcmInstance?.sender}">
							<li class="fieldcontain">
								<span id="sender-label" class="property-label"><g:message code="pcm.sender.label" default="Sender" /></span>
								
									<span class="property-value" aria-labelledby="sender-label"><g:fieldValue bean="${pcmInstance}" field="sender"/></span>
								
							</li>
							</g:if>	
						<g:if test="${pcmInstance?.receiver}">
							<li class="fieldcontain">
								<span id="receiver-label" class="property-label"><g:message code="pcm.receiver.label" default="Receiver" /></span>
								
									<span class="property-value" aria-labelledby="receiver-label"><g:fieldValue bean="${pcmInstance}" field="receiver"/></span>
								
							</li>
							</g:if>
							<g:if test="${pcmInstance?.content}">
							<li class="fieldcontain">
								<span id="content-label" class="property-label"><g:message code="pcm.content.label" default="Content" /></span>
								
									<span class="property-value" aria-labelledby="content-label"><g:fieldValue bean="${pcmInstance}" field="content"/></span>
								
							</li>
							</g:if>	
							
							<g:if test="${pcmInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="pcm.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${pcmInstance}" field="name"/></span>
								
							</li>
							</g:if>
													
							<g:if test="${pcmInstance?.agegroup}">
							<li class="fieldcontain">
								<span id="agegroup-label" class="property-label"><g:message code="pcm.agegroup.label" default="Agegroup" /></span>
								
									<span class="property-value" aria-labelledby="agegroup-label"><g:link controller="ageGroup" action="show" id="${pcmInstance?.agegroup?.id}">${pcmInstance?.agegroup?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
							<g:render template="../layouts/location" bean="${pcmInstance?.location}" var="locationInstance" model="[mode:'read',hideList:['mainplace','suburb','township','description','longlat'],jsCallback:'onChangeLoadOffices']"></g:render>
							<g:if test="${pcmInstance?.description}">
							<li class="fieldcontain">
								<span id="description-label" class="property-label"><g:message code="pcm.description.label" default="Description" /></span>
								
									<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${pcmInstance}" field="description"/></span>
								
							</li>
							</g:if>				
						
							<g:if test="${pcmInstance?.referredBy}">
							<li class="fieldcontain">
								<span id="referredBy-label" class="property-label"><g:message code="pcm.referredBy.label" default="Referred By" /></span>
								
									<span class="property-value" aria-labelledby="referredBy-label"><g:fieldValue bean="${pcmInstance}" field="referredBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${pcmInstance?.referredTo}">
							<li class="fieldcontain">
								<span id="referredTo-label" class="property-label"><g:message code="pcm.referredTo.label" default="Referred To" /></span>
								
									<span class="property-value" aria-labelledby="referredTo-label"><g:link controller="office" action="show" id="${pcmInstance?.referredTo?.id}">${pcmInstance?.referredTo?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>	
						
						</ol>
						
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:pcmInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_PCM },${SystemRoles.ROLE_ADMIN }">
					<g:link class="edit" action="edit" resource="${pcmInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</sec:ifAnyGranted>
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
		
	</body>
</html>
