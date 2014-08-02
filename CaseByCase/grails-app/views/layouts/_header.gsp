<%@ page import="com.cbc.SystemRoles" %>
<div id="main-header" role="banner">

	<div id="header">
	<g:render template="/layouts/siteSearch" />
		<p>
			<a class="header-main" href="${resource(dir:'')}"> Case-By-Case</a>
		</p>
		<p class="header-sub">Next Case!</p>
		<div id="loginHeader">
			<g:loginControl />
		</div>
	</div>
	<div id="grailsLogo">
		<a href="/cbc/"> 
			<img src="${resource(dir: 'images', file: 'grails_logo.png')}"	alt="${AppName }" />
		</a>
		<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">			
			<g:render template="siteSearch"/>			
		</sec:ifAnyGranted>
	</div>
</div>
