 <div class="fieldcontain required">
 <label for="">
		<g:message code="user.role.label" default="Roles" />
		<span class="required-indicator">*</span>
	</label>
		<g:each var="auth" in="${com.cbc.Role.list()}">
			<g:set var="isRoleChecked" value="false" />
			<g:set var="tmp" value="false" />
			<g:if test="${params.action=='edit'}">
    		<g:each var="sel" in="${userInstance?.getAuthorities() }">   
    		 		
        		 <g:if test="${auth?.authority?.toString()?.trim()?.equalsIgnoreCase(sel?.toString()?.trim())}">           		  
        		 	<g:set var="isRoleChecked" value="true" />
        		 </g:if>        		      		
    		</g:each>
    		</g:if>
    		
    		 <g:checkBox name="role_${auth?.authority}" id="${auth.id}" checked="${isRoleChecked}" label="${auth?.authority}"/> ${auth?.authority}
    		 
		</g:each>
</div>
	
	
    
   