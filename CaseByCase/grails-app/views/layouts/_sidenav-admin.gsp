	
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
						<g:link class="create" controller="user" action="create" params="[sidebar:0]">
							<g:message code="default.new.label" args="['User Profile']" default="New User Profile" />
						</g:link>
					</li>
					<li>
						<g:link class="index" controller="user" action="index" params="[sidebar:0]">
							<g:message code="default.user.label" default="User Profiles" />
						</g:link>
					</li>	
										
				</ul>
			</div>

			<h3><g:message code="default.clients.menu" default="Clients" /></h3>
			<div>
				<ul>
					<li><g:link class="create" controller="person" action="create">
							<g:message code="default.new.label" args="['Person Client']" /></g:link></li>
					<li><g:link class="list" controller="person" action="index">
							<g:message code="default.list.label" args="['Person Clients']" />
						</g:link></li>
					<li><g:link class="create" controller="organisation" action="create">
							<g:message code="default.new.label" args="['Organisation']" /></g:link></li>
					<li><g:link class="list" controller="organisation" action="index">
							<g:message code="default.list.label" args="['Organisations']" />
						</g:link></li>						
				</ul>
			</div>
			
			<h3><g:message code="default.reports.menu" default="Reports" /></h3>
			<div>
				<ul>
					<li><g:link class="create" controller="person" action="create">
							<g:message code="default.new.label" args="['Standard']" /></g:link></li>
					<li><g:link class="list" controller="person" action="index">
							<g:message code="default.list.label" args="['Advanced']" />
						</g:link></li>
					<li><g:link class="create" controller="organisation" action="create">
							<g:message code="default.new.label" args="['Organisation']" /></g:link></li>
					<li><g:link class="list" controller="organisation" action="index">
							<g:message code="default.list.label" args="['Organisations']" />
						</g:link></li>						
				</ul>
			</div>

			<h3><g:message code="default.lookup.menu" default="Lookup Types" /></h3>
			<div>
			<ul>
					<li><g:link class="create" controller="country" action="create"><g:message code="default.new.label" args="['Country']" /></g:link></li>
					<li><g:link class="list" controller="country" action="index"><g:message code="default.list.label" args="['Countries']" /></g:link></li>
					<li><g:link class="create" controller="region" action="create"><g:message code="default.new.label" args="['Region']" /></g:link></li>
					<li><g:link class="list" controller="region" action="index"><g:message code="default.list.label" args="['Regions']" /></g:link></li>
					<li><g:link class="create" controller="caseStatus" action="create">
							<g:message code="default.new.label" args="['Case Status']" /></g:link></li>
					<li><g:link class="list" controller="caseStatus" action="index">
							<g:message code="default.list.label" args="['Case Statuses']" />
						</g:link></li>
					<li>
						<g:link class="create" controller="caseOutcome" action="create">
							<g:message code="default.new.label" args="['Case Outcome']" />
						</g:link>
					</li>
					<li>
						<g:link class="list" controller="caseOutcome" action="index">
							<g:message code="default.list.label" args="['Case Outcomes']" />
						</g:link>
					</li>
					<li>
						<g:link class="create" controller="casePriority" action="create">
							<g:message code="default.new.label" args="['Case Priority']" />
						</g:link>
					</li>
					<li>
						<g:link class="list" controller="casePriority" action="index">
							<g:message code="default.list.label" args="['Case Priority']" />
						</g:link>
					</li>
					<li>
						<g:link class="create" controller="category" action="create">
							<g:message code="default.new.label" args="['Category']" params="[sidebar:0]"/>
						</g:link>
					</li>
					<li>
						<g:link class="list" controller="category" action="index">
							<g:message code="default.list.label" args="['Category']" />
						</g:link>
					</li>
					<li>
						<g:link class="create" controller="actionType" action="create">
							<g:message code="default.new.label" args="['Action Type']" />
						</g:link>
					</li>
					<li>
						<g:link class="list" controller="actionType" action="index">
							<g:message code="default.list.label" args="['Action Types']" />
						</g:link>
					</li>
					
					
					<li><g:link class="create" controller="race" action="create">
							<g:message code="default.new.label" args="['Race']" /></g:link></li>
					<li><g:link class="list" controller="race" action="index">
							<g:message code="default.list.label" args="['Race']" />
						</g:link></li>
			</ul>
			</div>				
			
						
		</div>