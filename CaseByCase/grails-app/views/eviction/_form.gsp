<%@ page import="com.cbc.Eviction" %>



<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'lastUpdatedBy', 'error')} required">
	<label for="lastUpdatedBy">
		<g:message code="eviction.lastUpdatedBy.label" default="Last Updated By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="lastUpdatedBy" type="number" value="${evictionInstance.lastUpdatedBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'createdBy', 'error')} required">
	<label for="createdBy">
		<g:message code="eviction.createdBy.label" default="Created By" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="createdBy" type="number" value="${evictionInstance.createdBy}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'yearsLived', 'error')} ">
	<label for="yearsLived">
		<g:message code="eviction.yearsLived.label" default="How long have they lived there:" />
	</label>
	<g:field name="yearsLived" type="number" value="${evictionInstance.yearsLived}"/>
	<label for="yearsLived">
		<g:message code="eviction.yearsLived.label" default="years" />
	</label>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'networkMember', 'error')} ">
	<label for="networkMember">
		<g:message code="eviction.networkMember.label" default="Member of a Network?" />
		
	</label>
	<g:select name="networkMember" from="${evictionInstance.constraints.networkMember.inList}" value="${evictionInstance?.networkMember}" valueMessagePrefix="eviction.networkMember" noSelection="['': '']"/>
	<g:textField name="specify" value="${evictionInstance?.specify}" placeholder="If yes, please specify"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'landRights', 'error')} ">
	<label for="landRights">
		<g:message code="eviction.landRights.label" default="Client has knowledge of land rights:" />
		
	</label>
	<g:select name="landRights" from="${evictionInstance.constraints.landRights.inList}" value="${evictionInstance?.landRights}" valueMessagePrefix="eviction.landRights" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'councillorRole', 'error')} ">
	<label for="councillorRole">
		<g:message code="eviction.councillorRole.label" default="Descibe Role of Councillor:" />
		
	</label>
	<g:textArea name="councillorRole" cols="40" rows="5" maxlength="255" value="${evictionInstance?.councillorRole}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'consent', 'error')} ">
	<label for="consent">
		<g:message code="eviction.consent.label" default="Consent to live on land:" />
		
	</label>
	<g:select name="consent" from="${evictionInstance.constraints.consent.inList}" value="${evictionInstance?.consent}" valueMessagePrefix="eviction.consent" noSelection="['': '']"/>
</div>
<fieldset><legend>Environment</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsNum', 'error')} ">
	<label for="dwellingsNum">
		<g:message code="eviction.dwellingsNum.label" default="Number of dwellings:" />
		
	</label>
	<g:field name="dwellingsNum" type="number" value="${evictionInstance.dwellingsNum}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsPayer', 'error')} ">
	<label for="dwellingsPayer">
		<g:message code="eviction.dwellingsPayer.label" default="Who paid for the dwellings?" />
		
	</label>
	<g:textField name="dwellingsPayer" value="${evictionInstance?.dwellingsPayer}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsImproved', 'error')} ">
	<label for="dwellingsImproved">
		<g:message code="eviction.dwellingsImproved.label" default=" Have the dwellings been improved?" />
		
	</label>
	<g:select name="dwellingsImproved" from="${evictionInstance.constraints.dwellingsImproved.inList}" value="${evictionInstance?.dwellingsImproved}" valueMessagePrefix="eviction.dwellingsImproved" noSelection="['': '']"/>
	<g:field name="improvementCosts" type="number" value="${evictionInstance.improvementCosts}" placeholder="If yes, at what cost: R"/>
</div>


