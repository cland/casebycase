<%@ page import="com.cbc.Race" %>



<div class="fieldcontain ${hasErrors(bean: raceInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="race.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${raceInstance?.name}"/>
</div>



