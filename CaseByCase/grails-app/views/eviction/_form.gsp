<%@ page import="com.cbc.Eviction" %>

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

