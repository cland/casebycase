
<%@ page import="com.cbc.Eviction" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'eviction.label', default: 'Eviction')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#show-eviction" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
		<div id="show-eviction" class="content scaffold-show" role="main">
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
					<ol class="property-list eviction">
						
							<g:if test="${evictionInstance?.lastUpdatedBy}">
							<li class="fieldcontain">
								<span id="lastUpdatedBy-label" class="property-label"><g:message code="eviction.lastUpdatedBy.label" default="Last Updated By" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdatedBy-label"><g:fieldValue bean="${evictionInstance}" field="lastUpdatedBy"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.createdBy}">
							<li class="fieldcontain">
								<span id="createdBy-label" class="property-label"><g:message code="eviction.createdBy.label" default="Created By" /></span>
								
									<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${evictionInstance}" field="createdBy"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.years}">
							<li class="fieldcontain">
								<span id="years-label" class="property-label"><g:message code="eviction.years.label" default="How long have they lived there?" /></span>
								
									<span class="property-value" aria-labelledby="years-label"><g:fieldValue bean="${evictionInstance}" field="years"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.networkMember}">
							<li class="fieldcontain">
								<span id="networkMember-label" class="property-label"><g:message code="eviction.networkMember.label" default="Member of a network?" /></span>
								
									<span class="property-value" aria-labelledby="networkMember-label"><g:fieldValue bean="${evictionInstance}" field="networkMember"/></span>
									</li><li class="fieldcontain"><span id="networkMember-label" class="property-label"><g:message code="eviction.networkMember.label" default="Specify network, if yes:" /></span>
									<span class="property-value" aria-labelledby="specifyNetwork-label"><g:fieldValue bean="${evictionInstance}" field="specifyNetwork"/></span>
								</li>
							</g:if>
							
							<g:if test="${evictionInstance?.landRights}">
							<li class="fieldcontain">
								<span id="landRights-label" class="property-label"><g:message code="eviction.landRights.label" default="Client has knowledge of land rights:" /></span>
								
									<span class="property-value" aria-labelledby="landRights-label"><g:fieldValue bean="${evictionInstance}" field="landRights"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.councillorRole}">
							<li class="fieldcontain">
								<span id="councillorRole-label" class="property-label"><g:message code="eviction.councillorRole.label" default="Descibe Role of Councillor:" /></span>
								
									<span class="property-value" aria-labelledby="councillorRole-label"><g:fieldValue bean="${evictionInstance}" field="landRights"/></span>
								
							</li>
							</g:if>
							
							<g:if test="${evictionInstance?.dwellingsNum}">
							<li class="fieldcontain">
								<span id="dwellingsNum-label" class="property-label"><g:message code="eviction.dwellingsNum.label" default="Number of dwellings:" /></span>
								
									<span class="property-value" aria-labelledby="dwellingsNum-label"><g:fieldValue bean="${evictionInstance}" field="dwellingsNum"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.dwellingsPayer}">
							<li class="fieldcontain">
								<span id="dwellingsPayer-label" class="property-label"><g:message code="eviction.dwellingsPayer.label" default="Who payed for the dwellings?" /></span>
								
									<span class="property-value" aria-labelledby="dwellingsPayer-label"><g:fieldValue bean="${evictionInstance}" field="dwellingsPayer"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.dwellingsImproved}">
							<li class="fieldcontain">
								<span id="dwellingsImproved-label" class="property-label"><g:message code="eviction.dwellingsImproved.label" default="Have the dwellings been improved?" /></span>
								
									<span class="property-value" aria-labelledby="dwellingsImproved-label"><g:fieldValue bean="${evictionInstance}" field="dwellingsImproved"/></span>
								
							</li>
							<li class="fieldcontain">
								<span id="improvementCost-label" class="property-label"><g:message code="eviction.improvementCost.label" default="If yes, at what cost? R" /></span>
								
									<span class="property-value" aria-labelledby="improvementCost-label"><g:fieldValue bean="${evictionInstance}" field="improvementCost"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.livestock}">
							<li class="fieldcontain">
								<span id="livestock-label" class="property-label"><g:message code="eviction.livestock.label" default="Livestock" /></span>
								
									<span class="property-value" aria-labelledby="livestock-label"><g:link controller="livestock" action="show" id="${evictionInstance?.livestock?.id}">${evictionInstance?.livestock?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dwellingType}">
							<li class="fieldcontain">
								<span id="dwellingType-label" class="property-label"><g:message code="eviction.dwellingType.label" default="Dwelling Type" /></span>
								
									<span class="property-value" aria-labelledby="dwellingType-label"><g:link controller="keywords" action="show" id="${evictionInstance?.dwellingType?.id}">${evictionInstance?.dwellingType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.crops}">
							<li class="fieldcontain">
								<span id="crops-label" class="property-label"><g:message code="eviction.crops.label" default="Crop: " /></span>
								
									<span class="property-value" aria-labelledby="crops-label"><g:fieldValue bean="${evictionInstance}" field="crops"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.grazing}">
							<li class="fieldcontain">
								<span id="grazing-label" class="property-label"><g:message code="eviction.crops.label" default="Grazing" /></span>
								
									<span class="property-value" aria-labelledby="grazing-label"><g:fieldValue bean="${evictionInstance}" field="grazing"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.livestockVal}">
							<li class="fieldcontain">
								<span id="livestockVal-label" class="property-label"><g:message code="eviction.livestockVal.label" default="Value of Livestock:" /></span>
								
									<span class="property-value" aria-labelledby="livestockVal-label"><g:fieldValue bean="${evictionInstance}" field="livestockVal"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.cropsVal}">
							<li class="fieldcontain">
								<span id="cropsVal-label" class="property-label"><g:message code="eviction.cropsVal.label" default="Value of Crops:" /></span>
								
									<span class="property-value" aria-labelledby="cropsVal-label"><g:fieldValue bean="${evictionInstance}" field="cropsVal"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.elecSource}">
							<li class="fieldcontain">
								<span id="elecSource-label" class="property-label"><g:message code="eviction.elecSource.label" default="Electricity Source: " /></span>
								
									<span class="property-value" aria-labelledby="elecSource-label"><g:fieldValue bean="${evictionInstance}" field="elecSource"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.waterSource}">
							<li class="fieldcontain">
								<span id="waterSource-label" class="property-label"><g:message code="eviction.waterSource.label" default="Water Source: " /></span>
								
									<span class="property-value" aria-labelledby="waterSource-label"><g:fieldValue bean="${evictionInstance}" field="waterSource"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.graveAccess}">
							<li class="fieldcontain">
								<span id="graveAccess-label" class="property-label"><g:message code="eviction.graveAccess.label" default="Access to graves? " /></span>
								
									<span class="property-value" aria-labelledby="graveAccess-label"><g:fieldValue bean="${evictionInstance}" field="graveAccess"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.primarySchools}">
							<li class="fieldcontain">
								<span id="primarySchools-label" class="property-label"><g:message code="eviction.primarySchools.label" default="Distance to Primary Schools and Name of School: " /></span>
								
									<span class="property-value" aria-labelledby="primarySchools-label"><g:fieldValue bean="${evictionInstance}" field="primarySchools"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.highSchools}">
							<li class="fieldcontain">
								<span id="highSchools-label" class="property-label"><g:message code="eviction.highSchools.label" default="Distance to High Schools and Name of School: " /></span>
								
									<span class="property-value" aria-labelledby="highSchools-label"><g:fieldValue bean="${evictionInstance}" field="highSchools"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.clinics}">
							<li class="fieldcontain">
								<span id="clinics-label" class="property-label"><g:message code="eviction.highSchools.label" default="Distance to Clinic and Name of Clinic: " /></span>
								
									<span class="property-value" aria-labelledby="clinics-label"><g:fieldValue bean="${evictionInstance}" field="clinics"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.tradPracs}">
							<li class="fieldcontain">
								<span id="tradPracs-label" class="property-label"><g:message code="eviction.tradPracs.label" default="Traditional Practices carried out on land: " /></span>
								
									<span class="property-value" aria-labelledby="tradPracs-label"><g:fieldValue bean="${evictionInstance}" field="tradPracs"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.waterAccess}">
							<li class="fieldcontain">
								<span id="waterAccess-label" class="property-label"><g:message code="eviction.waterAccess.label" default="Access to Water resctricted? " /></span>
								
									<span class="property-value" aria-labelledby="waterAccess-label"><g:fieldValue bean="${evictionInstance}" field="waterAccess"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.electricityAccess}">
							<li class="fieldcontain">
								<span id="electricityAccess-label" class="property-label"><g:message code="eviction.waterAccess.label" default="Access to Electricity resctricted? " /></span>
								
									<span class="property-value" aria-labelledby="electricityAccess-label"><g:fieldValue bean="${evictionInstance}" field="electricityAccess"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.landConsentType}">
							<li class="fieldcontain">
								<span id="landConsentType-label" class="property-label"><g:message code="eviction.landConsentType.label" default="Land Consent Type" /></span>
								
									<span class="property-value" aria-labelledby="landConsentType-label"><g:link controller="keywords" action="show" id="${evictionInstance?.landConsentType?.id}">${evictionInstance?.landConsentType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
							<%-- Missing fields --%>
							
							<g:if test="${evictionInstance?.currentStatus}">
							<li class="fieldcontain">
								<span id="currentStatus-label" class="property-label"><g:message code="eviction.currentStatus.label" default="Current Status: " /></span>
								
									<span class="property-value" aria-labelledby="currentStatus-label"><g:fieldValue bean="${evictionInstance}" field="currentStatus"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.shelter}">
							<li class="fieldcontain">
								<span id="shelter-label" class="property-label"><g:message code="eviction.shelter.label" default="Has Shelter? " /></span>
								
									<span class="property-value" aria-labelledby="shelter-label"><g:fieldValue bean="${evictionInstance}" field="shelter"/></span>
								
							</li>
							</g:if>
							<g:if test="${evictionInstance?.chargesAgainstOccupiers}">
							<li class="fieldcontain">
								<span id="chargesAgainstOccupiers-label" class="property-label"><g:message code="eviction.chargesAgainstOccupiers.label" default="Has charges been laid against Occupiers in relation to the land? " /></span>
								
									<span class="property-value" aria-labelledby="chargesAgainstOccupiers-label"><g:fieldValue bean="${evictionInstance}" field="chargesAgainstOccupiers"/></span>
								
							</li>
							<li class="fieldcontain">
								<span id="specifyOccupierCharge-label" class="property-label"><g:message code="eviction.specifyOccupierCharge.label" default="If yes, case number and details: " /></span>
								
									<span class="property-value" aria-labelledby="specifyOccupierCharge-label"><g:fieldValue bean="${evictionInstance}" field="specifyOccupierCharge"/></span>
								
							</li>
							</g:if>
							
							<g:if test="${evictionInstance?.chargesAgainstEvictors}">
							<li class="fieldcontain">
								<span id="chargesAgainstEvictors-label" class="property-label"><g:message code="eviction.chargesAgainstEvictors.label" default="Has charges been laid against Evictor in relation to the land? " /></span>
								
									<span class="property-value" aria-labelledby="chargesAgainstEvictors-label"><g:fieldValue bean="${evictionInstance}" field="chargesAgainstEvictors"/></span>
								
							</li>
							<li class="fieldcontain">
								<span id="specifyEvictorCharge-label" class="property-label"><g:message code="eviction.specifyEvictorCharge.label" default="If yes, case number and details: " /></span>
								
									<span class="property-value" aria-labelledby="specifyEvictorCharge-label"><g:fieldValue bean="${evictionInstance}" field="specifyEvictorCharge"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="eviction.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${evictionInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.evictionBy}">
							<li class="fieldcontain">
								<span id="evictionBy-label" class="property-label"><g:message code="eviction.evictionBy.label" default="Eviction By" /></span>
								
									<span class="property-value" aria-labelledby="evictionBy-label"><g:link controller="keywords" action="show" id="${evictionInstance?.evictionBy?.id}">${evictionInstance?.evictionBy?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="eviction.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${evictionInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
						</ol>
				</div>
				
				<div id="tab-2">
					
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:evictionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${evictionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
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
