	
	<div id="accordion" style="font-size: 14px;">
			<h3><g:message code="default.offices.menu" default="Offices & Users" /></h3>
			<div>
				<ul>
					<li>
						<g:link class="create" controller="office" action="create">
							<g:message code="default.new.label" args="['Office']" params="[sidebar:0]"/>
						</g:link>
					</li>
					<li>
						<g:link class="index" controller="office" action="index">
							<g:message code="default.list.label" args="['Offices']" params="[sidebar:0]" />
						</g:link>
					</li>
					<li>
						<g:link class="index" controller="user" action="index" params="[sidebar:0]">
							<g:message code="default.user.label" default="User Profiles" />
						</g:link>
					</li>	
					<li>
						<g:link class="create" controller="user" action="create" params="[sidebar:0]">
							<g:message code="default.new.label" args="['User Profile']" default="New User Profile" />
						</g:link>
					</li>						
				</ul>
			</div>

			<h3><g:message code="default.users.menu" default="Users" /></h3>
			<div>
				<ul>
					<li><g:link class="create" controller="user" action="create">
							<g:message code="default.new.label" args="['User']" /></g:link></li>
					<li><g:link class="list" controller="user" action="list">
							<g:message code="default.list.label" args="['User']" />
						</g:link></li>
					<li><g:link class="create" controller="organisation" action="create">
							<g:message code="default.new.label" args="['Organisation']" /></g:link></li>
					<li><g:link class="list" controller="organisation" action="list">
							<g:message code="default.list.label" args="['Organisation']" />
						</g:link></li>						
				</ul>
			</div>
			
			<h3><g:message code="default.other.menu" default="Other" /></h3>
			<div>
			<ul>
<%--				<li>--%>
<%--					<g:link class="search" controller="search" action="index">--%>
<%--						<g:message code="default.search.label" default="Search" />--%>
<%--					</g:link>--%>
<%--				</li>--%>
					<li><g:link class="create" controller="region" action="create">
							<g:message code="default.new.label" args="['Region']" /></g:link></li>
					<li><g:link class="list" controller="region" action="list">
							<g:message code="default.list.label" args="['Region']" />
						</g:link></li>
					<li><g:link class="create" controller="race" action="create">
							<g:message code="default.new.label" args="['Race']" /></g:link></li>
					<li><g:link class="list" controller="race" action="list">
							<g:message code="default.list.label" args="['Race']" />
						</g:link></li>
			</ul>
			</div>			
		</div>