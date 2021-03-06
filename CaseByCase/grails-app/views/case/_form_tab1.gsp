<%@ page import="com.cbc.Case" %>

<fieldset><legend>CLIENTS</legend>
	<div class="table">
		<div class="row">
			<div class="cell"><label id=""><g:message code="case.totalFemale.label" default="Total Female" /> </label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:field name="totalFemale" type="number" value="${caseInstance.totalFemale}" required=""/>
				</span>
			</div>
			<div class="cell"><label id="" for="clients"><g:message code="case.clients.label" default="Client(s)" /> </label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">			
					<input id="person-clients" name="client_select" value=""/>	
				</span>
				<a href="#" onclick="addPersonClient('${caseInstance?.id}');return false">New Client</a>
				<br/>
				<div id="current-person-clients"><b>Client List:</b> <br/>
					<g:each var="c" in="${caseInstance?.clients }" status="i">
						<div id="person-${c.id }-label" class='person-entry-label'>
							<img src="${resource(dir: 'images/skin', file: 'icon_delete.png')}" onclick="removeClient('person-${c.id}')" class="entry-rm"/>
							${ c.firstLastName } | Gender: ${c.gender } 
						</div>
					</g:each>
				</div>
				<select id="clients" multiple="multiple" name="clients" class="hide">
				<g:each var="c" in="${caseInstance?.clients }" status="i">
					<option id="person-${c.id }" selected='selected' value="${c.id }"></option>
				</g:each>
				</select>
				
			</div>
		</div>
		<div class="row">
			<div class="cell">
				<label for="totalMale">
					<g:message code="case.totalMale.label" default="Total Male" />
					<span class="required-indicator">*</span>
				</label>	
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:field name="totalMale" type="number" value="${caseInstance.totalMale}" required=""/>
				</span>
			</div>
			<div class="cell"><label id="" for="orgclients"><g:message code="case.orgclients.label" default="Org Clients" /> </label></div>
			<div class="cell">			
				<span class="property-value" aria-labelledby="office-label">			
					<input id="org-clients" name="org_client_select" value=""/>	
				</span>
				<a href="#" onclick="addOrgClient('${caseInstance?.id}');return false">New Organisation</a>
				<br/>
				<div id="current-org-clients"><b>Organisation List:</b> <br/>
					<g:each var="c" in="${caseInstance?.orgclients }" status="i">
						<div id="org-${c.id }-label" class='org-entry-label'>
							<img src="${resource(dir: 'images/skin', file: 'icon_delete.png')}" onclick="removeClient('org-${c.id}')" class="entry-rm"/>
							${ c.name } | Member: ${c.isMember } 
						</div>
					</g:each>
				</div>
				<select id="orgclients" multiple="multiple" name="orgclients" class="hide">
					<g:each var="c" in="${caseInstance?.orgclients }" status="i">
						<option id="org-${c.id }" selected='selected' value="${c.id }"></option>
					</g:each>
				</select>
			</div>
			
		</div>
		<div class="row">
			<div class="cell">
				<label for="totalUnknown">
					<g:message code="case.totalUnknown.label" default="Total Unknown" />
					<span class="required-indicator">*</span>
				</label>	
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:field name="totalUnknown" type="number" value="${caseInstance.totalUnknown}" required=""/>
				</span>
			</div>
			
		</div>		
		
	</div>

</fieldset>

<fieldset><legend>CASE DETAILS</legend>
	<div class="table">
		<div class="row">
			<div class="cell">
				<label for="subject">
					<g:message code="case.subject.label" default="Subject" />		
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:textField name="subject" required="" value="${caseInstance?.subject}"/>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="cell"> 
			 	<label for="caseNumber">
					<g:message code="case.casenumber.label" default="Case Number" />		
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:textField name="caseNumber" value="${caseInstance?.caseNumber}" required=""/>
				</span>
			</div>
		</div>

		<div class="row">
			<div class="cell">
				<label for="dateOpen">
					<g:message code="case.dateOpen.label" default="Date Open" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:datePicker name="dateOpen" precision="day"  value="${caseInstance?.dateOpen}"  relativeYears="[-10..0]"/>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="cell">
				<label for="problemStart">
					<g:message code="case.problemStart.label" default="Problem Start" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:datePicker name="problemStart" precision="day"  value="${caseInstance?.problemStart}" relativeYears="[-10..0]"/>
				</span>
			</div>
		</div>
		
		<div class="row">
			<div class="cell">
				<label for="description">
					<g:message code="case.description.label" default="Description" />
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:textArea name="description" value="${caseInstance?.description}" required="" rows="5" cols="40"/>
				</span>
			</div>
		</div>
		
		<div class="row">
			<div class="cell">
				<label for="priority">
					<g:message code="case.priority.label" default="Priority" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:select id="priority" name="priority.id" from="${com.cbc.CasePriority.list()}" optionKey="id" required="" value="${caseInstance?.priority?.id}" class="many-to-one" noSelection="['': '-select one-']"/>
				</span>
			</div>
		</div>
	</div>
