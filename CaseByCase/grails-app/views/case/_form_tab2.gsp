<%--OUTCOME and METRICS SECTIONS--%>
<fieldset><legend>OUTCOME</legend>
	<div class="table">
		<div class="row">
			<div class="cell">
				<label for="outcome">
					<g:message code="case.outcome.label" default="Outcome" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:select id="outcome" name="outcome.id" from="${com.cbc.CaseOutcome.list()}" optionKey="id" required="" value="${caseInstance?.outcome?.id}" class="many-to-one" noSelection="['null': '-select one-']"/>
				</span>
			</div>
			
			<div class="cell">
				<label for="dateClosed">
					<g:message code="case.dateClosed.label" default="Date Closed" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:datePicker name="dateClosed" precision="day"  value="${caseInstance?.dateClosed}"  />
				</span>
			</div>
		</div>
		
		<div class="row">
			<div class="cell">
				<label for="amtRecovered">
					<g:message code="case.amtRecovered.label" default="Amt Recovered" />
					<span class="required-indicator">*</span>
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:field name="amtRecovered" type="number" value="${(caseInstance?.amtRecovered?caseInstance?.amtRecovered:0)}" />
				</span>
			</div>
			
			<div class="cell">
				<label for="bestPractice">
					<g:message code="case.bestPractice.label" default="Best Practice" />		
				</label>
			</div>
			<div class="cell">
				<span class="property-value" aria-labelledby="office-label">
					<g:checkBox name="bestPractice" value="${caseInstance?.bestPractice}" />
				</span>
			</div>
		</div>
	
	</div>
</fieldset>

<fieldset><legend>CASE METRICS</legend>
	<!-- CASE METRICS -->
	<div class="table">
		<div class="row">
			<div class="cell">
				<label for="TimeLapsed">
					<g:message code="case.timelapsed.label" default="Time lapsed since case opened" />											
				</label>
			</div>
			<div class="cell">
				36 day(s)
			</div>
		</div>
	</div>
	<p><br/>Other Case Metrics will be computed as soon as the Case is marked as Closed and the Case is Saved.</p><br/>
	
	
	
</fieldset>