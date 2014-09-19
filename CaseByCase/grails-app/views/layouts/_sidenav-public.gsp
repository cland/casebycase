	
	<div id="accordion" style="font-size: 14px;">
			<h3><g:message code="default.offices.menu" default="Noticeboard" /></h3>
			<div>
			${com.cbc.Document.findByName('$side-noticeboard')?.content?.decodeHTML() }			
			</div>

			<h3><g:message code="default.mywork.menu" default="My Work" /></h3>
			<div>
				<ul class="menu_list_items">
					<li>
						<g:link class="create" controller="case" action="create">
							<g:message code="default.new.label" args="['Case']" />
						</g:link>
					</li>
					<li>
						<g:link class="list" controller="case" action="index">
							<g:message code="default.list.label" args="['Cases']" />
						</g:link>
					</li>
					<li>
						<g:link class="list" controller="action" action="index">
							<g:message code="default.list.label" args="['Actions']" />
						</g:link>
					</li>	
					<li>
						<g:link class="list" controller="event" action="index">
							<g:message code="default.list.label" args="['Events']" />
						</g:link>
					</li>					
				</ul>
			</div>
			<h3><g:message code="default.clients.menu" default="Clients" /></h3>
			<div>
				<ul class="menu_list_items">
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
			<h3><g:message code="default.pcm.menu" default="Please Call Me" /></h3>
			<div>
				<ul class="menu_list_items">
					<li>
						<g:link class="create" controller="pcm" action="create">
							<g:message code="default.new.label" args="['PCM']" />
						</g:link>
					</li>
					<li>
						<g:link class="list" controller="pcm" action="index">
							<g:message code="default.list.label" args="['PCMs']" />
						</g:link>
					</li>
									
				</ul>
			</div>
			
			<h3><g:message code="default.reports.menu" default="Reports" /></h3>
			<div>
				<ul class="menu_list_items">
					<li><g:link class="create" controller="report" action="index">
							<g:message code="default.new.label" args="['Standard']" /></g:link></li>
					<li><g:link class="list" controller="report" action="index">
							<g:message code="default.list.label" args="['Advanced']" />
						</g:link></li>
									
				</ul>
			</div>
						
		</div>

