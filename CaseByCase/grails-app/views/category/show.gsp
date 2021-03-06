
<%@ page import="com.cbc.Category"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'category.label', default: 'Category')}" />
<title><g:appTitle title="">
		<g:message code="default.show.label" args="[entityName]" />
	</g:appTitle></title>
<g:set var="page_sidenav" value="sidenav-admin" />
<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
<style>
#appLogo, .sf-menu, .footer, .bread-crump {display:none;}
</style>
</head>
<body>
	<a href="#show-category" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="home" action="cbc">Home</g:link>
		<span class="r-arrow"></span>
		<g:link controller="category" action="index">Categories</g:link>
		<span class="r-arrow"></span> <span class="current-crump"> ${ categoryInstance?.name}</span>
	</div>

	<div id="show-category" class="content scaffold-show" role="main" style="width:100%">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<!-- *** START TABS *** -->
		<div id="tabs" style="display: none;">
			<ul>
				<li><a href="#tab-1">Details</a></li>
				<li><a href="#tab-2">Other</a></li>
			</ul>
			<div id="tab-1">
				<ol class="property-list category">

					<g:if test="${categoryInstance?.name}">
						<li class="fieldcontain"><span id="name-label"
							class="property-label"><g:message
									code="category.name.label" default="Name" /></span> <span
							class="property-value" aria-labelledby="name-label"><g:fieldValue
									bean="${categoryInstance}" field="name" /></span></li>
					</g:if>

					
					<g:if test="${categoryInstance?.parent}">
						<li class="fieldcontain"><span id="category-label"
							class="property-label"><g:message
									code="category.parent.label" default="Parent" /></span> <span
							class="property-value" aria-labelledby="category-label"><g:link
									controller="category" action="show"
									id="${categoryInstance?.parent?.id}">
									${categoryInstance?.parent?.encodeAsHTML()}
								</g:link></span></li>
					</g:if>
					<g:if test="${categoryInstance?.categories}">
						<li class="fieldcontain"><span id="categories-label"
							class="property-label"><g:message
									code="category.categories.label" default="Categories" /></span> <g:each
								in="${categoryInstance.categories}" var="c">
								<span class="property-value" aria-labelledby="categories-label"><g:link
										controller="category" action="show" id="${c.id}">
										${c?.encodeAsHTML()}
									</g:link></span>
							</g:each></li>
					</g:if>
				</ol>
				<fieldset><legend>Transients</legend>
					<b>Level:</b> ${categoryInstance.getLevel(categoryInstance) } <br/>
					<b>Full name:</b> ${categoryInstance.getFullCategoryName(categoryInstance) } <br/>
					<b>Parent Category at Level 1:</b> ${categoryInstance.getParentCategoryAtLevel(categoryInstance,1) } <br/>
				</fieldset>
			</div>

			<div id="tab-2">
				<ol class="property-list category">
					<g:if test="${categoryInstance?.lastUpdatedByName}">
						<li class="fieldcontain"><span id="lastUpdatedBy-label"
							class="property-label"><g:message
									code="category.lastUpdatedByName.label" default="Last Updated By" /></span>

							<span class="property-value"
							aria-labelledby="lastUpdatedByName-label"><g:fieldValue
									bean="${categoryInstance}" field="lastUpdatedByName" /></span></li>
					</g:if>

					<g:if test="${categoryInstance?.createdByName}">
						<li class="fieldcontain"><span id="createdByName-label"
							class="property-label"><g:message
									code="category.createdByName.label" default="Created By" /></span> <span
							class="property-value" aria-labelledby="createdByName-label"><g:fieldValue
									bean="${categoryInstance}" field="createdByName" /></span></li>
					</g:if>
					<g:if test="${categoryInstance?.dateCreated}">
						<li class="fieldcontain"><span id="dateCreated-label"
							class="property-label"><g:message
									code="category.dateCreated.label" default="Date Created" /></span> <span
							class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
									date="${categoryInstance?.dateCreated}" /></span></li>
					</g:if>

					<g:if test="${categoryInstance?.lastUpdated}">
						<li class="fieldcontain"><span id="lastUpdated-label"
							class="property-label"><g:message
									code="category.lastUpdated.label" default="Last Updated" /></span> <span
							class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
									date="${categoryInstance?.lastUpdated}" /></span></li>
					</g:if>
				</ol>
			</div>
		</div>
		<!--  *** END TABS *** -->

		<g:form url="[resource:categoryInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${categoryInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
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
