
<%@ page import="com.cbc.Office" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'office.label', default: 'Office')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head"></g:render>
	</head>
	<body>
		<a href="#list-office" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					here edit...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default=""></g:sideMenu> 
		</div>
		<div id="list-office" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'office.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="code" title="${message(code: 'office.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'office.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="contactNumber" title="${message(code: 'office.contactNumber.label', default: 'Contact Number')}" />
					
						<g:sortableColumn property="cellphoneNumber" title="${message(code: 'office.cellphoneNumber.label', default: 'Cellphone Number')}" />
					
						<g:sortableColumn property="faxNumber" title="${message(code: 'office.faxNumber.label', default: 'Fax Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${officeInstanceList}" status="i" var="officeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${officeInstance.id}">${fieldValue(bean: officeInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: officeInstance, field: "code")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "contactNumber")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "cellphoneNumber")}</td>
					
						<td>${fieldValue(bean: officeInstance, field: "faxNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${officeInstanceCount ?: 0}" />
			</div>
		</div>
		<script>
			$(document).ready(function() {		
				$("#accordion" ).accordion({ active: cbc_params.active_sidebar() });
			
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
			});  
		</script>		
	</body>
</html>
