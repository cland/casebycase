<h3><g:message code="default.mywork.menu" default="My Work" /></h3>
<div>
	<ul class="menu_list_items">		
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