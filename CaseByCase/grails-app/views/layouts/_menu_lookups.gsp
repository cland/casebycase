<h3><g:message code="default.lookup.menu" default="Lookup Types" /></h3>
			<div>
			<ul class="menu_list_items">
					
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