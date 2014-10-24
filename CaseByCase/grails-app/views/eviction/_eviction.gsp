<%@ page import="com.cbc.Eviction" %>
<g:set var="evictionInstance" value="${caseInstance?.eviction}"/>
<g:set var="isEditMode" value="${mode == "edit" }"/>
<g:hiddenField name="eviction.id" value="${evictionInstance?.id }"/>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'stayPeriod', 'error')} ">
	<label for="eviction.stayPeriod">
		<g:message code="eviction.stayPeriod.label" default="How long have they lived there?" />
		
	</label>
	<g:field type="number" name="eviction.stayPeriod" value="${fieldValue(bean: evictionInstance, field: 'stayPeriod')}"/> years
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'networkMember', 'error')} ">
	<label for="eviction.networkMember">
		<g:message code="eviction.networkMember.label" default="Member of a network?" />
		
	</label>
	<g:select name="eviction.networkMember" from="${com.cbc.Eviction.constraints?.networkMember?.inList}" value="${evictionInstance?.networkMember}" valueMessagePrefix="eviction.networkMember" noSelection="['': '']" />	
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'specifyNetwork', 'error')} ">
	<label for="eviction.specifyNetwork">
		<g:message code="eviction.specifyNetwork.label" default="Specify network, if yes:" />
		
	</label>
	<g:textField name="eviction.specifyNetwork" value="${evictionInstance?.specifyNetwork}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'landRights', 'error')} ">
	<label for="eviction.landRights">
		<g:message code="eviction.landRights.label" default="Client has knowledge of land rights:" />
		
	</label>
	<g:select name="eviction.landRights" from="${com.cbc.Eviction.constraints?.landRights?.inList}" 
	 value="${evictionInstance?.landRights}" valueMessagePrefix="eviction.landRights" noSelection="['': '']" />	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'councillorRole', 'error')} ">
	<label for="eviction.councillorRole">
		<g:message code="eviction.councillorRole.label" default="Describe the role of Councillor:" />
		
	</label>
	<g:textArea name="eviction.councillorRole">${evictionInstance?.councillorRole}</g:textArea>	
</div>
<br />

<hr>
<fieldset><legend>Environment</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsNum', 'error')} ">
	<label for="eviction.dwellingsNum">
		<g:message code="eviction.dwellingsNum.label" default="Number of dwellings" />
		
	</label>
	<g:field type="number" name="eviction.dwellingsNum" value="${evictionInstance?.dwellingsNum}"/>	
