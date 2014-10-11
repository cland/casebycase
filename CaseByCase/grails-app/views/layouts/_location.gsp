<g:set var="isEditMode" value="${mode == "edit" }"/>
<div class="table">
	<g:hiddenField name="location.id" value="${locationInstance?.id }"/>
	<div class="row">
			<div class="cell"><label>Country:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
				<g:select id="country" name="location.country.id" from="${com.cbc.location.Country.list()}" 
					optionKey="id" required="" 
					value="${locationInstance?.country?.id}" class="many-to-one"/>
					<g:if test="${params?.action=='edit' }">
					<span class="r-arrow"></span><span><a href="#" onclick="resetLocations();return false;">Reset Options</a></span>
					</g:if>	
				</g:if>	
				<g:else><span class="property-value">${locationInstance?.country?.name }</span></g:else>
			</div>	
						
		</div>
		<div class="row">
			<div class="cell"><label>Region:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
				<g:select id="region" name="location.region.id" from="${com.cbc.location.Region.list()}" 
					optionKey="id" required="" 
					value="${locationInstance?.region?.id}" class="many-to-one"
					noSelection="['null': '-select region-']"
					onchange="${remoteFunction(
		            controller:'country', 
		            action:'getDistricts', 
		            params:'\'id=\' + escape(this.value)', 
		            onSuccess:'cbc_location.load_districts(data,\'district_options\',\'muni_options,mainplace_options,suburb_options\', \'' + locationInstance?.district?.id + '\')')}"
				/>
				
				</g:if>
				<g:else><span class="property-value">${locationInstance?.region?.name }</span></g:else>
			</div>					
		</div>
		<div class="row">
		<div class="cell"><label>District:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
				<select name="location.district.id" id="district_options" onchange="onLocationChange(this,'getMunicipalities','muni_options','mainplace_options,suburb_options','${locationInstance?.municipality?.id}')">
					<option value="">--</option>
				</select>
				</g:if>
				<g:else><span class="property-value">${locationInstance?.district?.name }</span></g:else>
				
			</div>					
		</div>
		<div class="row">
			<div class="cell"><label>Municipality:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
				<select name="location.municipality.id" id="muni_options" onchange="onLocationChange(this,'getMainPlaces','mainplace_options','suburb_options','${locationInstance?.mainplace?.id}')">
					<option value="">--</option>
				</select>
				</g:if>
				<g:else><span class="property-value">${locationInstance?.municipality?.name }</span></g:else>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label>Main Place:</label></div>
			<div class="cell">
				<g:if test="${isEditMode}">
				<select name="location.mainplace.id" id="mainplace_options" onchange="onLocationChange(this,'getSuburbs','suburb_options','','${locationInstance?.suburb?.id}')">
					<option value="">--</option>
				</select>
				</g:if>
				<g:else><span class="property-value">${locationInstance?.mainplace?.name }</span></g:else>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label>Suburb/Village:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
				<select name="location.suburb.id" id="suburb_options">
					<option value="">--</option>
				</select>
				</g:if>
				<g:else><span class="property-value">${locationInstance?.suburb?.name }</span></g:else>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label>Township:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
					<g:textField name="location.township" value="${locationsInstance?.township }"/>				
				</g:if>
				<g:else><span class="property-value">${locationInstance?.township }</span></g:else>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label>Location description:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
					<g:textArea name="location.description"></g:textArea>				
				</g:if>
				<g:else><span class="property-value">${locationInstance?.description }</span></g:else>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label>Longitude:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
					<g:textField name="location.longitude" value="${locationInstance?.longitude }"/>				
				</g:if>
				<g:else><span class="property-value">${locationInstance?.longitude }</span></g:else>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label>Latitude:</label></div>
			<div class="cell">
				<g:if test="${isEditMode }">
					<g:textField name="location.latitude" value="${locationInstance?.latitude }"/>			
				</g:if>
				<g:else><span class="property-value">${locationInstance?.latitude }</span></g:else>
			</div>
		</div>
</div>

<g:if test="${isEditMode }">
<script>
	
	$(document).ready(function() {
		//initialize all the combobox fields	
		cbc_location.current.country = "${locationInstance?.country?.id}";
		cbc_location.current.region = "${locationInstance?.region?.id}";
		cbc_location.current.district = "${locationInstance?.district?.id}";
		cbc_location.current.municipality = "${locationInstance?.municipality?.id}";
		cbc_location.current.mainplace = "${locationInstance?.mainplace?.id}";
		cbc_location.current.suburb = "${locationInstance?.suburb?.id}";
		
		if(cbc_location.current.region != "") load_options(cbc_location.current.region,"country","getDistricts","district_options","",cbc_location.current.district);
		if(cbc_location.current.municipality != "") load_options(cbc_location.current.district,"country","getMunicipalities","muni_options","",cbc_location.current.municipality);
		if(cbc_location.current.mainplace != "") load_options(cbc_location.current.municipality,"country","getMainPlaces","mainplace_options","",cbc_location.current.mainplace);
		if(cbc_location.current.suburb != "") load_options(cbc_location.current.mainplace,"country","getSuburbs","suburb_options","",cbc_location.current.suburb);
			
	});
	function load_options(_id,controller_name,action_name,field_id,subfields,defaultValue){
		var _link ="${resource()}/" + controller_name + "/" + action_name;	
		
		$.ajax({
			url : _link, 
			dataType: "json",
			data : 'id=' + _id,
			success : function(data) {
				cbc_location.combobox_options(data,field_id,"--select one--","",true,subfields,defaultValue);
			},
			error : function() { // handle server errors
				alert("Unable to retrieve items");
			}
		});
	}
	function onLocationChange(el,action_name,field_id,subfields,defaultValue){	
		load_options(el.value,"country",action_name,field_id,subfields,defaultValue)
	}
	function resetLocations(){
		if(cbc_location.current.country != "") $("#country option[value=" + cbc_location.current.country + "]").prop('selected','selected');		
		if(cbc_location.current.region != "") {
			load_options(cbc_location.current.region,"country","getDistricts","district_options","",cbc_location.current.district);
			$("#region option[value=" + cbc_location.current.region + "]").prop('selected','selected');
		}
		if(cbc_location.current.municipality != "") load_options(cbc_location.current.district,"country","getMunicipalities","muni_options","",cbc_location.current.municipality);
		if(cbc_location.current.mainplace != "") load_options(cbc_location.current.municipality,"country","getMainPlaces","mainplace_options","",cbc_location.current.mainplace);
		if(cbc_location.current.suburb != "") load_options(cbc_location.current.mainplace,"country","getSuburbs","suburb_options","",cbc_location.current.suburb);
		return false;
	}
</script>		
</g:if>
