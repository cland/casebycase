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
		<div class="row">
			<div class="cell"><label id="" for="clients"><g:message code="case.clients.label" default="Clients" /> </label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:select name="clients" from="${com.cbc.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${caseInstance?.clients*.id}" class="many-to-many"/>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="cell"><label id="" for="orgclients"><g:message code="case.orgclients.label" default="Orgclients" /> </label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:select name="orgclients" from="${com.cbc.Organisation.list()}" multiple="multiple" optionKey="id" size="5" value="${caseInstance?.orgclients*.id}" class="many-to-many"/>
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
					<g:textField name="subject" value="${caseInstance?.subject}"/>
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
					<g:textField name="caseNumber" value="${caseInstance?.caseNumber}"/>
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
					<g:datePicker name="dateOpen" precision="day"  value="${caseInstance?.dateOpen}"  />
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
					<g:datePicker name="problemStart" precision="day"  value="${caseInstance?.problemStart}"  />
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
					<g:textArea name="description" value="${caseInstance?.description}" rows="5" cols="40"/>
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
					<g:select id="priority" name="priority.id" from="${com.cbc.CasePriority.list()}" optionKey="id" required="" value="${caseInstance?.priority?.id}" class="many-to-one" noSelection="['null': '-select one-']"/>
				</span>
			</div>
		</div>
	</div>
</fieldset>

<fieldset><legend>CATEGORISATION</legend>
	<div class="table">
		<div class="row">
			<div class="cell"><label id="">Categorise:</label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					-- category fields here --
				</span>
			</div>
		</div>
		
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
					<g:select id="status" name="status.id" from="${com.cbc.CaseStatus.list()}" optionKey="id" required="" value="${caseInstance?.status?.id}" class="many-to-one" noSelection="['null': '-select one-']"/>
				</span>
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
					<g:select id="office" name="office.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${caseInstance?.office?.id}" class="many-to-one" noSelection="['null': '-select one-']"/>
				</span>
			</div>
			<div class="cell"><label id="">Case worker</label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					-- Case worker (User) lookup field here --
				</span>
			</div>
		</div>
		<div class="row">	
			<div class="cell"><label id="">Case respondent</label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					-- Case respondent field here --
				</span>
			</div>
			<div class="cell"><label id="" for="thisevent"><g:message code="case.thisevent.label" default="Event" /> </label></div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:select id="thisevent" name="thisevent.id" from="${com.cbc.Event.list()}" optionKey="id" value="${caseInstance?.thisevent?.id}" class="many-to-one" noSelection="['null': '']"/>
				</span>
			</div>
		</div>
	</div>
</fieldset>





















