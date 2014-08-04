
<%@ page import="com.cbc.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					here edit...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default=""></g:sideMenu> 
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
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
					<ol class="property-list person">
						
							<g:if test="${personInstance?.firstName}">
							<li class="fieldcontain">
								<span id="firstName-label" class="property-label"><g:message code="person.firstName.label" default="First Name" /></span>
								
									<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${personInstance}" field="firstName"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.lastName}">
							<li class="fieldcontain">
								<span id="lastName-label" class="property-label"><g:message code="person.lastName.label" default="Last Name" /></span>
								
									<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${personInstance}" field="lastName"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.title}">
							<li class="fieldcontain">
								<span id="title-label" class="property-label"><g:message code="person.title.label" default="Title" /></span>
								
									<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${personInstance}" field="title"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.knownAs}">
							<li class="fieldcontain">
								<span id="knownAs-label" class="property-label"><g:message code="person.knownAs.label" default="Known As" /></span>
								
									<span class="property-value" aria-labelledby="knownAs-label"><g:fieldValue bean="${personInstance}" field="knownAs"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.dateOfBirth}">
							<li class="fieldcontain">
								<span id="dateOfBirth-label" class="property-label"><g:message code="person.dateOfBirth.label" default="Date Of Birth" /></span>
								
									<span class="property-value" aria-labelledby="dateOfBirth-label"><g:formatDate date="${personInstance?.dateOfBirth}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.contactNumber}">
							<li class="fieldcontain">
								<span id="contactNumber-label" class="property-label"><g:message code="person.contactNumber.label" default="Contact Number" /></span>
								
									<span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${personInstance}" field="contactNumber"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.gender}">
							<li class="fieldcontain">
								<span id="gender-label" class="property-label"><g:message code="person.gender.label" default="Gender" /></span>
								
									<span class="property-value" aria-labelledby="gender-label"><g:fieldValue bean="${personInstance}" field="gender"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.idNumber}">
							<li class="fieldcontain">
								<span id="idNumber-label" class="property-label"><g:message code="person.idNumber.label" default="Id Number" /></span>
								
									<span class="property-value" aria-labelledby="idNumber-label"><g:fieldValue bean="${personInstance}" field="idNumber"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.race}">
							<li class="fieldcontain">
								<span id="race-label" class="property-label"><g:message code="person.race.label" default="Race" /></span>
								
									<span class="property-value" aria-labelledby="race-label"><g:link controller="race" action="show" id="${personInstance?.race?.id}">${personInstance?.race?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.empHowJobFound}">
							<li class="fieldcontain">
								<span id="empHowJobFound-label" class="property-label"><g:message code="person.empHowJobFound.label" default="Emp How Job Found" /></span>
								
									<span class="property-value" aria-labelledby="empHowJobFound-label"><g:fieldValue bean="${personInstance}" field="empHowJobFound"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.emoHowJobFoundDesc}">
							<li class="fieldcontain">
								<span id="emoHowJobFoundDesc-label" class="property-label"><g:message code="person.emoHowJobFoundDesc.label" default="Emo How Job Found Desc" /></span>
								
									<span class="property-value" aria-labelledby="emoHowJobFoundDesc-label"><g:fieldValue bean="${personInstance}" field="emoHowJobFoundDesc"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="person.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${personInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="person.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${personInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.history}">
							<li class="fieldcontain">
								<span id="history-label" class="property-label"><g:message code="person.history.label" default="History" /></span>
								
									<span class="property-value" aria-labelledby="history-label"><g:fieldValue bean="${personInstance}" field="history"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.citizenship}">
							<li class="fieldcontain">
								<span id="citizenship-label" class="property-label"><g:message code="person.citizenship.label" default="Citizenship" /></span>
								
									<span class="property-value" aria-labelledby="citizenship-label"><g:link controller="citizenship" action="show" id="${personInstance?.citizenship?.id}">${personInstance?.citizenship?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="person.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${personInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="person.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${personInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${personInstance?.office}">
							<li class="fieldcontain">
								<span id="office-label" class="property-label"><g:message code="person.office.label" default="Office" /></span>
								
									<span class="property-value" aria-labelledby="office-label"><g:link controller="office" action="show" id="${personInstance?.office?.id}">${personInstance?.office?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
