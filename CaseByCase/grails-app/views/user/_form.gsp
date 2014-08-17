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

		<g:if test="${params?.action == 'create'||params?.action == 'save'}">
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="password">
					<g:message code="user.password.label" default="Password" />
					<span class="required-indicator">*</span>
				</label>
				<g:field type="password" name="password" required="" value="${userInstance?.password}"/>
			</div>
			<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
				<label for="passwordConfirm">
					<g:message code="user.passwordconfirm.label" default="Confirm Password" />
					<span class="required-indicator">*</span>
				</label>
				<g:field type="password" name="passwordConfirm" required="" value=""/>
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
			<g:select onchange="onChangePerson(1)" id="person" 
				name="person.id"
				noSelection="['': '--New Person/Select One--']" 
				from="${com.cbc.Person.list().sort()}" optionKey="id" 
				value="${userInstance?.person?.id}" 
				class="many-to-one"/>
		</div>
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'person.firstName', 'error')} required">
		<label for="person.firstName">
			<g:message code="person.firstName.label" default="First Name" />
			
		</label>
		<g:textField name="person.firstName" required="" value="${userInstance?.person?.firstName}"/>
		</div>
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'person.lastName', 'error')} required">
			<label for="person.lastName">
				<g:message code="person.lastName.label" default="Last Name" />
				
			</label>
			<g:textField name="person.lastName" required="" value="${userInstance?.person?.lastName}"/>
		</div>
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'person.gender', 'error')} required">
			<label for="person.gender">
				<g:message code="person.gender.label" default="Gender" />
				
			</label>
			<g:select name="person.gender" required="" from="${com.cbc.Person.constraints.gender.inList}" value="${userInstance?.person?.gender}" valueMessagePrefix="person.gender" noSelection="['': '']"/>
		</div>
		<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'person.race', 'error')} required">
			<label for="person.race">
				<g:message code="user.race.label" default="Race" />
				
			</label>
			<g:select name="person.race.id" required="" from="${com.cbc.Race.list()}" optionKey="id" value="${userInstance?.person?.race?.id}"  noSelection="['': '']"/>
		</div>
		<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'office', 'error')} required">
			<label for="office">
				<g:message code="person.office.label" default="Office" />
				<span class="required-indicator">*</span>
			</label>
			<g:select id="office" name="person.office.id" from="${com.cbc.Office.list()}" optionKey="id" required="" value="${userInstance?.person?.office?.id}" class="many-to-one"/>
		</div>
	</div> <!-- End tab 2 -->
</div>	<!--  *** END TABS *** -->	



		
	
				
