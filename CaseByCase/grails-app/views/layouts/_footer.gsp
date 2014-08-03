<%@ page import="com.cbc.SystemRoles" %>
<div class="footer" id="footer">
<a href="${request.contextPath}">Home</a> |
<sec:ifNotLoggedIn>
<g:link controller="login" action="index" >Login</g:link> |
</sec:ifNotLoggedIn>

<g:link url="${resource(dir:'admin', file:'technical')}">Technical</g:link>  |
<sec:ifLoggedIn>

<sec:ifAnyGranted roles="${SystemRoles.ROLE_ADMIN }">

</sec:ifAnyGranted>



<g:link controller="logout" action="index" >Logout</g:link>
</sec:ifLoggedIn>
<br/>
<div class="copyright"><g:meta name="app.name"/> version: <g:meta name="app.version"/> | <g:copyright startYear="2013">Autumn Leaf</g:copyright></div>
</div>