
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
						
							<g:if test="${evictionInstance?.yearsLived}">
							<li class="fieldcontain">
								<span id="yearsLived-label" class="property-label"><g:message code="eviction.yearsLived.label" default="Years Lived" /></span>
								
									<span class="property-value" aria-labelledby="yearsLived-label"><g:fieldValue bean="${evictionInstance}" field="yearsLived"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.networkMember}">
							<li class="fieldcontain">
								<span id="networkMember-label" class="property-label"><g:message code="eviction.networkMember.label" default="Network Member" /></span>
								
									<span class="property-value" aria-labelledby="networkMember-label"><g:fieldValue bean="${evictionInstance}" field="networkMember"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.specify}">
							<li class="fieldcontain">
								<span id="specify-label" class="property-label"><g:message code="eviction.specify.label" default="Specify" /></span>
								
									<span class="property-value" aria-labelledby="specify-label"><g:fieldValue bean="${evictionInstance}" field="specify"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.landRights}">
							<li class="fieldcontain">
								<span id="landRights-label" class="property-label"><g:message code="eviction.landRights.label" default="Land Rights" /></span>
								
									<span class="property-value" aria-labelledby="landRights-label"><g:fieldValue bean="${evictionInstance}" field="landRights"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.councillorRole}">
							<li class="fieldcontain">
								<span id="councillorRole-label" class="property-label"><g:message code="eviction.councillorRole.label" default="Councillor Role" /></span>
								
									<span class="property-value" aria-labelledby="councillorRole-label"><g:fieldValue bean="${evictionInstance}" field="councillorRole"/></span>
								
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
						
							<g:if test="${evictionInstance?.improvementCosts}">
							<li class="fieldcontain">
								<span id="improvementCosts-label" class="property-label"><g:message code="eviction.improvementCosts.label" default="Improvement Costs" /></span>
								
									<span class="property-value" aria-labelledby="improvementCosts-label"><g:fieldValue bean="${evictionInstance}" field="improvementCosts"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dwellingType}">
							<li class="fieldcontain">
								<span id="dwellingType-label" class="property-label"><g:message code="eviction.dwellingType.label" default="Dwelling Type" /></span>
								
									<span class="property-value" aria-labelledby="dwellingType-label"><g:fieldValue bean="${evictionInstance}" field="dwellingType"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.cows}">
							<li class="fieldcontain">
								<span id="cows-label" class="property-label"><g:message code="eviction.cows.label" default="Cows" /></span>
								
									<span class="property-value" aria-labelledby="cows-label"><g:fieldValue bean="${evictionInstance}" field="cows"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.chickens}">
							<li class="fieldcontain">
								<span id="chickens-label" class="property-label"><g:message code="eviction.chickens.label" default="Chickens" /></span>
								
									<span class="property-value" aria-labelledby="chickens-label"><g:fieldValue bean="${evictionInstance}" field="chickens"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.goats}">
							<li class="fieldcontain">
								<span id="goats-label" class="property-label"><g:message code="eviction.goats.label" default="Goats" /></span>
								
									<span class="property-value" aria-labelledby="goats-label"><g:fieldValue bean="${evictionInstance}" field="goats"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.sheep}">
							<li class="fieldcontain">
								<span id="sheep-label" class="property-label"><g:message code="eviction.sheep.label" default="Sheep" /></span>
								
									<span class="property-value" aria-labelledby="sheep-label"><g:fieldValue bean="${evictionInstance}" field="sheep"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.cats}">
							<li class="fieldcontain">
								<span id="cats-label" class="property-label"><g:message code="eviction.cats.label" default="Cats" /></span>
								
									<span class="property-value" aria-labelledby="cats-label"><g:fieldValue bean="${evictionInstance}" field="cats"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dogs}">
							<li class="fieldcontain">
								<span id="dogs-label" class="property-label"><g:message code="eviction.dogs.label" default="Dogs" /></span>
								
									<span class="property-value" aria-labelledby="dogs-label"><g:fieldValue bean="${evictionInstance}" field="dogs"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.horses}">
							<li class="fieldcontain">
								<span id="horses-label" class="property-label"><g:message code="eviction.horses.label" default="Horses" /></span>
								
									<span class="property-value" aria-labelledby="horses-label"><g:fieldValue bean="${evictionInstance}" field="horses"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.other}">
							<li class="fieldcontain">
								<span id="other-label" class="property-label"><g:message code="eviction.other.label" default="Other" /></span>
								
									<span class="property-value" aria-labelledby="other-label"><g:fieldValue bean="${evictionInstance}" field="other"/></span>
								
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
						
							<g:if test="${evictionInstance?.clinic}">
							<li class="fieldcontain">
								<span id="clinic-label" class="property-label"><g:message code="eviction.clinic.label" default="Clinic" /></span>
								
									<span class="property-value" aria-labelledby="clinic-label"><g:fieldValue bean="${evictionInstance}" field="clinic"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.tradPractices}">
							<li class="fieldcontain">
								<span id="tradPractices-label" class="property-label"><g:message code="eviction.tradPractices.label" default="Trad Practices" /></span>
								
									<span class="property-value" aria-labelledby="tradPractices-label"><g:fieldValue bean="${evictionInstance}" field="tradPractices"/></span>
								
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
						
							<g:if test="${evictionInstance?.consent}">
							<li class="fieldcontain">
								<span id="consent-label" class="property-label"><g:message code="eviction.consent.label" default="Consent" /></span>
								
									<span class="property-value" aria-labelledby="consent-label"><g:fieldValue bean="${evictionInstance}" field="consent"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.evictionEntity}">
							<li class="fieldcontain">
								<span id="evictionEntity-label" class="property-label"><g:message code="eviction.evictionEntity.label" default="Eviction Entity" /></span>
								
									<span class="property-value" aria-labelledby="evictionEntity-label"><g:fieldValue bean="${evictionInstance}" field="evictionEntity"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.evictionMethod}">
							<li class="fieldcontain">
								<span id="evictionMethod-label" class="property-label"><g:message code="eviction.evictionMethod.label" default="Eviction Method" /></span>
								
									<span class="property-value" aria-labelledby="evictionMethod-label"><g:fieldValue bean="${evictionInstance}" field="evictionMethod"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.status}">
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="eviction.status.label" default="Status" /></span>
								
									<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${evictionInstance}" field="status"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.hasShelter}">
							<li class="fieldcontain">
								<span id="hasShelter-label" class="property-label"><g:message code="eviction.hasShelter.label" default="Has Shelter" /></span>
								
									<span class="property-value" aria-labelledby="hasShelter-label"><g:fieldValue bean="${evictionInstance}" field="hasShelter"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.evictionDocs}">
							<li class="fieldcontain">
								<span id="evictionDocs-label" class="property-label"><g:message code="eviction.evictionDocs.label" default="Eviction Docs" /></span>
								
									<span class="property-value" aria-labelledby="evictionDocs-label"><g:fieldValue bean="${evictionInstance}" field="evictionDocs"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.threatType}">
							<li class="fieldcontain">
								<span id="threatType-label" class="property-label"><g:message code="eviction.threatType.label" default="Threat Type" /></span>
								
									<span class="property-value" aria-labelledby="threatType-label"><g:fieldValue bean="${evictionInstance}" field="threatType"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.threatIssuer}">
							<li class="fieldcontain">
								<span id="threatIssuer-label" class="property-label"><g:message code="eviction.threatIssuer.label" default="Threat Issuer" /></span>
								
									<span class="property-value" aria-labelledby="threatIssuer-label"><g:fieldValue bean="${evictionInstance}" field="threatIssuer"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.chargesLaid}">
							<li class="fieldcontain">
								<span id="chargesLaid-label" class="property-label"><g:message code="eviction.chargesLaid.label" default="Charges Laid" /></span>
								
									<span class="property-value" aria-labelledby="chargesLaid-label"><g:fieldValue bean="${evictionInstance}" field="chargesLaid"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.caseDetails}">
							<li class="fieldcontain">
								<span id="caseDetails-label" class="property-label"><g:message code="eviction.caseDetails.label" default="Case Details" /></span>
								
									<span class="property-value" aria-labelledby="caseDetails-label"><g:fieldValue bean="${evictionInstance}" field="caseDetails"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.designedOutcome}">
							<li class="fieldcontain">
								<span id="designedOutcome-label" class="property-label"><g:message code="eviction.designedOutcome.label" default="Designed Outcome" /></span>
								
									<span class="property-value" aria-labelledby="designedOutcome-label"><g:fieldValue bean="${evictionInstance}" field="designedOutcome"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.labourDispute}">
							<li class="fieldcontain">
								<span id="labourDispute-label" class="property-label"><g:message code="eviction.labourDispute.label" default="Labour Dispute" /></span>
								
									<span class="property-value" aria-labelledby="labourDispute-label"><g:fieldValue bean="${evictionInstance}" field="labourDispute"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.ccma}">
							<li class="fieldcontain">
								<span id="ccma-label" class="property-label"><g:message code="eviction.ccma.label" default="Ccma" /></span>
								
									<span class="property-value" aria-labelledby="ccma-label"><g:fieldValue bean="${evictionInstance}" field="ccma"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.hoursWorked}">
							<li class="fieldcontain">
								<span id="hoursWorked-label" class="property-label"><g:message code="eviction.hoursWorked.label" default="Hours Worked" /></span>
								
									<span class="property-value" aria-labelledby="hoursWorked-label"><g:fieldValue bean="${evictionInstance}" field="hoursWorked"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.hoursType}">
							<li class="fieldcontain">
								<span id="hoursType-label" class="property-label"><g:message code="eviction.hoursType.label" default="Hours Type" /></span>
								
									<span class="property-value" aria-labelledby="hoursType-label"><g:fieldValue bean="${evictionInstance}" field="hoursType"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.earnings}">
							<li class="fieldcontain">
								<span id="earnings-label" class="property-label"><g:message code="eviction.earnings.label" default="Earnings" /></span>
								
									<span class="property-value" aria-labelledby="earnings-label"><g:fieldValue bean="${evictionInstance}" field="earnings"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.earningsType}">
							<li class="fieldcontain">
								<span id="earningsType-label" class="property-label"><g:message code="eviction.earningsType.label" default="Earnings Type" /></span>
								
									<span class="property-value" aria-labelledby="earningsType-label"><g:fieldValue bean="${evictionInstance}" field="earningsType"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.dateCreated}">
							<li class="fieldcontain">
								<span id="dateCreated-label" class="property-label"><g:message code="eviction.dateCreated.label" default="Date Created" /></span>
								
									<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${evictionInstance?.dateCreated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.lastUpdated}">
							<li class="fieldcontain">
								<span id="lastUpdated-label" class="property-label"><g:message code="eviction.lastUpdated.label" default="Last Updated" /></span>
								
									<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${evictionInstance?.lastUpdated}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${evictionInstance?.name}">
							<li class="fieldcontain">
								<span id="name-label" class="property-label"><g:message code="eviction.name.label" default="Name" /></span>
								
									<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${evictionInstance}" field="name"/></span>
								
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
