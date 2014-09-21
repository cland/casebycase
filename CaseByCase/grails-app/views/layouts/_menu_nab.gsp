<h3><g:message code="default.offices.menu" default="Offices & Users" /></h3>
<div>
	<ul class="menu_list_items">
		
		<li>
			<g:link class="index" controller="office" action="index">
				<g:message code="default.list.label" args="['Office']" params="[]" />
			</g:link>
		</li>
		
		<li>
			<g:link class="index" controller="user" action="index" params="[]">
				<g:message code="default.user.label" default="User List" />
			</g:link>
		</li>	
							
	</ul>
</div>