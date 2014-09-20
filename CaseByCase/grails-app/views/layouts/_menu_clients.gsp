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