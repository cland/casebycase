
<%@ page import="com.cbc.lookup.Keywords" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keywords.label', default: 'Keywords')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-keywords" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-keywords" class="content scaffold-show" role="main">
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
					<ol class="property-list keywords">
						
							<g:if test="${keywordsInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="keywords.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${keywordsInstance}" field="name"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.category}">
							<li class="fieldcontain">
								<span id="category-label" class="property-label"><g:message code="keywords.category.label" default="Category" /></span>
								
									<span class="property-value" aria-labelledby="category-label"><g:fieldValue bean="${keywordsInstance}" field="category"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.description}">
							<li class="fieldcontain">
								<span id="description-label" class="property-label"><g:message code="keywords.description.label" default="Description" /></span>
								
									<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${keywordsInstance}" field="description"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.label}">
							<li class="fieldcontain">
								<span id="label-label" class="property-label"><g:message code="keywords.label.label" default="Label" /></span>
								
									<span class="property-value" aria-labelledby="label-label"><g:fieldValue bean="${keywordsInstance}" field="label"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="keywords.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${keywordsInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="keywords.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${keywordsInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="keywords.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${keywordsInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="keywords.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${keywordsInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${keywordsInstance?.values}">
							<li class="fieldcontain">
								<span id="values-label" class="property-label"><g:message code="keywords.values.label" default="Values" /></span>
								
									<g:each in="${keywordsInstance.values}" var="v">
									<span class="property-value" aria-labelledby="values-label"><g:link controller="keywords" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:keywordsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${keywordsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