</fieldset>

<fieldset><legend>CATEGORISATION</legend>
	<div class="table">		
		
		<div class="row">
			<div class="cell">
				<label for="childHeadedHouse">
					<g:message code="case.childHeadedHouse.label" default="Child Headed Household?" />		
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:checkBox name="childHeadedHouse" value="${caseInstance?.childHeadedHouse}" />
				</span>
			</div>
		</div>

		<div class="row">	
			<div class="cell">
				<label for="specialCase">
					<g:message code="case.specialCase.label" default="Special Case" />		
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:checkBox name="specialCase" value="${caseInstance?.specialCase}" />
				</span>
			</div>
		</div>
		
		<div class="row">	
			<div class="cell">
				<label for="status">
					<g:message code="case.status.label" default="Status" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:select id="status" name="status.id" from="${com.cbc.CaseStatus.list()}" optionKey="id" required="" value="${caseInstance?.status?.id}" class="many-to-one" noSelection="['': '-select one-']"/>
				</span>
			</div>
		</div>
	</div>
	<br/>
	<div class="table">
		<div class="row">
			<div class="cell"><h3>Category Options</h3></div>
			<div class="cell" style="text-align:center"><h3>Selected Categories</h3></div>
		</div>
		<div class="row">
			<div class="cell">		
					
					<div id="category_tree" style="border-right:solid 1px #000;padding-right:15px;"></div>
			</div>
			
			<div class="cell">
												
				<div id="categories" style="padding-right:15px;padding-left:15px;">
				 <g:if test="${caseInstance?.categories?.size() < 1 }"><p>No Selection Made Yet!</p></g:if>
					<g:each var="c" in="${caseInstance?.categories }" status="i">
						&raquo; ${c.name }
						<span class="hide"><input name="categories" checked="checked" id="category-${c.id }" value="${c.id }"></input></span><br/>
					</g:each>
				</div>
			</div>
		</div>
	</div>
	
</fieldset>

<fieldset><legend>OFFICE ADMIN</legend>
	<div class="table">
		<div class="row">
			<div class="cell">
				<label for="office">
					<g:message code="case.office.label" default="Office" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:hiddenField id="office" name="office.id" value="${(caseInstance?.office?caseInstance?.office?.id : cbcApiService?.getUserPrimaryOffice()?.id)}" />
					<span>
						${(caseInstance?.office ? caseInstance?.office : cbcApiService?.getUserPrimaryOffice())}
					</span>
<%--					<g:select id="office" name="office.id" from="${cbcApiService?.getUserAllowedOffices()}" optionKey="id" required="" value="${(caseInstance?.office?.id:caseInstance?.assignedTo?.id ? cbcApiService?.getUserPrimaryOffice()?.id)}" class="many-to-one" noSelection="['null': '-select one-']"/>--%>
				</span>
			</div>
			<div class="cell"><label id="">Case worker</label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:select optionValue="fullname" id="assignedTo" name="assignedTo.id" from="${cbcApiService?.getCaseWorkers(caseInstance?.office,params)}" optionKey="id" required="" value="${caseInstance?.assignedTo?.id}" class="many-to-one" noSelection="['': '-select one-']"/>
				</span>
			</div>
		</div>
		<div class="row">	
			<div class="cell"><label id="">Case respondent</label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:textArea name="respondent">${caseInstance?.respondent }</g:textArea>
				</span>
			</div>
			<div class="cell"></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					
				</span>
			</div>
		</div>
	</div>
