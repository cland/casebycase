<%@ page import="com.cbc.User" %>
<!-- *** START TABS *** -->
<div id="tabs" style="display: none;">
				<ul>
					<li><a href="#tab-1">Login Details</a></li>
					<li><a href="#tab-2">Personal Details</a></li>		
				</ul>
		<div id="tab-1">
		
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
			<label for="username">
				<g:message code="user.username.label" default="Username" />
				<span class="required-indicator">*</span>
			</label>
			<g:textField name="username" required="" value="${userInstance?.username}"/>
		</div>

		<g:if test="${params?.action == 'create'}">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password">
					<g:message code="user.password.label" default="Password" />
					<span class="required-indicator">*</span>
				</label>
				<g:field type="password" name="password" required="" value="${userInstance?.password}"/>
			</div>
		</g:if>
				

		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
			<label for="email">
				<g:message code="user.email.label" default="Email" />
				<span class="required-indicator">*</span>
			</label>
			<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
		</div>
		
		<g:render template="editRoles" />
		
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
			<label for="enabled">
				<g:message code="user.enabled.label" default="Enabled" />
				
			</label>
			<g:checkBox name="enabled" value="${userInstance?.enabled}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
			<label for="accountExpired">
				<g:message code="user.accountExpired.label" default="Account Expired" />
				
			</label>
			<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
			<label for="accountLocked">
				<g:message code="user.accountLocked.label" default="Account Locked" />
				
			</label>
			<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
		</div>
		
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
			<label for="passwordExpired">
				<g:message code="user.passwordExpired.label" default="Password Expired" />
				
			</label>
			<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
	</div>
	</div>
	
	<div id="tab-2">
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'person', 'error')} required">
			<label for="person">
				<g:message code="user.person.label" default="Person" />
				<span class="required-indicator">*</span>
			</label>
			<g:select id="person" name="person.id" from="${com.cbc.Person.list()}" optionKey="id" required="" value="${userInstance?.person?.id}" class="many-to-one"/>
		</div>
	</div>
</div>
	<!--  *** END TABS *** -->	



		
	
				