</div>
<br />
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsPayer', 'error')} ">
	<label for="eviction.dwellingsPayer">
		<g:message code="eviction.dwellingsPayer.label" default="Who paid for the dwelling?" />
		
	</label>
	<g:textField name="eviction.dwellingsPayer" value="${evictionInstance?.dwellingsPayer}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsImproved', 'error')} ">
	<label for="eviction.dwellingsImproved">
		<g:message code="eviction.dwellingsImproved.label" default="Have the dwellings been improved?" />
	</label>
	<g:select name="eviction.dwellingsImproved" from="${com.cbc.Eviction.constraints?.dwellingsImproved?.inList}" 
	 value="${evictionInstance?.dwellingsImproved}" valueMessagePrefix="eviction.dwellingsImproved" noSelection="['': '']" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'improvementCost', 'error')} ">
	<label for="eviction.improvementCost">
		<g:message code="eviction.improvementCost.label" default="If yes, at what cost?" />
		
	</label>
	
	<g:field type="number" name="eviction.improvementCost" value="${fieldValue(bean: evictionInstance, field: 'improvementCost')} " step="0.01"/>
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingType', 'error')} ">
	<label for="eviction.dwellingType">
		<g:message code="eviction.dwellingType.label" default="Dwelling Type" />	
	</label>
	<g:select id="dwellingType" name="eviction.dwellingType.id" 
		from="${com.cbc.lookup.Keywords.findByName("EvictionDwellingType")?.values}" 
		optionKey="id"  value="${evictionInstance?.dwellingType?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'livestock', 'error')} ">
	<label for="eviction.livestock">
		<g:message code="eviction.livestock.label" default="Number of livestock:" />			
	</label>
	
	<g:hiddenField name="eviction.livestock.id" value="${evictionInstance?.livestock?.id }"/>
	<div class="table">
		<div class="row">
			<div class="cell">Cows</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.cow" value="${evictionInstance?.livestock?.cow}"/></div>		
			<div class="cell">Chickens</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.chicken" value="${evictionInstance?.livestock?.chicken}"/></div>
		</div>
		<div class="row">
			<div class="cell">Sheep</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.sheep" value="${evictionInstance?.livestock?.sheep}"/></div>
			<div class="cell">Goats</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.goat" value="${evictionInstance?.livestock?.goat}"/></div>
		</div>
		<div class="row">	
			<div class="cell">Dogs</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.dog" value="${evictionInstance?.livestock?.dog}"/></div>
			<div class="cell">Cats</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.cat" value="${evictionInstance?.livestock?.cat}"/></div>
		</div>
		<div class="row">	
			<div class="cell">Horses</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.horse" value="${evictionInstance?.livestock?.horse}"/></div>
			<div class="cell">Other</div>
			<div class="cell"><g:field type="number" name="eviction.livestock.other" value="${evictionInstance?.livestock?.other}"/></div>
		</div>
	</div>
		
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'crops', 'error')} ">
	<label for="eviction.crops">
		<g:message code="eviction.crops.label" default="Crops (Specify Crop and Hectares):" />
		
	</label>
	<g:textArea name="eviction.crops" value="${evictionInstance?.crops}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'grazing', 'error')} ">
	<label for="eviction.grazing">
		<g:message code="eviction.grazing.label" default="Grazing (Specify Livestock and Hectares):" />
		
	</label>
	<g:textArea name="eviction.grazing" value="${evictionInstance?.grazing}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'livestockVal', 'error')} ">
	<label for="eviction.livestockVal">
		<g:message code="eviction.livestockVal.label" default="Value of Livestock:" />
		
	</label>R	
	<g:field type="number" name="eviction.livestockVal" value="${fieldValue(bean: evictionInstance, field: 'livestockVal')}" step="0.01"/>
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'cropsVal', 'error')} ">
	<label for="eviction.cropsVal">
		<g:message code="eviction.cropsVal.label" default="Value of crops:" />
		
	</label>R	
	<g:field type="number" name="eviction.cropsVal" value="${fieldValue(bean: evictionInstance, field: 'cropsVal')}" step="0.01"/>
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'elecSource', 'error')} ">
	<label for="eviction.elecSource">
		<g:message code="eviction.elecSource.label" default="Source of electricity:" />
		
	</label>
	<g:textField name="eviction.elecSource" value="${evictionInstance?.elecSource}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'waterSource', 'error')} ">
	<label for="eviction.waterSource">
		<g:message code="eviction.waterSource.label" default="Source of water:" />
		
	</label>
	<g:textField name="eviction.waterSource" value="${evictionInstance?.waterSource}"/>	
</div>
</fieldset>
<fieldset><legend>Social Issues</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'graveAccess', 'error')} ">
	<label for="eviction.graveAccess">
		<g:message code="eviction.graveAccess.label" default="Access to graves:" />
		
	</label>
	<g:select name="eviction.graveAccess" from="${com.cbc.Eviction.constraints?.graveAccess?.inList}" 
	 value="${evictionInstance?.graveAccess}" valueMessagePrefix="eviction.graveAccess" noSelection="['': '']" />	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'primarySchools', 'error')} ">
	<label for="eviction.primarySchools">
		<g:message code="eviction.primarySchools.label" default="Distance to Primary Schools and Name of School:" />
		
	</label>
	<g:textArea name="eviction.primarySchools" value="${evictionInstance?.primarySchools}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'highSchools', 'error')} ">
	<label for="eviction.highSchools">
		<g:message code="eviction.highSchools.label" default="Distance to High Schools and Name of School:" />
		
	</label>
	<g:textArea name="eviction.highSchools" value="${evictionInstance?.highSchools}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'clinics', 'error')} ">
	<label for="eviction.clinics">
		<g:message code="eviction.clinics.label" default="Distance to Clinic and Name of School:" />
		
	</label>
	<g:textArea name="eviction.clinics" value="${evictionInstance?.clinics}"/>	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'tradPracs', 'error')} ">
	<label for="eviction.tradPracs">
		<g:message code="eviction.tradPracs.label" default="Traditional practices carried out on land (Specify):" />
		
	</label>
	<g:textArea name="eviction.tradPracs" value="${evictionInstance?.tradPracs}"/>	