</fieldset>

<script>
function removeClient(id){
	  $("#" + id).remove();
	  $("#" + id + "-label").remove();
}
function addPersonClient(_id){
  	 var $dialog = $('<div><div id="wait" style="font-weight:bold;text-align:center;">Loading...</div></div>')             
                .load('${g.createLink(controller: 'person', action: 'dialogcreate',params:[caseid:_id])}')
                
                .dialog({
                	modal:true,
                    autoOpen: false,
                    dialogClass: 'no-close',
                    width:800,
                    beforeClose: function(event,ui){
                    	
                    },
                    buttons:{
                        "DONE":function(){
                      	 // location.reload();
                         	 $(this).dialog('close')
                            },
                         "CANCEL":function(){
                      	   $(this).dialog('close')
                             }
                       },
                    close: function(event,ui){
                  	  $(this).dialog('destroy').remove()
                  	  //location.reload();
                    },
                    position: {my:"top",at:"top",of:window},
                    title: 'New Person Client'                         
                });
                    
                $dialog.dialog('open');
                
  } //end function addPersonClient()
  function addOrgClient(_id){
	  	var _link = "${g.createLink(controller: 'organisation', action: 'dialogcreate')}";
	  	 var $dialog = $('<div><div id="wait" style="font-weight:bold;text-align:center;">Loading...</div></div>')             
	                .load(_link)     
	                .dialog({
	                	modal:true,
	                    autoOpen: false,
	                    dialogClass: 'no-close',
	                    width:800,
	                    beforeClose: function(event,ui){
	                    	
	                    },
	                    buttons:{
	                        "DONE":function(){
	                      	  //location.reload();
		                      	  $(this).dialog('close')
	                            },
	                         "CANCEL":function(){
	                      	   $(this).dialog('close')
	                             }
	                       },
	                    close: function(event,ui){
	                  	  $(this).dialog('destroy').remove()
	                  	  //location.reload();
	                    },
	                    position: {my:"top",at:"top",of:window},
	                    title: 'New Organisation Client'                         
	                });
	                    
	                $dialog.dialog('open');
	                
	  } //end function addPersonClient()
	  function addCaseCategory(_id){
		  	var _link = "${g.createLink(controller: 'category', action: 'dialogList')}";
		  	 var $dialog = $('<div><div id="wait" style="font-weight:bold;text-align:center;">Loading...</div></div>')             
		                .load(_link)     
		                .dialog({
		                	modal:true,
		                    autoOpen: false,
		                    dialogClass: 'no-close',
		                    width:800,
		                    beforeClose: function(event,ui){
		                    	
		                    },
		                    buttons:{
		                        "DONE":function(){
		                      	  //location.reload();
			                      	  $(this).dialog('close')
		                            },
		                         "CANCEL":function(){
		                      	   $(this).dialog('close')
		                             }
		                       },
		                    close: function(event,ui){
		                  	  $(this).dialog('destroy').remove()
		                  	  //location.reload();
		                    },
		                    position: {my:"top",at:"top",of:window},
		                    title: 'Category Selection'                         
		                });
		                    
		                $dialog.dialog('open');
		                
		  } //end function addCaseCategory()
  $(document).ready(function() {
	  
	//** PERSON CLIENT Auto Complete Call **//
		 $.widget( "custom.catcomplete", $.ui.autocomplete, {
			_create: function() {
				this._super();
				this.widget().menu( "option", "items", "> :not(.ui-autocomplete-category)" );
			},
			_renderMenu: function( ul, items ) {
				var that = this,
				currentCategory = "";
				$.each( items, function( index, item ) {
					var li;
					if ( item.category != currentCategory ) {
						ul.append( "<li class='ui-autocomplete-category'>" + item.category + "</li>" );
						currentCategory = item.category;
					}
					li = that._renderItemData( ul, item );
					if ( item.category ) {
						li.attr( "aria-label", item.category + " : " + item.label );
					}
				});
			}
		});
		$( "#person-clients" ).catcomplete({
			source: function(request,response) {
				$.ajax({
					url : "${g.createLink(controller: 'person', action: 'personlist')}", 
					dataType: "json",
					data : request,
					success : function(data) {
						response(data); // set the response
					},
					error : function() { // handle server errors
						alert("Unable to retrieve records");
					}
				});
			},
			minLength : 1, // triggered only after minimum 2 characters have been entered.
			select : function(event, ui) { // event handler when user selects a company from the list.
				var _id = ui.item.id;
				var _img = '${resource(dir: 'images/skin', file: 'icon_delete.png')}';
				$("#current-person-clients").append("<div id='person-" + _id + "-label' class='person-entry-label'><img src='" + _img + "' onClick='removeClient(\"person-" + _id + "\")' class='entry-rm'/>" + ui.item.person.firstName + " " + ui.item.person.lastName + " Gender: " + ui.item.person.gender + "</div>")
				$("#clients").append("<option id='person-" + _id + "' selected='selected' value='" + ui.item.value + "'></option>")
				ui.item.value = ""
			}
		});

		
		//** ORGANISATION CLIENT Auto Complete Call **//
	
		$( "#org-clients" ).catcomplete({
			source: function(request,response) {
				$.ajax({
					url : "${g.createLink(controller: 'organisation', action: 'orglist')}", // remote datasource
					dataType: "json",
					data : request,
					success : function(data) {
						response(data); // set the response
					},
					error : function() { // handle server errors
						alert("Unable to retrieve items");
					}
				});
			},
			minLength : 1, // triggered only after minimum 2 characters have been entered.
			select : function(event, ui) { // event handler when user selects a company from the list.
				var _id = ui.item.id;
				var _img = '${resource(dir: 'images/skin', file: 'icon_delete.png')}';
				$("#current-org-clients").append("<div id='org-" + _id + "-label' class='org-entry-label'><img src='" +_img+ "' onClick='removeClient(\"org-" + _id + "\")' class='entry-rm'/>" + ui.item.org.name + " Member: " + ui.item.org.isMember + "</div>")
				$("#orgclients").append("<option id='org-" + _id + "' selected='selected' value='" + ui.item.value + "'></option>")
				ui.item.value = ""
			}
		});

		//Categories jsTree
		$('#category_tree').jstree({
			"core" : {
		    	"multiple" : true,
		    	"animation" : 0,		    	
		    	'data' : {
		    	    'url' :"${resource()}/category/ajaxNodeChildren?parentid=1",
		    	    'data' : function (node) {
		    	      		return { 'id' : node.id };
		    	 		}
		  		}
			},
				"plugins" : ["checkbox","sort"]
		});
	    // bind to events triggered on the tree
	    $('#category_tree').on("changed.jstree", function (e, data) {
	   		  var holder = $("#categories");
		      holder.html("");
		      var _count = data.selected.length;
		      if(_count < 1){
		      	holder.html("<br/><p>No Selection Made Yet!</p>")
		      }
		      for(i = 0, j = _count; i < j; i++) {
			      	_id = data.selected[i];
			    	_node = data.instance.get_node(data.selected[i])
			    	_text = _node.text
			    	_root_parent_name = _node.original.root_parent_name;
				    holder.append(" &raquo; " + _text + "<span class='hide'> <input class='hide' name='categories' type='checkbox' id='category-" + _id + "' checked='true' value='" + _id + "'>" + _text + "</input></span><br/>")				    
		      }
		      //open any related tabs
		      _root_parent_name = _node.original.root_parent_name;
		      onSelectCategory(_root_parent_name)
	    });
	    $('#category_tree').on("loaded.jstree", function (e, data) {
	    	//loop thru the selected cateories checkboxes and set the jstree node
	    	var _tree = $('#category_tree')
	    	// _tree.jstree('close_all')
	    	var values = getCheckedValues("categories", "v",":hidden")
	    	var _id = "";

	    	for(var i=0;i<values.length;i++){
	    		_id = values[i];
	    	 	_tree.jstree('select_node', _id);
	    	}
	    	 _root_parent_name = '${categoryInstance?.getRootParentName()}';
		    //  onSelectCategory(_root_parent_name)
		      onCaseStatusChange("#tabs","#tab-2", 3)		      
	    });
	    
	    //form events:
	    //** on status change, open/hide the outcome tab
	    $("#status").on("change",function(e){
	    	onCaseStatusChange("#tabs","#tab-2", 3)	    	
	    });
	   
  });

</script>



















