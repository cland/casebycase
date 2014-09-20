<%@ page import="com.cbc.SystemRoles" %>
<g:set var="layoutPath" value="../layouts"/>
<div id="accordion" style="font-size: 14px;">
<%--	<h3><g:message code="default.offices.menu" default="Noticeboard" /></h3>--%>
<%--	<div>--%>
<%--	${com.cbc.Document.findByName('$side-noticeboard')?.content?.decodeHTML() }			--%>
<%--	</div>--%>

	<g:render template="${layoutPath}/menu_mywork"/>
	<g:render template="${layoutPath}/menu_clients"/>	
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_PCM },${SystemRoles.ROLE_ADMIN }">
		<g:render template="${layoutPath}/menu_pcm"/>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN },${SystemRoles.ROLE_OCO }">
		<g:render template="${layoutPath}/menu_reports"/>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">
		<g:render template="${layoutPath}/menu_nab"/>
		<g:render template="${layoutPath}/menu_locations"/>
		<g:render template="${layoutPath}/menu_lookups"/>	
	</sec:ifAnyGranted>
</div>