</div>
</fieldset>
<fieldset><legend>Constitutional Rights</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'waterAccess', 'error')} ">
	<label for="eviction.eviction.waterAccess">
		<g:message code="eviction.waterAccess.label" default="Access to water:" />
		
	</label>
	<g:select name="eviction.waterAccess" from="${com.cbc.Eviction.constraints?.waterAccess?.inList}" 
	 value="${evictionInstance?.waterAccess}" valueMessagePrefix="eviction.waterAccess" noSelection="['': '']" />	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'electricityAccess', 'error')} ">
	<label for="eviction.electricityAccess">
		<g:message code="eviction.electricityAccess.label" default="Access to Electricity:" />
		
	</label>
	<g:select name="eviction.electricityAccess" from="${com.cbc.Eviction.constraints?.electricityAccess?.inList}" 
	 value="${evictionInstance?.electricityAccess}" valueMessagePrefix="eviction.electricityAccess" noSelection="['': '']" />	
</div>
</fieldset>

<fieldset><legend>Actual Eviction</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'landConsentType', 'error')} ">
	<label for="eviction.landConsentType">
		<g:message code="eviction.landConsentType.label" default="Consent to live on land:" />	
	</label>	
	<g:select id="landConsentType" name="eviction.landConsentType.id" 
		from="${com.cbc.lookup.Keywords.findByName("EvictionLandConsentType")?.values}" 
		optionKey="id"  value="${evictionInstance?.landConsentType?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>
<hr>
<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="eviction.evictionBy">
			<g:message code="eviction.evictionBy.label" default="Who carried out the eviction:" />
			<span class="required-indicator">*</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("EvictionBy")?.values}" var="keyword" status="index">
			<g:checkBox name="eviction.evictionBy" value="${keyword.id }" checked="${ evictionInstance?.evictionBy?.contains(keyword)}" />
			<label for="eviction.evictionBy">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>
<br />
<hr>
<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="eviction.evictionMethod">
			<g:message code="eviction.evictionMethod.label" default="Method of Eviction" />
			<span class="required-indicator">*</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("EvictionMethod")?.values}" var="keyword" status="index">
			<g:checkBox name="eviction.evictionMethod" value="${keyword.id }" checked="${ evictionInstance?.evictionMethod?.contains(keyword)}" />
			<label for="eviction.evictionMethod">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>
<br />
<hr>
<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="eviction.currentStatus">
			<g:message code="eviction.currentStatus.label" default="Current status:" />
			<span class="required-indicator">*</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("EvictionCurrentStatus")?.values}" var="keyword" status="index">
			<g:checkBox name="eviction.currentStatus" value="${keyword.id }" checked="${ evictionInstance?.currentStatus?.contains(keyword)}" />
			<label for="eviction.currentStatus">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'shelter', 'error')} ">
	<label for="eviction.shelter">
		<g:message code="eviction.shelter.label" default="Has Shelter?" />
		
	</label>
	<g:select name="eviction.shelter" from="${com.cbc.Eviction.constraints?.shelter?.inList}" 
	 value="${evictionInstance?.shelter}" valueMessagePrefix="eviction.shelter" noSelection="['': '']" />	
</div>
<br />
<hr>
<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="eviction.evictionDocuments">
			<g:message code="eviction.evictionDocuments.label" default="Documents Issued:" />
			<span class="required-indicator">*</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("EvictionDocuments")?.values}" var="keyword" status="index">
			<g:checkBox name="eviction.evictionDocuments" value="${keyword.id }" checked="${ evictionInstance?.evictionDocuments?.contains(keyword)}" />
			<label for="eviction.evictionDocuments">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>
<br />
<hr>
<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="eviction.threatType">
			<g:message code="eviction.threatType.label" default="Type of threat:" />
			<span class="required-indicator">*</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("EvictionThreatType")?.values}" var="keyword" status="index">
			<g:checkBox name="eviction.threatType" value="${keyword.id }" checked="${ evictionInstance?.threatType?.contains(keyword)}" />
			<label for="eviction.threatType">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>
<br />
<hr>
<div class="table">
	<div class="row">
		<div class="cell" style="width:200px;">
		<label for="eviction.threatType">
			<g:message code="eviction.threatType.label" default="Threat issued by:" />
			<span class="required-indicator">*</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("EvictionThreatBy")?.values}" var="keyword" status="index">
			<g:checkBox name="eviction.threatBy" value="${keyword.id }" checked="${ evictionInstance?.threatBy?.contains(keyword)}" />
			<label for="eviction.threatBy">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>
