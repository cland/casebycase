
<%@ page import="com.cbc.Office" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_ADMIN}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
		<g:javascript library="jquerygrid" />
		<link rel="stylesheet" href="/cbc/css/ui.jqgrid.css" type="text/css">
	</head>
	<body>
		<a href="#show-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					Office: ${officeInstance?.name }
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-office" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- *** START TABS *** -->
			<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Details</a></li>
					<li><a href="#tab-2">Staff</a></li>		
					<li><a href="#tab-3">Cases</a></li>
					<li><a href="#tab-4">Access Rights</a></li>
					<li><a href="#tab-5">Supporting Documents</a></li>
					<li><a href="#tab-admin">Admin</a></li>
				</ul>
				<div id="tab-1">
					<fieldset><legend>OFFICE SETUP</legend>
					<div class="table">
							<div class="row">
								<div class="cell"><label><g:message code="office.name.label" default="Name" /></label></div>
								<div class="cell"><span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${officeInstance}" field="name"/></span></div>
							</div>
							<div class="row">
								<div class="cell"><label id="code-label"><g:message code="office.code.label" default="Code" /></label></div>
								<div class="cell"><span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${officeInstance}" field="code"/></span></div>
							</div>
							<div class="row">
								<div class="cell"><label id="status-label"><g:message code="office.status.label" default="Status" /></label></div>
								<div class="cell"><span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${officeInstance}" field="status"/></span></div>
							</div>
							
							<div class="row">
								<div class="cell"><label id="affiliates-label"><g:message code="office.affiliates.label" default="Affiliates" /></label></div>
								<div class="cell">
									<g:each in="${officeInstance.affiliates}" var="a">
										<span class="property-value" aria-labelledby="affiliates-label"><span class="r-arrow"></span> <g:link controller="organisation" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span><br/>
									</g:each>
								</div>
							</div>

					</div>
					</fieldset>
					<br/>
					<fieldset><legend>CONTACT DETAILS</legend>
						<div class="row">
							<div class="cell"><label id="contactNumber-label" ><g:message code="office.contactNumber.label" default="Contact Number" /></label></div>
							<div class="cell"><span class="property-value" aria-labelledby="contactNumber-label"><g:fieldValue bean="${officeInstance}" field="contactNumber"/></span></div>
						</div>
						<div class="row">
							<div class="cell"><label id="cellphoneNumber-label"><g:message code="office.cellphoneNumber.label" default="Cellphone Number" /></label></div>
							<div class="cell"><span class="property-value" aria-labelledby="cellphoneNumber-label"><g:fieldValue bean="${officeInstance}" field="cellphoneNumber"/></span></div>
						</div>
						<div class="row">
							<div class="cell"><label id="faxNumber-label"><g:message code="office.faxNumber.label" default="Fax Number" /></label></div>
							<div class="cell"><span class="property-value" aria-labelledby="faxNumber-label"><g:fieldValue bean="${officeInstance}" field="faxNumber"/></span></div>
						</div>
						<div class="row">
							<div class="cell"><label id="email-label"><g:message code="office.email.label" default="Email" /></label></div>
							<div class="cell"><span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${officeInstance}" field="email"/></span></div>
						</div>
					</fieldset>
										
					<fieldset><legend>GEOGRAPHICAL LOCATION</legend>
							<g:render template="../layouts/location" bean="${officeInstance?.location}" var="locationInstance" model="[mode:'read']"></g:render>
					</fieldset>
				</div>
				
				<div id="tab-2">
					<%-- STAFF LIST--%>
					<div id="staff_grid" style="padding: 5px;">
						<table id="staff_list" class="scroll jqTable"></table>
						<!-- pager will hold our paginator -->
						<div id="staff_list_pager" class="scroll" style="text-align: center;"></div>
					</div>
				</div>
				<div id="tab-3">
					<%-- Cases --%>
					
					<div id="case_grid" style="padding: 5px;">
						<table id="case_list" class="scroll jqTable"></table>
						<!-- pager will hold our paginator -->
						<div id="case_list_pager" class="scroll" style="text-align: center;"></div>
					</div>
				</div>
				<div id="tab-4">
					<br/><h1>Groups</h1>
					<div>
						<table>
						<thead>
							<tr>
							
								<g:sortableColumn property="name" title="${message(code: 'roleGroup.name.label', default: 'Name')}" />
							
								<g:sortableColumn property="description" title="${message(code: 'roleGroup.description.label', default: 'Description')}" />
							
							</tr>
						</thead>
						<tbody>
						<g:each in="${officeInstance?.officeGroups}" status="i" var="roleGroupInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
							
								<td><g:link controller="roleGroup" action="show" id="${roleGroupInstance.id}">${fieldValue(bean: roleGroupInstance, field: "name")}</g:link></td>
							
								<td>${fieldValue(bean: roleGroupInstance, field: "description")}</td>
							
							</tr>
						</g:each>
						</tbody>
						</table>
					</div>
				</div>
				<div id="tab-5">
					<!-- Supporting documents -->
						<div id="attachments" class="attachments">
							<attachments:each bean="${officeInstance}" status="i">	
							<div class="photo-display float-left">
							<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
								<img src="${resource(dir:'images/icons',file:'attach.png',plugin:'famfamfam')}" />			
								<attachments:downloadLink attachment="${attachment}" inline="false" withContentType="false" />
								${attachment.niceLength}
								<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
									returnPageURI="${createLink(action:'show', id:officeInstance.id,absolute:true)}" />
							</div>	
								<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
							
							</attachments:each>
							<div style="clear:both"></div>
						</div>
				</div>
				<div id="tab-admin">
					<%--Admin Tracking Info--%>
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:officeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${officeInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
					<g:link class="add" controller="user" action="create" params="['office.id': officeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'case.label', default: 'Staff')])}</g:link>
					<g:link class="add" controller="case" action="create" params="['office.id': officeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'case.label', default: 'Case')])}</g:link>
					
				</fieldset>
			</g:form>
		</div>
		
		<script>
			$(document).ready(function() {
				
				/** ACCORDION MENU **/		
				$("#accordion" ).accordion({ active: cbc_params.active_sidebar() });

				/** TABS **/
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

				/** GRID **/
				centerForm = function ($form) {
		                    $form.closest('div.ui-jqdialog').position({
		                        my: "center"
		                    });
		                };		             
  
              //initialize the staffgrid 
			jQuery("#" + cbc_params.staff_maingrid_id).jqGrid({
			      url:cbc_params.staff_list_url,
			      editurl:cbc_params.staff_edit_url,
			      autowidth: true,
			     
			      height:"100%",
			      datatype: "json",
			      colNames:['Name','Role(s)','Login Name','id','<input style="display:none" class="edit" type="button" name="Add_Staff" onClick="return false;addStaffRow(\''+cbc_params.thisId+'\',\''+cbc_params.staff_maingrid_id+'\');" id="staff_add" value=""/>'],
			      colModel:[
			        {name:'fullname', editable:false},						        
			        {name:'roles', editable:false,  width:300},
			        {name:'username', editable:false},					             
			        {name:'id',hidden:true},
			        {name:'act',index:'act', width:150,sortable:false,search:false}
			       // {name:'modid',index:'modid',editable:true, hidden:true,sortable:false,search:false,editoptions:{defaultValue:cbc_params.thisId}}
			     ],
			     rowNum:20,
			     rowList:[10,20,30,40,50,100],
			     multiselect: false,
			    pager: jQuery('#' + cbc_params.staff_maingrid_id_pager),
			    viewrecords: true,
			    gridview: true,
			  // 	postData:{id:cbc_params.thisId},
			    cellEdit:false,
			    cellsubmit: 'remote',
			   	cellurl:cbc_params.staff_maingrid_edit_url,					   
			    subGrid : false,
			    gridComplete: function(){ 
			        var ids = jQuery("#" + cbc_params.staff_maingrid_id).jqGrid('getDataIDs'); 
			        
			        for(var i=0;i < ids.length;i++)
			            { 
			            	var cl = ids[i]; 
				          
				            rs = "<input class='view' style='height:22px;width:80px;' type='button' value='Details' onclick=\"viewResults('"+cl+"','"+cbc_params.staff_maingrid_id+"');\" />";
				            rm = "<input class='edit' style='height:22px;width:80px;' type='button' value='Remove' onclick=\"removeGridRow('"+cl+"','"+cbc_params.staff_maingrid_id+"');\" />";
				            jQuery("#" + cbc_params.staff_maingrid_id).jqGrid('setRowData',ids[i],{act:rs+rm}); //be+se+ce+de forall actions 
			            }
			        if(cbc_params.canEdit) $(".edit").show(); else  $(".edit").hide();
			        if(cbc_params.canEdit) $(".delete").show(); else  $(".delete").hide();
			    } 
			    }).navGrid('#' + cbc_params.staff_maingrid_id_pager,
			            {add:false,edit:false,del:false,search:false,refresh:true}, // which buttons to show?
			            {closeAfterEdit:true, afterSubmit:afterSubmitEvent,savekey:[true,13],afterShowForm: centerForm},  // edit options
			            {addCaption:'New Record',afterSubmit:afterSubmitEvent,savekey:[true,13],closeAfterEdit:false},  // add options            
			           {afterShowForm: centerForm}          // delete options
			        );
			  //  $("#" + cbc_params.staff_maingrid_id).jqGrid('filterToolbar',{autosearch:true});            
			});  

		
			
			/** helper functions **/
			 
			  function afterSubmitEvent(response, postdata) {  
					var success = true;
			  	  var display = $('#message'); 
			      var json = eval('(' + response.responseText + ')');
			      var message = json.message;

			      if(json.state == 'FAIL') {
			          success = false;
			          display.addClass("errors")
			      }else{
			    	  display.addClass("message")
			          }      
			        display.html(message);
			        display.show().fadeOut(10000);            
			      var new_id = json.id
			      return [success,message,new_id];
				}
					  function deleteGridRow(id,grid_id){
						  grid = $("#" + grid_id);
						  if (id!= null) grid.jqGrid('setSelection',id);
						  var gr = grid.jqGrid('getGridParam','selrow'); //if multi use: 'selarrrow'		      
					      if( gr != null && gr != "" )
					        grid.jqGrid('delGridRow',gr , {afterSubmit:afterSubmitEvent,height:250,width:650});
					      else
					        alert("Please Select Row to delete!");
						
					  }
					  function removeGridRow(id, grid_id){
					  
						 if (id!= null) jQuery('#' + grid_id).jqGrid('setSelection',id);
						  var gr = $("#" + grid_id).jqGrid('getGridParam','selrow'); //if multi use: 'selarrrow'
					      
					      if( gr != null && gr != "" )
					        $("#" + grid_id).jqGrid('delGridRow',gr , {afterSubmit:afterSubmitEvent,height:250,width:650});
					      else
					        alert("Please Select Row to delete!");
					}
					  
					  function viewResults(id,grid_id){
					  	document.location.href= "../../user/show/" + id
					  	
					  }
					  function addStaffRow(person_id, grid_id){
						 var _link = "${g.createLink(controller:'user',action:'create')}/persion.id=" + person_id;
					  	 var $dialog = $('<div></div>')			           				
			                        .load(_link)
			                        .dialog({
			                            autoOpen: false,
			                            width:350,
			                            beforeClose: function(event,ui){
			                            	
			                            },
			                            close: function(event){                                                     
			                            	$("#" + grid_id).trigger('reloadGrid')
			                            },
			                            title: 'New Staff'                         
			                        });
			                            
			                        $dialog.dialog('open');
					  }
					  function clearSelection(grid_id){jQuery('#' + grid_id).jqGrid('resetSelection'); }
			
		</script>	
		<g:render template="cases"/>
	</body>
</html>
