<%@ page import="com.cbc.Pcm" %>

<fieldset><legend>PCM DETAILS</legend>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'pcmDate', 'error')} required">
	<label for="pcmDate">
		<g:message code="pcm.pcmDate.label" default="Please Call Me Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="pcmDate" precision="day"  value="${pcmInstance?.pcmDate}"  />
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'sender', 'error')} ">
	<label for="sender">
		<g:message code="pcm.sender.label" default="Sender" />
		
	</label>
	<g:textField name="sender" value="${pcmInstance?.sender}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'content', 'error')} ">
	<label for="content">
		<g:message code="pcm.content.label" default="Content" />		
	</label>
	<g:textArea name="content" >${pcmInstance?.content}</g:textArea>
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'receiver', 'error')} ">
	<label for="receiver">
		<g:message code="pcm.receiver.label" default="Receiver" />
		
	</label>
	<g:textField name="receiver" value="${pcmInstance?.receiver}"/>
</div>
</fieldset>
<br/>

<fieldset><legend>CLIENT DETAILS</legend>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="pcm.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${pcmInstance?.name}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'agegroup', 'error')} required">
	<label for="agegroup">
		<g:message code="pcm.agegroup.label" default="Age Group" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="agegroup" name="agegroup.id" from="${com.cbc.AgeGroup.list()}" optionKey="id" required="" value="${pcmInstance?.agegroup?.id}" class="many-to-one" noSelection="['null':'-select one-']"/>
</div>
</fieldset>
<br/>
<fieldset><legend>LOCATION</legend>
	<g:render template="../layouts/location" bean="${pcmInstance?.location}" var="locationInstance" model="[mode:'edit',hideList:['mainplace','suburb','township','description','longlat'],jsCallback:'onChangeLoadOffices']"></g:render>
</fieldset>
<br/>

<fieldset><legend>CASE</legend>

<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="pcm.description.label" default="Description" />
		
	</label>
	<g:textArea name="description">${pcmInstance?.description}</g:textArea>
	
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'referredBy', 'error')} ">
	<label for="referredBy">
		<g:message code="pcm.referredBy.label" default="Referred By" />
		
	</label>
	<g:textField name="referredBy" value="${pcmInstance?.referredBy}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: pcmInstance, field: 'referredTo', 'error')} ">
	<label for="referredTo">
		<g:message code="pcm.referredTo.label" default="Currently Referred To" />		
	</label>
	<span class="properties-value" id='current-referto-office'>${pcmInstance?.referredTo}</span>
	<span class="properties-value" id='selected-referto-office'></span>
</div>
	<h1>Refer To: </h1>
	<g:hiddenField name="referredTo" id="office" value="${pcmInstance?.referredTo?.id}"/>
	<table class="dataTable" id="office-list">
		<thead><tr><th></th><th>Office</th><th>Province</th><th>Main Place</th><th>Village</th><th>Contact Details</th></tr></thead>
		<tbody id="officebody">
		
		</tbody>
	</table>

</fieldset>

<script type="text/javascript">
$(document).ready(function(){

	$("#office-list").on("click","input[name='offices']:radio",function() {
		var _fieldEl = $("#office");
		_oldvalue = _fieldEl.prop("value");
		var value = $("input[name='offices']:radio:checked").val();
		_fieldEl.prop("value",value);
		if(value != _oldvalue){
			var officename = $("#office-name-" + value).text()
			$("#current-referto-office").css("text-decoration","line-through")
			$("#selected-referto-office").html("<span class='r-arrow'></span> " + officename)
		}
	}); 
})
function loadOffices(actionUrl, params, dspEl){
	wait(true)
	 $.ajax({  
			   type: "post",  
				  url: actionUrl,
				  data: params,
				  timeout: 120000,  //20 sec
			   // callback handler that will be called on error
		        error: function(jqXHR, textStatus, errorThrown){
	            // log the error to the console	 		            		           
      			// console.log("The following error occured: "+ textStatus, errorThrown);
      			wait(false)
				 if(textStatus=="timeout") dspEl.html("Timeout: please try again."); else dspEl.html(textStatus + ": " + errorThrown);
				 		
    				},		
			   success: function(result) {  
			   		var rows = ""
				   	$.each(result, function(i,o){
					   	//!$.isEmptyObject(result)
				   		//console.log("i = " + i + " : > office name:  " + o.name);	
				   		rows += "<tr>"
						rows += "<td><input type='radio' name='offices' value='" + o.id + "'/></td>"
						rows += "<td id='office-name-" + o.id + "' >" + o.name + "</td>"
						rows += "<td>" + o.location.region + "</td>"
						rows += "<td>" + o.location.mainplace + "</td>"
						rows += "<td>" + o.location.suburb + "</td>"
						rows += "<td>&raquo; Tel: " + o.contact_number + "<br/>&raquo; Email: " + o.email + " <br/>&raquo; Cell: " + o.cell_number +"</td>"
						rows += "</tr>"
					});
					dspEl.html(rows)
			 		wait(false)
					},
				// callback handler that will be called on completion
			        // which means, either on success or error
		        complete: function(){
   				
			    }

		 });  
}

function onChangeLoadOffices(data,combobox_id,refresh,subfields,defaultValue){
	//only start searching when the options for municipality or mainplace have been returned 
	if(combobox_id == "mainplace_options" || combobox_id=="muni_options"){
		var params = "country=" + $("#country").val() 
			+ "&region=" +  $("#region").val() 
			+ "&district=" +  $("#district_options").val() 
			+ "&municipality=" +  $("#muni_options").val() 
			//+ "&mainplace=" +  $("#mainplace_options").val()
		var _link = "${g.createLink(controller: 'office', action: 'search')}";
		loadOffices(_link,params,$("#officebody"))
	}
}
function setDivValue(id,value){
	if($(id)) $(id).html(value)
}
function wait(flag) { var el = $(".wait"); if (flag) el.show(); else el.hide(); }
</script>
