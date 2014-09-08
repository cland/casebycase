
<div class="table">
		<div class="row">
			<div class="cell">Region:</div>
			<div class="cell">
			<g:select id="region" name="region.id" from="${com.cbc.location.Region.list()}" 
				optionKey="id" required="" 
				value="${locationInstance?.id}" class="many-to-one"
				onchange="${remoteFunction(
	            controller:'country', 
	            action:'getDistricts', 
	            params:'\'id=\' + escape(this.value)', 
	            onSuccess:'cbc_location.load_districts(data,\'district_options\',\'muni_options,mainplace_options,suburb_options\')')}"
			/>
			</div>					
		</div>
		<div class="row">
		<div class="cell">District:</div>
			<div class="cell">
				<select name="location.district" id="district_options" onchange="onLocationChange(this,'getMunicipalities','muni_options','mainplace_options,suburb_options')">
					<option value="">--</option>
				</select>
			</div>					
		</div>
		<div class="row">
			<div class="cell">Municipality:</div>
			<div class="cell">
				<select name="location.municipality" id="muni_options" onchange="onLocationChange(this,'getMainPlaces','mainplace_options','suburb_options')">
					<option value="">--</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="cell">Main Place:</div>
			<div class="cell">
				<select name="location.mainplace" id="mainplace_options" onchange="onLocationChange(this,'getSuburbs','suburb_options','')">
					<option value="">--</option>
				</select>
			</div>
		</div>
		<div class="row">
			<div class="cell">Suburb/Village:</div>
			<div class="cell">
				<select name="location.suburb" id="suburb_options">
					<option value="">--</option>
				</select>
			</div>
		</div>
</div>
	
<script>
function load_options(_id,controller_name,action_name,field_id,subfields){
	var _link ="${resource()}/" + controller_name + "/" + action_name;	
	$.ajax({
		url : _link, 
		dataType: "json",
		data : 'id=' + _id,
		success : function(data) {
			cbc_location.combobox_options(data,field_id,"--select one--","",true,subfields);
		},
		error : function() { // handle server errors
			alert("Unable to retrieve items");
		}
	});
}
function onLocationChange(el,action_name,field_id,subfields){	
	load_options(el.value,"country",action_name,field_id,subfields)
}
</script>	