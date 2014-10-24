<g:set var="cbcApiService" bean="cbcApiService"/>
<!DOCTYPE html>
<html>
	<head>
		<g:set var="entityName" value="${message(code: 'organisation.label', default: 'Organisation')}" />
		<title><g:appTitle title=""><g:message code="default.create.label" args="[entityName]" /></g:appTitle></title>
		
	</head>
	<body>
	<div class="screen-dialog">
		<a href="#create-organisation" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>		
		
		<div id="create-organisation" class="content scaffold-create" role="main">			
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<div id="resultsDiv" style="display:none;border:solid 1px #000;background:#fff;padding:5px;"></div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${personInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${personInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:formRemote id="formid" name="dialogEdit" update="resultsDiv" url="[controller:'organisation',action:'dialogsave']" 
			after="afterSubmit"
			onSuccess="onSuccess(data)"
			onFailure="onFailure(data)"
			onComplete="onComplete">
			
						<fieldset class="form">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
			</g:formRemote>			
			
		</div>
		<script>
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
			$(document).ready(function() {		
				                
			});  
		</script>

</div>		
	</body>
</html>
