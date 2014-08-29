<%@ page import="com.cbc.User" %>
<!-- *** START TABS *** -->
<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Details</a></li>
					<li><a href="#tab-2">Personal Details</a></li>		
				</ul>
		<div id="tab-1">
		<fieldset><legend>Login Details</legend>
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
				<label for="username">
					<g:message code="user.username.label" default="Username" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="username" required="" value="${userInstance?.username}"/>
			</div>
	
			<g:if test="${params?.action == 'create'||params?.action == 'save'}">
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="password">
						<g:message code="user.password.label" default="Password" />
						<span class="required-indicator">*</span>
					</label>
					<g:field type="password" name="password" required="" value="${userInstance?.password}"/>
				</div>
				<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
					<label for="passwordConfirm">
						<g:message code="user.passwordconfirm.label" default="Confirm Password" />
						<span class="required-indicator">*</span>
					</label>
					<g:field type="password" name="passwordConfirm" required="" value=""/>
				</div>
			</g:if>
					
	
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
				<label for="email">
					<g:message code="user.email.label" default="Email" />
					<span class="required-indicator">*</span>
				</label>
				<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
			</div>
			
			
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
				<label for="enabled">
					<g:message code="user.enabled.label" default="Enabled" />
					
				</label>
				<g:checkBox name="enabled" value="${userInstance?.enabled}" />
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
				<label for="accountExpired">
					<g:message code="user.accountExpired.label" default="Account Expired" />
					
				</label>
				<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
				<label for="accountLocked">
					<g:message code="user.accountLocked.label" default="Account Locked" />
					
				</label>
				<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
			</div>
			
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
				<label for="passwordExpired">
					<g:message code="user.passwordExpired.label" default="Password Expired" />
					
				</label>
				<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
			</div>
		</fieldset>			
		
		<fieldset><legend>Personal Details</legend>
			<div class="table">
				<div class="row"><div class="cell"><label id="" for="clients"><g:message code="case.clients.label" default="Find a Person" /> </label></div>
					<div class="cell">
						<span class="property-value" aria-labelledby="office-label">			
							<input id="person-clients" name="client_select" value=""/>	
							<g:hiddenField id="personid" name="person.id" value="${(params.action=='create'?params?.person?.id:userInstance?.person?.id)}"/>
						</span>	
					</div>
				</div>
				<div class="row">
					<div class="cell"><label for="person.firstName"><g:message code="person.firstName.label" default="First Name" /></label></div>
					<div class="cell"><g:textField name="person.firstName" required="" value="${userInstance?.person?.firstName}"/></div>
					<div class="cell">
						<label for="person.gender"><g:message code="person.gender.label" default="Gender" /></label>
					</div>
					<div class="cell">
						<g:select name="person.gender" required="" from="${com.cbc.Person.constraints.gender.inList}" value="${userInstance?.person?.gender}" valueMessagePrefix="person.gender" noSelection="['': '']"/>
					</div>
				</div>
				<div class="row">
					<div class="cell"><label for="person.lastName"><g:message code="person.lastName.label" default="Last Name" />	</label></div>
					<div class="cell"><g:textField name="person.lastName" required="" value="${userInstance?.person?.lastName}"/></div>
					<div class="cell"><label for="person.race"><g:message code="user.race.label" default="Race" /></label></div>
					<div class="cell"><g:select name="person.race.id" required="" from="${com.cbc.Race.list()}" optionKey="id" value="${userInstance?.person?.race?.id}"  noSelection="['': '']"/></div>
				</div>
				<div class="row">
					<div class="cell"><label for="office"><g:message code="person.office.label" default="Office" /><span class="required-indicator">*</span></label></div>
					<div class="cell"><g:select id="office" name="person.office.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${userInstance?.person?.office?.id}" class="many-to-one"/></div>
					<div class="cell"></div>
					<div class="cell"></div>
				</div>				
			</div>
		</fieldset>
		
		<fieldset><legend>Access Rights</legend>
			<g:render template="editRoles" />
			<div>
				<table id="groups-table">
				<thead>
					<tr>
						<th></th>
						<g:sortableColumn property="name" title="${message(code: 'roleGroup.name.label', default: 'Group Name')}" />					
						<g:sortableColumn property="description" title="${message(code: 'roleGroup.description.label', default: 'Description')}" />					
					</tr>
				</thead>
				<tbody id="groups-list">
				<g:each in="${userInstance?.person?.office?.officeGroups}" status="i" var="roleGroupInstance">
					<g:set var="isRoleChecked" value="false" />
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:checkBox name="${roleGroupInstance?.name}" id="${roleGroupInstance.id}" checked="${isRoleChecked}" label=""/></td>
						<td><g:link controller="roleGroup" action="show" id="${roleGroupInstance.id}">${fieldValue(bean: roleGroupInstance, field: "name")}</g:link></td>					
						<td>${fieldValue(bean: roleGroupInstance, field: "description")}</td>					
					</tr>
				</g:each>
				</tbody>
				</table>
			</div>
		</fieldset>
	</div>
	
	<div id="tab-2">
		
	</div> <!-- End tab 2 -->
</div>	<!--  *** END TABS *** -->	

<script type="text/javascript">
<!--  
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
		minLength : 2, // triggered only after minimum 2 characters have been entered.
		select : function(event, ui) { // event handler when user selects a company from the list.
			var _id = ui.item.id;
			var _firstname = ui.item.person.firstName
			var _lastname = ui.item.person.lastName
			var _gender = (ui.item.person.gender == null ? null : ui.item.person.gender)
			var _raceid = (ui.item.person.race == null ? null : ui.item.person.race.id)
			var _officeid = (ui.item.person.office  == null ? null : ui.item.person.office.id)
			var _officegrps = (ui.item.officegroups == null?null:ui.item.officegroups)
			var _usergrps = (ui.item.usergroups == null?null:ui.item.usergroups)
			 //ui.item.person.firstName + " " + ui.item.person.lastName + " Gender: " + ui.item.person.gender
			$("#personid").prop("value",_id)
			$("input[name='person.firstName']").prop("value",_firstname) 
			$("input[name='person.lastName']").prop("value",_lastname)
			if(_gender) $("select[name='person.gender'] option[" + _gender + "]").prop("selected","selected")
			if(_raceid != null) $("select[name='person.race.id'] option[" + _raceid + "]").prop("selected","selected")
			if(_officeid != null) $("select[name='person.office.id'] option[" + _officeid + "]").prop("selected","selected")
			
			//update the groups list base on the office selected
			if(_officegrps != null){
				var tbody = $("#groups-list");
				tbody.html = "";
				tbody.append("<tr><td></td><td>My Group</td><td>description</td>");					
			}
			ui.item.value = ""
		}
	});
});
//-->
</script>

		
	
				
