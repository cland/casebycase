<%@ page import="com.cbc.Eviction" %>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'years', 'error')} ">
	<label for="eviction.years">
		<g:message code="eviction.years.label" default="How long have they lived there?" />
		
	</label>
	<g:textField name="years" value="${evictionInstance?.years}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'networkMember', 'error')} ">
	<label for="eviction.years">
		<g:message code="eviction.years.label" default="How long have they lived there?" />
		
	</label>
	<g:select name="networkMember" from="${evictionInstance?.constraints.networkMember.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'years', 'error')} ">
	<label for="eviction.specifyNetwork">
		<g:message code="eviction.specifyNetwork.label" default="Specify network, if yes:" />
		
	</label>
	<g:textArea name="specifyNetwork">${evictionInstance?.landRights}</g:textArea>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'landRights', 'error')} ">
	<label for="eviction.landRights">
		<g:message code="eviction.landRights.label" default="Client has knowledge of land rights:" />
		
	</label>
	<g:select name="landRights" from="${evictionInstance?.constraints.landRights.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'councillorRole', 'error')} ">
	<label for="eviction.councillorRole">
		<g:message code="eviction.councillorRole.label" default="Describe the role of Councillor:" />
		
	</label>
	<g:textArea name="councillorRole">${evictionInstance?.councillorRole}</g:textArea>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsNum', 'error')} ">
	<label for="eviction.dwellingsNum">
		<g:message code="eviction.dwellingsNum.label" default="Number of dwellings" />
		
	</label>
	<g:textField name="dwellingsNum" value="${evictionInstance?.dwellingsNum}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsPayer', 'error')} ">
	<label for="eviction.dwellingsPayer">
		<g:message code="eviction.dwellingsPayer.label" default="Who paid for the dwelling?" />
		
	</label>
	<g:textField name="dwellingsPayer" value="${evictionInstance?.dwellingsPayer}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingsImproved', 'error')} ">
	<label for="eviction.dwellingsImproved">
		<g:message code="eviction.dwellingsImproved.label" default="Have the dwellings been improved?" />
	</label>
	<g:select name="dwellingsImproved" from="${evictionInstance?.constraints.dwellingsImproved.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'improvementCost', 'error')} ">
	<label for="eviction.improvementCost">
		<g:message code="eviction.improvementCost.label" default="If yes, at what cost?" />
		
	</label>
	<g:textField name="improvementCost" value="${evictionInstance?.improvementCost}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'dwellingType', 'error')} ">
	<label for="dwellingType">
		<g:message code="eviction.dwellingType.label" default="Dwelling Type" />	
	</label>
	<g:select id="dwellingType" name="dwellingType.id" 
		from="${com.cbc.lookup.Keywords.findByName("EvictionDwellingType")?.values}" 
		optionKey="id"  value="${evictionInstance?.dwellingType?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'livestock', 'error')} ">
	<label for="livestock">
		<g:message code="eviction.livestock.label" default="Number of livestock:" />			
	</label>
	
	<g:hiddenField name="livestock.id" value="${evictionInstance?.livestock?.id }"/>
	<div class="table">
		<div class="row">
			<div class="cell">Cows</div>
			<div class="cell"><g:textField name="livestock.cow" value="${evictionInstance?.livestock?.cow}"/></div>		
			<div class="cell">Chickens</div>
			<div class="cell"><g:textField name="livestock.chicken" value="${evictionInstance?.livestock?.chicken}"/></div>
		</div>
		<div class="row">
			<div class="cell">Sheep</div>
			<div class="cell"><g:textField name="livestock.sheep" value="${evictionInstance?.livestock?.sheep}"/></div>
			<div class="cell">Goats</div>
			<div class="cell"><g:textField name="livestock.goat" value="${evictionInstance?.livestock?.goat}"/></div>
		</div>
		<div class="row">	
			<div class="cell">Dogs</div>
			<div class="cell"><g:textField name="livestock.dog" value="${evictionInstance?.livestock?.dog}"/></div>
			<div class="cell">Cats</div>
			<div class="cell"><g:textField name="livestock.cat" value="${evictionInstance?.livestock?.cat}"/></div>
		</div>
		<div class="row">	
			<div class="cell">Horses</div>
			<div class="cell"><g:textField name="livestock.horse" value="${evictionInstance?.livestock?.horse}"/></div>
			<div class="cell">Other</div>
			<div class="cell"><g:textField name="livestock.other" value="${evictionInstance?.livestock?.other}"/></div>
		</div>
	</div>
		
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'crops', 'error')} ">
	<label for="eviction.crops">
		<g:message code="eviction.crops.label" default="Crops (Specify Crop and Hectares):" />
		
	</label>
	<g:textArea name="crops" value="${evictionInstance?.crops}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'grazing', 'error')} ">
	<label for="eviction.grazing">
		<g:message code="eviction.grazing.label" default="Grazing (Specify Livestock and Hectares):" />
		
	</label>
	<g:textArea name="grazing" value="${evictionInstance?.grazing}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'grazing', 'error')} ">
	<label for="eviction.grazing">
		<g:message code="eviction.grazing.label" default="Grazing (Specify Livestock and Hectares):" />
		
	</label>
	<g:textField name="grazing" value="${evictionInstance?.grazing}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'livestockVal', 'error')} ">
	<label for="eviction.livestockVal">
		<g:message code="eviction.livestockVal.label" default="Value of Livestock:" />
		
	</label>R
	<g:textField name="livestockVal" value="${evictionInstance?.livestockVal}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'cropsVal', 'error')} ">
	<label for="cropsVal">
		<g:message code="eviction.cropsVal.label" default="Value of crops:" />
		
	</label>R
	<g:textField name="livestockVal" value="${evictionInstance?.cropsVal}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'elecSource', 'error')} ">
	<label for="elecSource">
		<g:message code="eviction.elecSource.label" default="Source of electricity:" />
		
	</label>
	<g:textField name="elecSource" value="${evictionInstance?.elecSource}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'waterSource', 'error')} ">
	<label for="waterSource">
		<g:message code="eviction.waterSource.label" default="Source of water:" />
		
	</label>
	<g:textField name="waterSource" value="${evictionInstance?.waterSource}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'graveAccess', 'error')} ">
	<label for="eviction.graveAccess">
		<g:message code="eviction.graveAccess.label" default="Access to graves:" />
		
	</label>
	<g:select name="graveAccess" from="${evictionInstance?.constraints.graveAccess.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'primarySchools', 'error')} ">
	<label for="primarySchools">
		<g:message code="eviction.primarySchools.label" default="Distance to Primary Schools and Name of School:" />
		
	</label>
	<g:textArea name="primarySchools" value="${evictionInstance?.primarySchools}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'primarySchools', 'error')} ">
	<label for="highSchools">
		<g:message code="eviction.highSchools.label" default="Distance to High Schools and Name of School:" />
		
	</label>
	<g:textArea name="highSchools" value="${evictionInstance?.highSchools}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'clinics', 'error')} ">
	<label for="clinics">
		<g:message code="eviction.clinics.label" default="Distance to Clinic and Name of School:" />
		
	</label>
	<g:textArea name="clinics" value="${evictionInstance?.clinics}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'tradPracs', 'error')} ">
	<label for="tradPracs">
		<g:message code="eviction.tradPracs.label" default="Traditional practices carried out on land (Specify):" />
		
	</label>
	<g:textArea name="tradPracs" value="${evictionInstance?.tradPracs}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'waterAccess', 'error')} ">
	<label for="eviction.waterAccess">
		<g:message code="eviction.waterAccess.label" default="Access to water:" />
		
	</label>
	<g:select name="waterAccess" from="${evictionInstance?.constraints.waterAccess.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'electricityAccess', 'error')} ">
	<label for="electricityAccess">
		<g:message code="eviction.electricityAccess.label" default="Access to Electricity:" />
		
	</label>
	<g:select name="electricityAccess" from="${evictionInstance?.constraints.electricityAccess.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'landConsentType', 'error')} ">
	<label for="landConsentType">
		<g:message code="eviction.landConsentType.label" default="Land Consent Type" />	
	</label>	
	<g:select id="landConsentType" name="landConsentType.id" 
		from="${com.cbc.lookup.Keywords.findByName("EvictionLandConsentType")?.values}" 
		optionKey="id"  value="${evictionInstance?.landConsentType?.id}" 
		class="many-to-one" 
		noSelection="['null':'-select-']"/>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'currentStatus', 'error')} ">
	<label for="eviction.currentStatus">
		<g:message code="eviction.currentStatus.label" default="Current Status:" />
		
	</label>
	<g:select name="currentStatus" from="${evictionInstance?.constraints.currentStatus.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'shelter', 'error')} ">
	<label for="eviction.shelter">
		<g:message code="eviction.shelter.label" default="Has Shelter?" />
		
	</label>
	<g:select name="shelter" from="${evictionInstance?.constraints.shelter.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'chargesAgainstOccupiers', 'error')} ">
	<label for="eviction.chargesAgainstOccupiers">
		<g:message code="eviction.chargesAgainstOccupiers.label" default="Has the charges been laid against the Occupriers in relation to the land?" />
		
	</label>
	<g:select name="chargesAgainstOccupiers" from="${evictionInstance?.constraints.chargesAgainstOccupiers.inList}" />
	</div>	
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'specifyOccupierCharge', 'error')} ">
	<label for="specifyOccupierCharge">
		<g:message code="eviction.specifyOccupierCharge.label" default="If yes, case number and details:" />
		
	</label>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'chargesAgainstEvictors', 'error')} ">
	<label for="eviction.chargesAgainstEvictors">
		<g:message code="eviction.chargesAgainstEvictors.label" default="Has the charges been laid against the Evictors in relation to the land?" />
		
	</label>
	<g:select name="chargesAgainstEvictors" from="${evictionInstance?.constraints.chargesAgainstEvictors.inList}" />
	</div>
	<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'specifyEvictorCharge', 'error')} ">
	<label for="eviction.specifyEvictorCharge">
		<g:message code="eviction.specifyEvictorCharge.label" default="If yes, case number and details:" />
		
	</label>
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'designatedOutcome', 'error')} ">
	<label for="eviction.designatedOutcome">
		<g:message code="eviction.designatedOutcome.label" default="Client's designed outcome:" />
		
	</label>
	<g:textArea name="designatedOutcome" value="${evictionInstance?.designatedOutcome}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'labour', 'error')} ">
	<label for="eviction.labour">
		<g:message code="eviction.labour.label" default="Is there an associated labour dispute?" />
		
	</label>
	<g:select name="labour" from="${evictionInstance?.constraints.labour.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'cCMA', 'error')} ">
	<label for="eviction.cCMA">
		<g:message code="eviction.cCMA.label" default="Has case been referred to the CCMA?" />
		
	</label>
	<g:select name="cCMA" from="${evictionInstance?.constraints.workHours.inList}" />	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field: 'workHours', 'error')} ">
	<label for="eviction.workHours">
		<g:message code="eviction.workHours.label" default="Hours worked:" />
		
	</label>
	<g:textField name="workHours" value="${evictionInstance?.workHours}"/>	
</div>
<div class="fieldcontain ${hasErrors(bean: evictionInstance, field:
	 'earnings', 'error')} ">
	<label for="eviction.earnings">
		<g:message code="eviction.earnings.label" default="Earnings:" />
		
	</label>
	<g:textField name="earnings" value="${evictionInstance?.earnings}"/>	
</div>
<div class="table">
	<div class="row">
		<div class="cell">
		<label for="evictionBy">
			<g:message code="eviction.evictionBy.label" default="Eviction By" />
			<span class="required-indicator">*</span>
		</label>
		</div>
		<div class="cell">
		<g:each in="${com.cbc.lookup.Keywords.findByName("EvictionBy")?.values}" var="keyword" status="index">
			<g:checkBox name="evictionBy" value="${keyword.id }" checked="${ evictionInstance?.evictionBy?.contains(keyword)}" />
			<label for="evictionBy">${keyword }</label><br>
		</g:each>
		</div>
	</div>
</div>

