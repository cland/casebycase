
<%@ page import="com.cbc.Case" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'case.label', default: 'Case')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="sidenav-public" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#show-case" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					here edit...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="show-case" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<!-- *** START TABS *** -->
			<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Details</a></li>
					<li><a href="#tab-labour">Labour</a></li>
					<li><a href="#tab-evictions">Evictions</a></li>
					<li><a href="#tab-2">Outcome & Metrics</a></li>	
					<li><a href="#tab-3">Attachments</a></li>
					<li><a href="#tab-4">Actions</a></li>
					<li><a href="#tab-admin">Admin</a></li>
				</ul>
				<div id="tab-1"> 
				
				<fieldset><legend>CLIENTS</legend>
					<div class="table">
						<div class="row">
							<div class="cell"><label id="totalFemale-label"><g:message code="case.totalFemale.label" default="Total Female" /> </label></div>
							<div class="cell">
								<span class="property-value" aria-labelledby="totalFemale-label"><g:fieldValue bean="${caseInstance}" field="totalFemale"/></span>
							</div>
						</div>
						<div class="row">
							<div class="cell">
								<label id="totalMale-label">
									<g:message code="case.totalMale.label" default="Total Male" />							
								</label>	
							</div>
							<div class="cell">
								<span class="property-value" aria-labelledby="totalMale-label"><g:fieldValue bean="${caseInstance}" field="totalMale"/></span>
							</div>
						</div>
						<div class="row">
							<div class="cell">
								<label id="totalUnknown-label">
									<g:message code="case.totalUnknown.label" default="Total Unknown" />
								</label>	
							</div>
							<div class="cell">
								<span class="property-value" aria-labelledby="office-label">
									<span class="property-value" aria-labelledby="totalUnknown-label"><g:fieldValue bean="${caseInstance}" field="totalUnknown"/></span>
								</span>
							</div>
						</div>		
						<div class="row">
							<div class="cell">
								<label id="clients-label">
									<g:message code="case.clients.label" default="Clients" />								
								</label>
							</div>
							<div class="cell">
								<g:each in="${caseInstance.clients}" var="c">
									<span class="property-value" aria-labelledby="clients-label"><g:link controller="person" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
								</g:each>
							</div>
						</div>
						<div class="row">
							<div class="cell"><label id="orgclients-label"><g:message code="case.orgclients.label" default="Orgclients" /> </label></div>
							<div class="cell">
								<g:each in="${caseInstance.orgclients}" var="o">
									<span class="property-value" aria-labelledby="orgclients-label"><g:link controller="organisation" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
								</g:each>
							</div>
						</div>
					</div>
				</fieldset>
				<br/>
				<fieldset><legend>CASE DETAILS</legend>	
					<div class="table">
						<div class="row">
							<div class="cell"><label id="subject-label"><g:message code="case.subject.label" default="Subject" /></label></div>
							<div class="cell">
								<span class="property-value" aria-labelledby="subject-label"><g:fieldValue bean="${caseInstance}" field="subject"/></span>
							</div>
						</div>
						
						<div class="row">
							<div class="cell"><label id="caseNumber-label"><g:message code="case.caseNumber.label" default="Case Number" /></label></div>
							<div class="cell">
								<span class="property-value" aria-labelledby="caseNumber-label"><g:fieldValue bean="${caseInstance}" field="caseNumber"/></span>
							</div>
						</div>
						<div class="row">
							<div class="cell"><label id="dateOpen-label"><g:message code="case.dateOpen.label" default="Date Opened" /></label></div>
							<div class="cell"><span class="property-value" aria-labelledby="dateOpen-label"><g:formatDate date="${caseInstance?.dateOpen}" /></span></div>
						</div>
						<div class="row">
							<div class="cell"><label id="problemStart-label"><g:message code="case.problemStart.label" default="Problem Start" /></label></div>
							<div class="cell"><span class="property-value" aria-labelledby="problemStart-label"><g:formatDate date="${caseInstance?.problemStart}" /></span></span></div>
						</div>
						
						<div class="row">
							<div class="cell"><label id="description-label"><g:message code="case.description.label" default="Description" /></label></div>
							<div class="cell">
								<span class="property-value" aria-labelledby="description-label">
									<g:fieldValue bean="${caseInstance }" field="description"/>								
								</span>
							</div>
						</div>
						
					</div> <!-- End Div-Table -->
					<ol class="property-list case">
					<g:if test="${caseInstance?.priority}">
							<li class="fieldcontain">
								<span id="priority-label" class="property-label"><g:message code="case.priority.label" default="Priority" /></span>
								
									<span class="property-value" aria-labelledby="priority-label"><g:link controller="casePriority" action="show" id="${caseInstance?.priority?.id}">${caseInstance?.priority?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
					</ol>
					
				</fieldset>
				<br/>
				<fieldset><legend>CATEGORISATION</legend>

					<ol class="property-list case">
							
							<g:if test="${caseInstance?.childHeadedHouse}">
							<li class="fieldcontain">
								<span id="childHeadedHouse-label" class="property-label"><g:message code="case.childHeadedHouse.label" default="Child Headed House" /></span>
								
									<span class="property-value" aria-labelledby="childHeadedHouse-label"><g:formatBoolean boolean="${caseInstance?.childHeadedHouse}" /></span>
								
							</li>
							</g:if>
							
						
							<g:if test="${caseInstance?.specialCase}">
							<li class="fieldcontain">
								<span id="specialCase-label" class="property-label"><g:message code="case.specialCase.label" default="Special Case" /></span>
								
									<span class="property-value" aria-labelledby="specialCase-label"><g:formatBoolean boolean="${caseInstance?.specialCase}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.status}">
							<li class="fieldcontain">
								<span id="status-label" class="property-label"><g:message code="case.status.label" default="Status" /></span>
								
									<span class="property-value" aria-labelledby="status-label"><g:link controller="caseStatus" action="show" id="${caseInstance?.status?.id}">${caseInstance?.status?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>

						</ol>
					</fieldset>
					
				<fieldset><legend>OFFICE ADMIN</legend>
						<div class="table">
							<div class="row">
								<div class="cell"><label id="office-label"><g:message code="case.office.label" default="Office" /></label></div>
								<div class="cell">
									<span class="property-value" aria-labelledby="office-label">
										<g:link controller="office" action="show" id="${caseInstance?.office?.id}">${caseInstance?.office?.encodeAsHTML()}</g:link>
									</span>
								</div>
							</div>
						</div>
						<ol class="property-list case">
							<g:if test="${caseInstance?.thisevent}">
							<li class="fieldcontain">
								<span id="thisevent-label" class="property-label"><g:message code="case.thisevent.label" default="Thisevent" /></span>
								
									<span class="property-value" aria-labelledby="thisevent-label"><g:link controller="event" action="show" id="${caseInstance?.thisevent?.id}">${caseInstance?.thisevent?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						</ol>
					</fieldset>
				
				</div> <!-- END TAB 1 -->
												
				
				<div id="tab-evictions"></div>
				
				<div id="tab-labour"></div>
				
				<div id="tab-2">
					<!-- Outcome -->
					<ol class="property-list case">
							<g:if test="${caseInstance?.dateClosed}">
							<li class="fieldcontain">
								<span id="dateClosed-label" class="property-label"><g:message code="case.dateClosed.label" default="Date Closed" /></span>
								
									<span class="property-value" aria-labelledby="dateClosed-label"><g:formatDate date="${caseInstance?.dateClosed}" /></span>
								
							</li>
							</g:if>	
							<g:if test="${caseInstance?.outcome}">
									<li class="fieldcontain">
										<span id="outcome-label" class="property-label"><g:message code="case.outcome.label" default="Outcome" /></span>
										
											<span class="property-value" aria-labelledby="outcome-label"><g:link controller="caseOutcome" action="show" id="${caseInstance?.outcome?.id}">${caseInstance?.outcome?.encodeAsHTML()}</g:link></span>
										
									</li>
							</g:if>
							<g:if test="${caseInstance?.amtRecovered}">
							<li class="fieldcontain">
								<span id="amtRecovered-label" class="property-label"><g:message code="case.amtRecovered.label" default="Amt Recovered" /></span>
								
									<span class="property-value" aria-labelledby="amtRecovered-label"><g:fieldValue bean="${caseInstance}" field="amtRecovered"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${caseInstance?.bestPractice}">
							<li class="fieldcontain">
								<span id="bestPractice-label" class="property-label"><g:message code="case.bestPractice.label" default="Best Practice" /></span>
								
									<span class="property-value" aria-labelledby="bestPractice-label"><g:formatBoolean boolean="${caseInstance?.bestPractice}" /></span>
								
							</li>
							</g:if>
					</ol>
					
				</div>
				
				<div id="tab-3">
					<!-- Supporting documents -->
				</div>
				
				<div id="tab-4">
					<!-- Actions List -->
					<g:if test="${caseInstance?.actions}">
					<li class="fieldcontain">
						<span id="actions-label" class="property-label"><g:message code="case.actions.label" default="Actions" /></span>
						
							<g:each in="${caseInstance.actions}" var="a">
							<span class="property-value" aria-labelledby="actions-label"><g:link controller="action" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
							</g:each>
						
					</li>
					</g:if>
				</div>
				
				<div id="tab-admin">
					--history, created,update by etc --
				</div>
			</div>
			<!--  *** END TABS *** -->
			
			<g:form url="[resource:caseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${caseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
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
</script>		
	</body>
</html>
