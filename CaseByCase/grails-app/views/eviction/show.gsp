
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
						
							<g:if test="${evictionInstance?.stayPeriod}">
							<li class="fieldcontain">
								<span id="stayPeriod-label" class="property-label"><g:message code="eviction.stayPeriod.label" default="Stay Period" /></span>
								
									<span class="property-value" aria-labelledby="stayPeriod-label"><g:fieldValue bean="${evictionInstance}" field="stayPeriod"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.networkMember}">
							<li class="fieldcontain">
								<span id="networkMember-label" class="property-label"><g:message code="eviction.networkMember.label" default="Network Member" /></span>
								
									<span class="property-value" aria-labelledby="networkMember-label"><g:fieldValue bean="${evictionInstance}" field="networkMember"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.specifyNetwork}">
							<li class="fieldcontain">
								<span id="specifyNetwork-label" class="property-label"><g:message code="eviction.specifyNetwork.label" default="Specify Network" /></span>
								
									<span class="property-value" aria-labelledby="specifyNetwork-label"><g:fieldValue bean="${evictionInstance}" field="specifyNetwork"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.councillorRole}">
							<li class="fieldcontain">
								<span id="councillorRole-label" class="property-label"><g:message code="eviction.councillorRole.label" default="Councillor Role" /></span>
								
									<span class="property-value" aria-labelledby="councillorRole-label"><g:fieldValue bean="${evictionInstance}" field="councillorRole"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.landRights}">
							<li class="fieldcontain">
								<span id="landRights-label" class="property-label"><g:message code="eviction.landRights.label" default="Land Rights" /></span>
								
									<span class="property-value" aria-labelledby="landRights-label"><g:fieldValue bean="${evictionInstance}" field="landRights"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dwellingsNum}">
							<li class="fieldcontain">
								<span id="dwellingsNum-label" class="property-label"><g:message code="eviction.dwellingsNum.label" default="Dwellings Num" /></span>
								
									<span class="property-value" aria-labelledby="dwellingsNum-label"><g:fieldValue bean="${evictionInstance}" field="dwellingsNum"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dwellingsPayer}">
							<li class="fieldcontain">
								<span id="dwellingsPayer-label" class="property-label"><g:message code="eviction.dwellingsPayer.label" default="Dwellings Payer" /></span>
								
									<span class="property-value" aria-labelledby="dwellingsPayer-label"><g:fieldValue bean="${evictionInstance}" field="dwellingsPayer"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dwellingsImproved}">
							<li class="fieldcontain">
								<span id="dwellingsImproved-label" class="property-label"><g:message code="eviction.dwellingsImproved.label" default="Dwellings Improved" /></span>
								
									<span class="property-value" aria-labelledby="dwellingsImproved-label"><g:fieldValue bean="${evictionInstance}" field="dwellingsImproved"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.improvementCost}">
							<li class="fieldcontain">
								<span id="improvementCost-label" class="property-label"><g:message code="eviction.improvementCost.label" default="Improvement Cost" /></span>
								
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
								<span id="crops-label" class="property-label"><g:message code="eviction.crops.label" default="Crops" /></span>
								
									<span class="property-value" aria-labelledby="crops-label"><g:fieldValue bean="${evictionInstance}" field="crops"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.grazing}">
							<li class="fieldcontain">
								<span id="grazing-label" class="property-label"><g:message code="eviction.grazing.label" default="Grazing" /></span>
								
									<span class="property-value" aria-labelledby="grazing-label"><g:fieldValue bean="${evictionInstance}" field="grazing"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.livestockVal}">
							<li class="fieldcontain">
								<span id="livestockVal-label" class="property-label"><g:message code="eviction.livestockVal.label" default="Livestock Val" /></span>
								
									<span class="property-value" aria-labelledby="livestockVal-label"><g:fieldValue bean="${evictionInstance}" field="livestockVal"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.cropsVal}">
							<li class="fieldcontain">
								<span id="cropsVal-label" class="property-label"><g:message code="eviction.cropsVal.label" default="Crops Val" /></span>
								
									<span class="property-value" aria-labelledby="cropsVal-label"><g:fieldValue bean="${evictionInstance}" field="cropsVal"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.elecSource}">
							<li class="fieldcontain">
								<span id="elecSource-label" class="property-label"><g:message code="eviction.elecSource.label" default="Elec Source" /></span>
								
									<span class="property-value" aria-labelledby="elecSource-label"><g:fieldValue bean="${evictionInstance}" field="elecSource"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.waterSource}">
							<li class="fieldcontain">
								<span id="waterSource-label" class="property-label"><g:message code="eviction.waterSource.label" default="Water Source" /></span>
								
									<span class="property-value" aria-labelledby="waterSource-label"><g:fieldValue bean="${evictionInstance}" field="waterSource"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.graveAccess}">
							<li class="fieldcontain">
								<span id="graveAccess-label" class="property-label"><g:message code="eviction.graveAccess.label" default="Grave Access" /></span>
								
									<span class="property-value" aria-labelledby="graveAccess-label"><g:fieldValue bean="${evictionInstance}" field="graveAccess"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.primarySchools}">
							<li class="fieldcontain">
								<span id="primarySchools-label" class="property-label"><g:message code="eviction.primarySchools.label" default="Primary Schools" /></span>
								
									<span class="property-value" aria-labelledby="primarySchools-label"><g:fieldValue bean="${evictionInstance}" field="primarySchools"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.highSchools}">
							<li class="fieldcontain">
								<span id="highSchools-label" class="property-label"><g:message code="eviction.highSchools.label" default="High Schools" /></span>
								
									<span class="property-value" aria-labelledby="highSchools-label"><g:fieldValue bean="${evictionInstance}" field="highSchools"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.clinics}">
							<li class="fieldcontain">
								<span id="clinics-label" class="property-label"><g:message code="eviction.clinics.label" default="Clinics" /></span>
								
									<span class="property-value" aria-labelledby="clinics-label"><g:fieldValue bean="${evictionInstance}" field="clinics"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.tradPracs}">
							<li class="fieldcontain">
								<span id="tradPracs-label" class="property-label"><g:message code="eviction.tradPracs.label" default="Trad Pracs" /></span>
								
									<span class="property-value" aria-labelledby="tradPracs-label"><g:fieldValue bean="${evictionInstance}" field="tradPracs"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.waterAccess}">
							<li class="fieldcontain">
								<span id="waterAccess-label" class="property-label"><g:message code="eviction.waterAccess.label" default="Water Access" /></span>
								
									<span class="property-value" aria-labelledby="waterAccess-label"><g:fieldValue bean="${evictionInstance}" field="waterAccess"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.electricityAccess}">
							<li class="fieldcontain">
								<span id="electricityAccess-label" class="property-label"><g:message code="eviction.electricityAccess.label" default="Electricity Access" /></span>
								
									<span class="property-value" aria-labelledby="electricityAccess-label"><g:fieldValue bean="${evictionInstance}" field="electricityAccess"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.landConsentType}">
							<li class="fieldcontain">
								<span id="landConsentType-label" class="property-label"><g:message code="eviction.landConsentType.label" default="Land Consent Type" /></span>
								
									<span class="property-value" aria-labelledby="landConsentType-label"><g:link controller="keywords" action="show" id="${evictionInstance?.landConsentType?.id}">${evictionInstance?.landConsentType?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.currentStatus}">
							<li class="fieldcontain">
								<span id="currentStatus-label" class="property-label"><g:message code="eviction.currentStatus.label" default="Current Status" /></span>
								
									<span class="property-value" aria-labelledby="currentStatus-label"><g:link controller="keywords" action="show" id="${evictionInstance?.currentStatus?.id}">${evictionInstance?.currentStatus?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.shelter}">
							<li class="fieldcontain">
								<span id="shelter-label" class="property-label"><g:message code="eviction.shelter.label" default="Shelter" /></span>
								
									<span class="property-value" aria-labelledby="shelter-label"><g:fieldValue bean="${evictionInstance}" field="shelter"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.chargesAgainstOccupiers}">
							<li class="fieldcontain">
								<span id="chargesAgainstOccupiers-label" class="property-label"><g:message code="eviction.chargesAgainstOccupiers.label" default="Charges Against Occupiers" /></span>
								
									<span class="property-value" aria-labelledby="chargesAgainstOccupiers-label"><g:fieldValue bean="${evictionInstance}" field="chargesAgainstOccupiers"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.specifyOccupierCharge}">
							<li class="fieldcontain">
								<span id="specifyOccupierCharge-label" class="property-label"><g:message code="eviction.specifyOccupierCharge.label" default="Specify Occupier Charge" /></span>
								
									<span class="property-value" aria-labelledby="specifyOccupierCharge-label"><g:fieldValue bean="${evictionInstance}" field="specifyOccupierCharge"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.chargesAgainstEvictors}">
							<li class="fieldcontain">
								<span id="chargesAgainstEvictors-label" class="property-label"><g:message code="eviction.chargesAgainstEvictors.label" default="Charges Against Evictors" /></span>
								
									<span class="property-value" aria-labelledby="chargesAgainstEvictors-label"><g:fieldValue bean="${evictionInstance}" field="chargesAgainstEvictors"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.specifyEvictorCharge}">
							<li class="fieldcontain">
								<span id="specifyEvictorCharge-label" class="property-label"><g:message code="eviction.specifyEvictorCharge.label" default="Specify Evictor Charge" /></span>
								
									<span class="property-value" aria-labelledby="specifyEvictorCharge-label"><g:fieldValue bean="${evictionInstance}" field="specifyEvictorCharge"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.desiredOutcome}">
							<li class="fieldcontain">
								<span id="desiredOutcome-label" class="property-label"><g:message code="eviction.desiredOutcome.label" default="Desired Outcome" /></span>
								
									<span class="property-value" aria-labelledby="desiredOutcome-label"><g:fieldValue bean="${evictionInstance}" field="desiredOutcome"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.labourDispute}">
							<li class="fieldcontain">
								<span id="labourDispute-label" class="property-label"><g:message code="eviction.labourDispute.label" default="Labour Dispute" /></span>
								
									<span class="property-value" aria-labelledby="labourDispute-label"><g:fieldValue bean="${evictionInstance}" field="labourDispute"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.cCMAReferred}">
							<li class="fieldcontain">
								<span id="cCMAReferred-label" class="property-label"><g:message code="eviction.cCMAReferred.label" default="CCMAR eferred" /></span>
								
									<span class="property-value" aria-labelledby="cCMAReferred-label"><g:fieldValue bean="${evictionInstance}" field="cCMAReferred"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.hoursWorked}">
							<li class="fieldcontain">
								<span id="hoursWorked-label" class="property-label"><g:message code="eviction.hoursWorked.label" default="Hours Worked" /></span>
								
									<span class="property-value" aria-labelledby="hoursWorked-label"><g:fieldValue bean="${evictionInstance}" field="hoursWorked"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.earnings}">
							<li class="fieldcontain">
								<span id="earnings-label" class="property-label"><g:message code="eviction.earnings.label" default="Earnings" /></span>
								
									<span class="property-value" aria-labelledby="earnings-label"><g:fieldValue bean="${evictionInstance}" field="earnings"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.earningsValue}">
							<li class="fieldcontain">
								<span id="earningsValue-label" class="property-label"><g:message code="eviction.earningsValue.label" default="Earnings Value" /></span>
								
									<span class="property-value" aria-labelledby="earningsValue-label"><g:fieldValue bean="${evictionInstance}" field="earningsValue"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.hoursWorkedValue}">
							<li class="fieldcontain">
								<span id="hoursWorkedValue-label" class="property-label"><g:message code="eviction.hoursWorkedValue.label" default="Hours Worked Value" /></span>
								
									<span class="property-value" aria-labelledby="hoursWorkedValue-label"><g:fieldValue bean="${evictionInstance}" field="hoursWorkedValue"/></span>
								
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
								
									<g:each in="${evictionInstance.evictionBy}" var="e">
									<span class="property-value" aria-labelledby="evictionBy-label"><g:link controller="keywords" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.evictionDocuments}">
							<li class="fieldcontain">
								<span id="evictionDocuments-label" class="property-label"><g:message code="eviction.evictionDocuments.label" default="Eviction Documents" /></span>
								
									<g:each in="${evictionInstance.evictionDocuments}" var="e">
									<span class="property-value" aria-labelledby="evictionDocuments-label"><g:link controller="keywords" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.evictionMethod}">
							<li class="fieldcontain">
								<span id="evictionMethod-label" class="property-label"><g:message code="eviction.evictionMethod.label" default="Eviction Method" /></span>
								
									<g:each in="${evictionInstance.evictionMethod}" var="e">
									<span class="property-value" aria-labelledby="evictionMethod-label"><g:link controller="keywords" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="eviction.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${evictionInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.threatBy}">
							<li class="fieldcontain">
								<span id="threatBy-label" class="property-label"><g:message code="eviction.threatBy.label" default="Threat By" /></span>
								
									<g:each in="${evictionInstance.threatBy}" var="t">
									<span class="property-value" aria-labelledby="threatBy-label"><g:link controller="keywords" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.threatType}">
							<li class="fieldcontain">
								<span id="threatType-label" class="property-label"><g:message code="eviction.threatType.label" default="Threat Type" /></span>
								
									<g:each in="${evictionInstance.threatType}" var="t">
									<span class="property-value" aria-labelledby="threatType-label"><g:link controller="keywords" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
									</g:each>
								
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