<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingType', 'error')} ">
	<label for="dwellingType">
		<g:message code="eviction.dwellingType.label" default="Dwelling Type" />
		
	</label>
	<g:select name="dwellingType" from="${evictionInstance.constraints.dwellingType.inList}" value="${evictionInstance?.dwellingType}" valueMessagePrefix="eviction.dwellingType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'cows', 'error')} ">
	<label for="cows">
		<g:message code="eviction.cows.label" default="Cows" />
		
	</label>
	<g:field name="cows" type="number" value="${evictionInstance.cows}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'chickens', 'error')} ">
	<label for="chickens">
		<g:message code="eviction.chickens.label" default="Chickens" />
		
	</label>
	<g:field name="chickens" type="number" value="${evictionInstance.chickens}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'goats', 'error')} ">
	<label for="goats">
		<g:message code="eviction.goats.label" default="Goats" />
		
	</label>
	<g:field name="goats" type="number" value="${evictionInstance.goats}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'sheep', 'error')} ">
	<label for="sheep">
		<g:message code="eviction.sheep.label" default="Sheep" />
		
	</label>
	<g:field name="sheep" type="number" value="${evictionInstance.sheep}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'cats', 'error')} ">
	<label for="cats">
		<g:message code="eviction.cats.label" default="Cats" />
		
	</label>
	<g:field name="cats" type="number" value="${evictionInstance.cats}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dogs', 'error')} ">
	<label for="dogs">
		<g:message code="eviction.dogs.label" default="Dogs" />
		
	</label>
	<g:field name="dogs" type="number" value="${evictionInstance.dogs}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'horses', 'error')} ">
	<label for="horses">
		<g:message code="eviction.horses.label" default="Horses" />
		
	</label>
	<g:field name="horses" type="number" value="${evictionInstance.horses}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'other', 'error')} ">
	<label for="other">
		<g:message code="eviction.other.label" default="Other" />
		
	</label>
	<g:field name="other" type="number" value="${evictionInstance.other}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'crops', 'error')} ">
	<label for="crops">
		<g:message code="eviction.crops.label" default="Crops (Specify Crop and Hectares):" />
		
	</label>
	<g:textArea name="crops" cols="40" rows="5" maxlength="255" value="${evictionInstance?.crops}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'grazing', 'error')} ">
	<label for="grazing">
		<g:message code="eviction.grazing.label" default="Grazing (Specify Livestock and Hectares):" />
		
	</label>
	<g:textArea name="grazing" cols="40" rows="5" maxlength="255" value="${evictionInstance?.grazing}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'livestockVal', 'error')} ">
	<label for="livestockVal">
		<g:message code="eviction.livestockVal.label" default="Value of livestock:" />
		
	</label>
	<g:field name="livestockVal" value="${fieldValue(bean: evictionInstance, field: 'livestockVal')}"/>
	
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'cropsVal', 'error')} ">
	<label for="cropsVal">
		<g:message code="eviction.cropsVal.label" default="Value of crops:" />
		
	</label>
	<g:field name="cropsVal" value="${fieldValue(bean: evictionInstance, field: 'cropsVal')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'elecSource', 'error')} ">
	<label for="elecSource">
		<g:message code="eviction.elecSource.label" default="Source of Electricity:" />
		
	</label>
	<g:textField name="elecSource" value="${evictionInstance?.elecSource}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'waterSource', 'error')} ">
	<label for="waterSource">
		<g:message code="eviction.waterSource.label" default="Source of Water:" />
		
	</label>
	<g:textField name="waterSource" value="${evictionInstance?.waterSource}"/>
</div>
</fieldset>
<fieldset><legend>Social Issues</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'graveAccess', 'error')} ">
	<label for="graveAccess">
		<g:message code="eviction.graveAccess.label" default="Access to graves?" />
		
	</label>
	<g:select name="graveAccess" from="${evictionInstance.constraints.graveAccess.inList}" value="${evictionInstance?.graveAccess}" valueMessagePrefix="eviction.graveAccess" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'primarySchools', 'error')} ">
	<label for="primarySchools">
		<g:message code="eviction.primarySchools.label" default="Distance to Primary Schools and Name of School:" />
		
	</label>
	<g:textArea name="primarySchools" cols="40" rows="5" maxlength="255" value="${evictionInstance?.primarySchools}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'highSchools', 'error')} ">
	<label for="highSchools">
		<g:message code="eviction.highSchools.label" default="Distance to High Schools and Name of School:" />
		
	</label>
	<g:textArea name="highSchools" cols="40" rows="5" maxlength="255" value="${evictionInstance?.highSchools}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'clinic', 'error')} ">
	<label for="clinic">
		<g:message code="eviction.clinic.label" default="Distance to Clinic and Name of Clinic:" />
		
	</label>
	<g:textArea name="clinic" cols="40" rows="5" maxlength="255" value="${evictionInstance?.clinic}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'tradPractices', 'error')} ">
	<label for="tradPractices">
		<g:message code="eviction.tradPractices.label" default="Traditional Practices carried out on land (Specify):" />
		
	</label>
	<g:textArea name="tradPractices" cols="40" rows="5" maxlength="255" value="${evictionInstance?.tradPractices}"/>
