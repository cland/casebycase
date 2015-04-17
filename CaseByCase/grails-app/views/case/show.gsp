<%@ page import="com.cbc.SystemRoles" %>
<g:set var="cbcApiService" bean="cbcApiService"/>
<%@ page import="com.cbc.Case" %>
<g:set var="categoryInstance" value="${caseInstance?.categories?.find{true} }"/>
<g:set var="rootCategory" value="${categoryInstance?.getRootParentName(categoryInstance) }"/>
<g:set var="outcomeTabOn" value="${(caseInstance?.status?.name == 'Case Closed - Intimidation' | caseInstance?.status?.name == 'Closed' )}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'case.label', default: 'Case')}" />
		<title><g:appTitle title=""><g:message code="default.show.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head" var="thisInstance" bean="${caseInstance }" model="[sidenav:page_sidenav]"></g:render>
		<g:javascript library="jquerygrid" />		
		<link rel="stylesheet" href="/cbc/css/ui.jqgrid.css" type="text/css">
	</head>
	<body>
		<a href="#show-case" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
					<g:link controller="case" action="index">Cases</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					Case: ${caseInstance?.subject } (${caseInstance?.caseNumber }) - Category: ${rootCategory}
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
					<g:if test="${rootCategory == "Labour"}">
						<li><a href="#tab-labour">Labour</a></li>
					</g:if>
					<g:if test="${rootCategory == "Evictions"}">
						<li><a href="#tab-evictions">Evictions</a></li>
					</g:if>
					<g:if test="${outcomeTabOn == true }">
						<li><a href="#tab-2">Outcome & Metrics</a></li>	
					</g:if>
					<li><a href="#tab-3">Attachments</a></li>
					<li><a href="#tab-4">Actions</a></li>
					<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
					<li><a href="#tab-admin">Admin</a></li>
					</sec:ifAnyGranted>
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
									<g:message code="case.personclients.label" default="People" />								
								</label>
							</div>
							<div class="cell">
								<g:each in="${caseInstance.clients}" var="c">
									<span class="property-value" aria-labelledby="clients-label"><g:link controller="person" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
								</g:each>
							</div>
						</div>
						<div class="row">
							<div class="cell"><label id="orgclients-label"><g:message code="case.orgclients.label" default="Organisation(s)" /> </label></div>
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
						<div class="row">
							<div class="cell"><label id="priority-label"><g:message code="case.priority.label" default="Priority" /></label></div>
							<div class="cell">
								<span class="property-value" aria-labelledby="priority-label">
									${caseInstance?.priority?.encodeAsHTML()}
								</span>
							</div>
						</div>
						
					</div> <!-- End Div-Table -->
					
					
				</fieldset>
				<br/>
				<fieldset><legend>CATEGORISATION</legend>
					<div class="table">
							<div class="row">
								<div class="cell"><label id="">Category:</label></div>
								<div class="cell">
									<span class="property-value" aria-labelledby="office-label">
										${categoryInstance?.getFullCategoryName(categoryInstance)}
									</span>
								</div>
							</div>
							
							<div class="row">
								<div class="cell">
									<label id="childHeadedHouse-label">
										<g:message code="case.childHeadedHouse.label" default="Child Headed Household?" />		
									</label>
								</div>
								<div class="cell">
									<span class="property-value" aria-labelledby="childHeadedHouse-label"><g:formatBoolean boolean="${caseInstance?.childHeadedHouse}" true="yes" false="no"/></span>
								</div>
							</div>
					
							<div class="row">	
								<div class="cell">
									<label id="specialCase-label">
										<g:message code="case.specialCase.label" default="Special Case" />		
									</label>
								</div>
								<div class="cell">
									<span class="property-value" aria-labelledby="specialCase-label"><g:formatBoolean boolean="${caseInstance?.specialCase}" true="yes" false="no"/></span>
								</div>
							</div>
							
							<div class="row">	
								<div class="cell">
									<label id="status-label">
										<g:message code="case.status.label" default="Status" />
										<span class="required-indicator">*</span>
									</label>
								</div>
								<div class="cell">
									<span class="property-value" aria-labelledby="status-label">
										<g:fieldValue bean="${caseInstance }" field="status"/>	
									
									</span>
								</div>
							</div>
						</div>

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
								<div class="cell">
									<label id="assignedto"><g:message code="case.assignedTo.label" default="Case Worker" /></label>
								</div>
								<div class="cell">
									<span class="property-value" aria-labelledby="office-label">
										<g:if test="${caseInstance?.assignedTo}"><g:link controller="user" action="show" id="${caseInstance?.assignedTo?.id}">${caseInstance?.assignedTo?.person?.toString()?.encodeAsHTML()}</g:link></g:if>
									</span>
								</div>
							</div>
							<div class="row">
								<div class="cell"><label id="respondent-label"><g:message code="case.respondent.label" default="Respondent" /></label></div>
								<div class="cell">
									<span class="property-value" aria-labelledby="office-label">${caseInstance?.respondent?.encodeAsHTML()}</span>
								</div>
								<div class="cell">
									<label id="assignedto"></label>
								</div>
								<div class="cell">
									<span class="property-value" aria-labelledby="office-label">
										
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
						
				<g:if test="${rootCategory == "Labour"}">								
					<div id="tab-labour">
						<g:render template="form_labour" model="[mode:'read']"/>
					</div>
				</g:if>
				<g:if test="${rootCategory == "Evictions"}">
					<div id="tab-evictions">
						<g:render template="form_evictions" model="[mode:'read']"/>
					</div>
				</g:if>
				
				
				<g:if test="${outcomeTabOn == true }">
					<div id="tab-2">
						<!-- Outcome -->
						<fieldset><legend>OUTCOME</legend>
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
						</fieldset>	
						<fieldset><legend>CASE METRICS</legend>
							<div class="table">
								<div class="row">
									<div class="cell">
										<label for="TimeLapsed">
											<g:message code="case.timelapsed.label" default="Time lapsed since case opened" />											
										</label>
									</div>
									<div class="cell">
										-- day(s)
									</div>
								</div>
							
								<div class="row">
									<div class="cell">
										<label for="TimeToResolve">
											<g:message code="case.timetoresolve.label" default="Time to resolve" />											
										</label>
									</div>
									<div class="cell">
										-- day(s)
									</div>
								</div>
								<div class="row">
									<div class="cell">
										<label for="ProblemLasted">
											<g:message code="case.problemlasted.label" default="Problem lasted" />											
										</label>
									</div>
									<div class="cell">
										-- day(s) before reporting
									</div>
								</div>
								<div class="row">
									<div class="cell">
										<label for="ClientsAffected">
											<g:message code="case.clientsaffected.label" default="Number of clients affected" />											
										</label>
									</div>
									<div class="cell">
										--
									</div>
								</div>
								<div class="row">
									<div class="cell">
										<label for="TotalActions">
											<g:message code="case.totalactions.label" default="Total actions" />											
										</label>
									</div>
									<div class="cell">
										--
									</div>
								</div>
								<div class="row">
									<div class="cell">
										<label for="Total Consultations">
											<g:message code="case.totalconsultations.label" default="Total consultations" />											
										</label>
									</div>
									<div class="cell">
										--
									</div>
								</div>
							</div>
						</fieldset>			
					</div>
				</g:if>
				<div id="tab-3">
					<!-- Supporting documents -->
					<div id="attachments" class="attachments">
						<attachments:each bean="${caseInstance}" status="i">	
						<div class="photo-display float-left">
						<img src="${createLink(controller:'attachmentable',action:'download', id:attachment.id)}"/><br/>
							<img src="${resource(dir:'images/icons',file:'attach.png',plugin:'famfamfam')}" />			
							<attachments:downloadLink attachment="${attachment}" inline="false" withContentType="false" />
							${attachment.niceLength}
							<attachments:deleteLink attachment="${attachment}" label="${'[ delete ]'}"
								returnPageURI="${createLink(action:'show', id:caseInstance.id,absolute:true)}" />
						</div>	
							<g:if test="${i%2==0 & i!=0 }"><br/></g:if>
						
						</attachments:each>
						<div style="clear:both"></div>
					</div>
				</div>
				
				<div id="tab-4">
					<%-- Action jqGrid --%>
					<div id="action_grid" style="padding: 5px;">
						<table id="action_list" class="scroll jqTable"></table>
						<!-- pager will hold our paginator -->
						<div id="action_list_pager" class="scroll" style="text-align: center;"></div>
					</div>
				</div>
				<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
					<div id="tab-admin" class="">
						--history, created,update by etc --
					</div>
				</sec:ifAnyGranted>
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
		
		<g:render template="actions"/>
		
	</body>
</html>
