<%@ page import="com.cbc.SystemRoles" %>

	<ul class="sf-menu" id="main-top-menu">
		
		<li>
			<a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label" default="Home"/></a>
			<ul>
		        <li><a class="aboutus" href="${createLink(uri: '/home/aboutus')}"><g:message code="default.aboutus.label" default="About us" /></a>	</li>
				<li><a class="newsevents" href="${createLink(uri: '/home/news')}"><g:message code="default.newsevents.label" default="News"/></a></li>
            </ul>
		</li>
		<sec:ifLoggedIn>
			<li>				
				<a class="home" href="${createLink(uri: '/')}"><g:message code="default.mywork.label" default="My Work"/></a>
				<ul>
				<li><a class="aboutus" href="${createLink(uri: '/home/')}"><g:message code="default.aboutus.label" default="New Case" /></a></li>	
		        <li><a class="aboutus" href="${createLink(uri: '/home/')}"><g:message code="default.aboutus.label" default="Cases" /></a></li>		        
				<li><a class="newsevents" href="${createLink(uri: '/home/')}"><g:message code="default.newsevents.label" default="Actions"/></a></li>
				</ul>
			</li>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.clients.label" default="Clients"/></a>
				<ul>
					<li><a class="aboutus" href="${createLink(uri: '/home/')}"><g:message code="default.aboutus.label" default="New Person" /></a></li>	
					<li><a class="aboutus" href="${createLink(uri: '/home/')}"><g:message code="default.aboutus.label" default="New Organisation" /></a></li>	
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.persons.label" default="Persons"/></a></li>					
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.organisations.label" default="Organisations"/></a></li>				
            	</ul>
            </li>	
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.events.label" default="Events"/></a></li>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.pcm.label" default="Please Call Me"/></a>
            <li>				
				<a class="reports" href="${createLink(uri: '/')}"><g:message code="default.reports.label" default="Reports"/></a>
				<ul>
			        <li><a class="reports" href="${createLink(uri: '/home/')}"><g:message code="default.standard.label" default="Standard" /></a></li>		        
					<li><a class="reports" href="${createLink(uri: '/home/')}"><g:message code="default.custom.label" default="Custom"/></a></li>
					<li><a class="reports" href="${createLink(uri: '/')}"><g:message code="default.events.label" default="Events"/></a></li>				
            	</ul>
			</li>				
			<li>
				<g:link controller="admin" action="cbc" class="Admin"> <g:message code="default.admin.label" default="Admin" /></g:link>
				<ul>
					<li><a class="Admin" href="${createLink(uri: '/home/')}"><g:message code="default.standard.label" default="Advice Offices" /></a></li>
					<li><a class="Admin" href="${createLink(uri: '/home/')}"><g:message code="default.standard.label" default="User Profiles" /></a></li>
					<li><a class="Admin" href="${createLink(uri: '/home/')}"><g:message code="default.standard.label" default="Municipalities" /></a></li>
				</ul>
			</li>
		</sec:ifLoggedIn>						
				
<%--		<li class="float-right">--%>
<%--			<a href="javascript:printFriendly(true,false);" style="" class="print-button">--%>
<%--				<g:message code="default.print.label" default="Print"/>--%>
<%--			</a>			--%>
<%--		</li>--%>
		
		<sec:ifLoggedIn>		
			<li class="float-right">
				<g:link controller="logout" action="index" class="logout">
					<g:message code="default.logout.label" default="Logout"/>
				</g:link>
			</li>
		</sec:ifLoggedIn>

		<sec:ifNotLoggedIn>
			<li class="float-right">
					<g:link controller="login" action="index" class="login">
						<g:message code="default.login.label" default="Login"/>
					</g:link>
<%--				<g:link controller="home" action="index" class="home">--%>
<%--					<g:message code="default.anonymous.label" default="Anonymous"/>--%>
<%--				</g:link>--%>
<%--				<ul>--%>
<%--					<li>--%>
<%--					<g:link controller="login" action="index" class="login">--%>
<%--						<g:message code="default.login.label" default="Login"/>--%>
<%--					</g:link>	--%>
<%--					</li>--%>
<%--				</ul>--%>
			</li>
		</sec:ifNotLoggedIn>
	</ul>
	