</div>
</fieldset>
<fieldset><legend>Constitutional Rights</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'waterAccess', 'error')} ">
	<label for="waterAccess">
		<g:message code="eviction.waterAccess.label" default="Access to Water resctricted?" />
		
	</label>
	<g:select name="waterAccess" from="${evictionInstance.constraints.waterAccess.inList}" value="${evictionInstance?.waterAccess}" valueMessagePrefix="eviction.waterAccess" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'electricityAccess', 'error')} ">
	<label for="electricityAccess">
		<g:message code="eviction.electricityAccess.label" default="Access to Electricity resctricted?" />
		
	</label>
	<g:select name="electricityAccess" from="${evictionInstance.constraints.electricityAccess.inList}" value="${evictionInstance?.electricityAccess}" valueMessagePrefix="eviction.electricityAccess" noSelection="['': '']"/>
</div>
</fieldset>
<fieldset><legend>Actual Eviction</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionEntity', 'error')} ">
	<label for="evictionEntity">
		<g:message code="eviction.evictionEntity.label" default="Eviction Entity" />
		
	</label>
	<g:select name="evictionEntity" from="${evictionInstance.constraints.evictionEntity.inList}" value="${evictionInstance?.evictionEntity}" valueMessagePrefix="eviction.evictionEntity" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionMethod', 'error')} ">
	<label for="evictionMethod">
		<g:message code="eviction.evictionMethod.label" default="Method of eviction:" />
		
	</label>
	<g:select name="evictionMethod" from="${evictionInstance.constraints.evictionMethod.inList}" value="${evictionInstance?.evictionMethod}" valueMessagePrefix="eviction.evictionMethod" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="eviction.status.label" default="Current status:" />
		
	</label>
	<g:select name="status" from="${evictionInstance.constraints.status.inList}" value="${evictionInstance?.status}" valueMessagePrefix="eviction.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'hasShelter', 'error')} ">
	<label for="hasShelter">
		<g:message code="eviction.hasShelter.label" default="Has Shelter?" />
		
	</label>
	<g:select name="hasShelter" from="${evictionInstance.constraints.hasShelter.inList}" value="${evictionInstance?.hasShelter}" valueMessagePrefix="eviction.hasShelter" noSelection="['': '']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionDocs', 'error')} ">
<label for="evictionDocs">
		<g:message code="eviction.evictionDocs.label" default="Non Documents" />
	</label>
<g:checkBox name="evictionDocs" value="Non Documents" checked="${evictionInstance?.evictionDocs}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionDocs', 'error')} ">
<label for="evictionDocs">
		<g:message code="eviction.evictionDocs.label" default="Court Order" />
	</label>
<g:checkBox name="evictionDocs" value="Court Order" checked="${evictionInstance?.evictionDocs}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionDocs', 'error')} ">
<label for="evictionDocs">
		<g:message code="eviction.evictionDocs.label" default="Common Law Eviction Order" />
	</label>
<g:checkBox name="evictionDocs" value="Common Law Eviction Order" checked="${evictionInstance?.evictionDocs}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionDocs', 'error')} ">
<label for="evictionDocs">
		<g:message code="eviction.evictionDocs.label" default="Labour Tenants Eviction Order" />
	</label>
<g:checkBox name="evictionDocs" value="Labour Tenants Eviction Order" checked="${evictionInstance?.evictionDocs}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionDocs', 'error')} ">
<label for="evictionDocs">
		<g:message code="eviction.evictionDocs.label" default="Prevention of Illegal Evictions from & Unlawful Occupation" />
	</label>
