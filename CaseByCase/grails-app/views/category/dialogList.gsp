
<%@ page import="com.cbc.Category"%>
<!DOCTYPE html>
<html>
<head>

<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'category.label', default: 'Category')}" />
<title><g:appTitle title="">
		<g:message code="default.list.label" args="[entityName]" />
	</g:appTitle></title>
<g:javascript library="categoryHierarchyStructure" />
<g:set var="page_sidenav" value="sidenav-admin" />
<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
<g:render template="style" ></g:render>
</head>
<body>
	
	<div id="list-category" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div id="hierarchyStructure" class="hierarchyStructure"></div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							$("#accordion").accordion({
								active : cbc_params.active_sidebar()
							});

							$("#tabs")
									.tabs(
											{
												active : cbc_params
														.active_tab(),
												create : function(event, ui) {
													//executed after is created								
													$('#tabs').show()
												},
												show : function(event, ui) {
													//on every tabs clicked
												},
												beforeLoad : function(event, ui) {
													ui.jqXHR
															.error(function() {
																ui.panel
																		.html("Couldn't load this tab. We'll try to fix this as soon as possible. ");
															});
												}
											});
						});
	</script>
</body>
</html>
