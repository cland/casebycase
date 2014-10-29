<g:set var="cbcApiService" bean="cbcApiService"/>
<%@ page import="com.cbc.Action" %>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'action.label', default: 'Action')}" />
		<title><g:appTitle title=""><g:message code="default.edit.label" args="[entityName]" /></g:appTitle></title>
		<g:render template="head" var="thisInstance" bean="${actionInstance }" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<div id="resultsDiv" style="display:none;"></div>
		<div id="edit-action" class="content scaffold-edit" role="main" style="width:100%">
			<h1>...</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${actionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${actionInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:formRemote id="formid" name="dialogEdit" update="resultsDiv" url="[resource:actionInstance, action:'dialogupdate']" 
				after="afterSubmit"
				onSuccess="onSuccess(data)"
				onFailure="onFailure(data)"
				onComplete="onComplete">
				<g:hiddenField name="version" value="${actionInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:formRemote>
			
		</div>
		<script>
			$(document).ready(function() {		
				
			});  
			function afterSubmit(){

			}
			function onSuccess(data){
				$("#resultsDiv").show()
				$("#resultsDiv").html(data.message)
				$("#formid").hide()
			}
			function onFailure(data){
				alert("Failed to save")
				$("#resultsDiv").html("Failed to save!  " + data.message)
			}
			function onComplete(){
				alert("completed!")
			}
		</script>			
	</body>
</html>