<g:checkBox name="evictionDocs" value="Prevention of Illegal Evictions from & Unlawful Occupation" checked="${evictionInstance?.evictionDocs}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'evictionDocs', 'error')} ">
<label for="evictionDocs">
		<g:message code="eviction.evictionDocs.label" default="Other Type of Court Order" />
	</label>
	<g:checkBox name="evictionDocs" value="Other Type of Court Order" checked="${evictionInstance?.evictionDocs}"/>
</div>
</fieldset>
<fieldset><legend>Threatened Eviction</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'threatType', 'error')} ">
	<label for="threatType">
		<g:message code="eviction.threatType.label" default="Threat Type" />
		
	</label>
	<g:select name="threatType" from="${evictionInstance.constraints.threatType.inList}" value="${evictionInstance?.threatType}" valueMessagePrefix="eviction.threatType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'threatIssuer', 'error')} ">
	<label for="threatIssuer">
		<g:message code="eviction.threatIssuer.label" default="Threat Issuer" />
		
	</label>
	<g:select name="threatIssuer" from="${evictionInstance.constraints.threatIssuer.inList}" value="${evictionInstance?.threatIssuer}" valueMessagePrefix="eviction.threatIssuer" noSelection="['': '']"/>
</div>
</fieldset>
<fieldset><legend>Criminal/Civil Charges</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'chargesLaid', 'error')} ">
	<label for="chargesLaid">
		<g:message code="eviction.chargesLaid.label" default="Has charges been laid against Occupiers in relation to the land?" />
		
	</label>
	<g:select name="chargesLaid" from="${evictionInstance.constraints.chargesLaid.inList}" value="${evictionInstance?.chargesLaid}" valueMessagePrefix="eviction.chargesLaid" noSelection="['': '']"/>
	<g:textArea name="caseDetails" cols="40" rows="5" maxlength="255" value="${evictionInstance?.caseDetails}" placeholder="If yes, case number and details:"/>
</div>

</fieldset>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'designedOutcome', 'error')} ">
	<label for="designedOutcome">
		<g:message code="eviction.designedOutcome.label" default="Client's designed outcome:" />
		
	</label>
	<g:textArea name="designedOutcome" cols="40" rows="5" maxlength="255" value="${evictionInstance?.designedOutcome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'labourDispute', 'error')} ">
	<label for="labourDispute">
		<g:message code="eviction.labourDispute.label" default="Is there an associated labour dispute?" />
		
	</label>
	<g:select name="labourDispute" from="${evictionInstance.constraints.labourDispute.inList}" value="${evictionInstance?.labourDispute}" valueMessagePrefix="eviction.labourDispute" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'ccma', 'error')} ">
	<label for="ccma">
		<g:message code="eviction.ccma.label" default="Has case been referred to the CCMA?" />
		
	</label>
	<g:select name="ccma" from="${evictionInstance.constraints.ccma.inList}" value="${evictionInstance?.ccma}" valueMessagePrefix="eviction.ccma" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'hoursWorked', 'error')} ">
	<label for="hoursWorked">
		<g:message code="eviction.hoursWorked.label" default="Hours Worked" />
		
	</label>
	<g:field name="hoursWorked" type="number" value="${evictionInstance.hoursWorked}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'hoursType', 'error')} ">
	<label for="hoursType">
		<g:message code="eviction.hoursType.label" default="Hours Type" />
		
	</label>
	<g:select name="hoursType" from="${evictionInstance.constraints.hoursType.inList}" value="${evictionInstance?.hoursType}" valueMessagePrefix="eviction.hoursType" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'earnings', 'error')} ">
	<label for="earnings">
		<g:message code="eviction.earnings.label" default="Earnings" />
		
	</label>
	<g:field name="earnings" type="number" value="${evictionInstance.earnings}"/>
	<g:select name="earningsType" from="${evictionInstance.constraints.earningsType.inList}" value="${evictionInstance?.earningsType}" valueMessagePrefix="eviction.earningsType" noSelection="['': '']"/>
</div>



<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="eviction.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${evictionInstance?.name}"/>
</div>


