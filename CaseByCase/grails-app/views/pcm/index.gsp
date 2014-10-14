<%@ page import="com.cbc.SystemRoles" %>
<%@ page import="com.cbc.Pcm" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pcm.label', default: 'Please Call Me')}" />
		<title><g:appTitle title=""><g:message code="default.list.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#list-pcm" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					PCM List
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="list-pcm" class="content scaffold-list" role="main">
			
			<div class="page-header">
				<g:message code="default.list.label" args="['Please Call Me']" />
				<div class="action-div" ><g:link controller="pcm" action="create" >New PCM</g:link></div>
			</div>
			<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
				<fieldset><legend>UPLOAD PCM LIST</legend>
					<g:uploadForm action="upload">
					    <input type="file" name="filecsv" />
					    <input type="submit" />
					</g:uploadForm>
				</fieldset><br/>
			</sec:ifAnyGranted>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="dataTable">
			<thead>
					<tr>		
						<g:sortableColumn property="pcmDate" title="${message(code: 'pcm.pcmDate.label', default: 'Date')}" />	
						<th><g:message code="pcm.sender.label" default="Sender" /></th>								
						<g:sortableColumn property="name" title="${message(code: 'pcm.name.label', default: 'Name')}" />						
						<g:sortableColumn property="agegroup" title="${message(code: 'pcm.agegroup.label', default: 'Age Group')}" />
						<th><g:message code="pcm.referredTo.label" default="Referred To" /></th>
						<g:sortableColumn property="referredBy" title="${message(code: 'pcm.referredBy.label', default: 'Referred By')}" />
						<th></th>					
					</tr>
				</thead>
				<tbody>
				<g:each in="${pcmInstanceList}" status="i" var="pcmInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:formatDate date="${pcmInstance.pcmDate}" /></td>
						<td><g:link action="show" id="${pcmInstance.id}">${fieldValue(bean: pcmInstance, field: "sender")}</g:link></td>
						<td>${fieldValue(bean: pcmInstance, field: "name")}</td>
						<td>${fieldValue(bean: pcmInstance, field: "agegroup")}</td>
						<td>${fieldValue(bean: pcmInstance, field: "referredTo")}</td>
						<td>${fieldValue(bean: pcmInstance, field: "referredBy")}</td>
						<td class="action-column">
						<sec:ifAnyGranted roles="${SystemRoles.ROLE_PCM },${SystemRoles.ROLE_ADMIN }">
							<g:link action="edit" id="${pcmInstance.id}">
							<img src='${resource(dir: 'images/icons', file: 'page_edit.png', plugin: 'famfamfam')}'/>
							</g:link>
						</sec:ifAnyGranted>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pcmInstanceCount ?: 0}" />
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
