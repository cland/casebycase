<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'case.label', default: 'Case')}" />
		<title><g:appTitle title=""><g:message code="default.create.label" args="[entityName]" /></g:appTitle></title>
		<g:set var="page_sidenav" value="${com.cbc.SideNav.MENU_STANDARD}" />
		<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
	</head>
	<body>
		<a href="#create-case" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="bread-crump">
				<span class="r-arrow"></span>
				<g:link controller="home" action="cbc">Home</g:link>
				<span class="r-arrow"></span> 
				<span class="current-crump">
					here edit...
				</span>
		</div>
		<div id="status1" class="leftbar" role="complementary">
			<g:sideMenu default="${page_sidenav}"></g:sideMenu> 
		</div>
		<div id="create-case" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${caseInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${caseInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<!-- *** START TABS *** -->
			<g:form url="[resource:caseInstance, action:'save']" >
				<div id="tabs" style="display: none;">
					<ul>
						<li><a href="#tab-1">Details</a></li>
						<li><a href="#tab-labour">Labour</a></li>
						<li><a href="#tab-evictions">Evictions</a></li>
						<li><a href="#tab-2">Outcome & Metrics</a></li>	
						<li><a href="#tab-3">Attachments</a></li>		
					</ul>
					<div id="tab-1">
						<g:render template="form_tab1"/>
					</div>
					
					<div id="tab-2">
						<g:render template="form_tab2"/>
					</div>
					<div id="tab-labour">
						<g:render template="form_labour"/>
					</div>
					<div id="tab-evictions">
						<g:render template="form_evictions"/>
					</div>
					<div id="tab-3">
						<g:render template="form_tab3"/>
					</div>
				</div>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			<!--  *** END TABS *** -->			
			
		</div>
		<script>
        function addPersonClient(_id){
 		  	 var $dialog = $('<div><div id="wait" style="font-weight:bold;text-align:center;">Loading...</div></div>')             
                         .load('../person/dialogcreate?caseid=' +_id)
                         
                         .dialog({
                             autoOpen: false,
                             dialogClass: 'no-close',
                             width:800,
                             beforeClose: function(event,ui){
                             	
                             },
                             buttons:{
                                 "DONE":function(){
                               	  location.reload();
                                     },
                                  "CANCEL":function(){
                               	   $(this).dialog('close')
                                      }
                                },
                             close: function(event,ui){
                           	  $(this).dialog('destroy').remove()
                           	  //location.reload();
                             },
                             position: {my:"top",at:"top",of:window},
                             title: 'New Person Client'                         
                         });
                             
                         $dialog.dialog('open');
                         
 		  }
			$(document).ready(function() {		
				$("#accordion" ).accordion({ active: cbc_params.active_sidebar() });
			
				$("#tabs").tabs(
								{
								active:cbc_params.active_tab(),
								create: function (event,ui){	
									//executed after is created								
									$('#tabs').show()
								},
								show: function(event,ui){
									//on every tabs clicked
								},
								beforeLoad : function(event, ui) {
										ui.jqXHR.error(function() {
											ui.panel
											.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
										});
									}
				}); //end tabs

				//person auto-complete
				$( "#person-clients" ).autocomplete({
						source: function(request,response) {
						$.ajax({
							url : "../person/personlist", // remote datasource
							dataType: "json",
							data : request,
							success : function(data) {
								response(data); // set the response
							},
							error : function() { // handle server errors
								alert("Unable to retrieve records");
							}
						});
						},
						minLength : 2, // triggered only after minimum 2 characters have been entered.
						select : function(event, ui) { // event handler when user selects a company from the list.
							$("#person_id").val(ui.item.id); // update the hidden field.
							$("#gender").val(ui.item.gender) // populate the employee field with the nasdaq symbol.
							//log( ui.item ? "Selected: " + ui.item.label + " aka " + ui.item.id : "Nothing selected, input was " + this.value );
						}
					});		                
			});  
		</script>		
	</body>
</html>