</fieldset>
<fieldset><legend>Criminal/Civil Charges</legend>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'chargesAgainstOccupiers', 'error')} ">
	<label for="eviction.chargesAgainstOccupiers">
		<g:message code="eviction.chargesAgainstOccupiers.label" default="Has the charges been laid against the Occupiers in relation to the land?" />
		
	</label>
	<g:select name="eviction.chargesAgainstOccupiers" from="${com.cbc.Eviction.constraints?.chargesAgainstOccupiers?.inList}" 
	 value="${evictionInstance?.chargesAgainstOccupiers}" valueMessagePrefix="eviction.chargesAgainstOccupiers" noSelection="['': '']" />
	<label for="eviction.specifyOccupierCharge">
		<g:message code="eviction.specifyOccupierCharge.label" default="If yes, case number and details:" />
		
	</label>
	<g:textArea name="eviction.specifyOccupierCharge"> ${evictionInstance?.specifyOccupierCharge}</g:textArea>
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'chargesAgainstEvictors', 'error')} ">
	<label for="eviction.chargesAgainstEvictors">
		<g:message code="eviction.chargesAgainstEvictors.label" default="Has the charges been laid against the Evictors in relation to the land?" />
		
	</label>
	<g:select name="eviction.chargesAgainstEvictors" from="${com.cbc.Eviction.constraints?.chargesAgainstEvictors?.inList}" 
	 value="${evictionInstance?.chargesAgainsEvictors}" valueMessagePrefix="eviction.chargesAgainstEvictors" noSelection="['': '']" />
	<label for="eviction.specifyEvictorCharge">
		<g:message code="eviction.specifyEvictorCharge.label" default="If yes, case number and details:" />
		
	</label>
	<g:textArea name="eviction.eviction.specifyEvictorCharge"> ${evictionInstance?.specifyEvictorCharge}</g:textArea>
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'desiredOutcome', 'error')} ">
	<label for="eviction.desiredOutcome">
		<g:message code="eviction.desiredOutcome.label" default="Client's desired outcome:" />
		
	</label>
	<g:textArea name="eviction.desiredOutcome" value="${evictionInstance?.desiredOutcome}"/>	
</div>
</fieldset>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'labourDispute', 'error')} ">
	<label for="eviction.labourDispute">
		<g:message code="eviction.labourDispute.label" default="Is there an associated labour dispute?" />
		
	</label>
	<g:select name="eviction.labourDispute" from="${com.cbc.Eviction.constraints?.labourDispute?.inList}" 
	 value="${evictionInstance?.labourDispute}" valueMessagePrefix="eviction.labourDispute" noSelection="['': '']" />	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'cCMAReferred', 'error')} ">
	<label for="eviction.CCMAReferred">
		<g:message code="eviction.cCMAReferred.label" default="Has case been referred to the CCMA?" />
		
	</label>
	<g:select name="eviction.cCMAReferred" from="${com.cbc.Eviction.constraints?.cCMAReferred?.inList}" 
	 value="${evictionInstance?.cCMAReferred}" valueMessagePrefix="eviction.cCMAReferred" noSelection="['': '']" />	
</div>
<br />
<hr>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'hoursWorked', 'error')} ">
	<label for="eviction.hoursWorked">
		<g:message code="eviction.hoursWorked.label" default="Hours Worked" />
	</label>
	<g:field type="number" name="eviction.hoursWorkedValue" value="${evictionInstance?.hoursWorkedValue}"/>
	<g:select name="eviction.hoursWorked" from="${com.cbc.Eviction?.constraints?.hoursWorked?.inList}" value="${evictionInstance?.hoursWorked}" valueMessagePrefix="eviction.hoursWorked" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'earnings', 'error')} ">
	<label for="eviction.earnings">
		<g:message code="eviction.earnings.label" default="Earnings" />
	</label>
	<g:field type="number" name="eviction.earningsValue" value="${evictionInstance?.earningsValue}"/>
	<g:select name="eviction.earnings" from="${com.cbc.Eviction.constraints.earnings.inList}" value="${evictionInstance?.earnings}" valueMessagePrefix="eviction.earnings" noSelection="['': '']"/>
</div>