
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
<g:javascript library="treeselect" />
<g:set var="page_sidenav" value="sidenav-admin" />
<g:render template="head" var="viewbag" model="[sidenav:page_sidenav]"></g:render>
<g:render template="style" ></g:render>
</head>
<body>
	<a href="#list-category" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="bread-crump">
		<span class="r-arrow"></span>
		<g:link controller="home" action="cbc">Home</g:link>
		<span class="r-arrow"></span> <span class="current-crump">Categories </span>
	</div>
	<div id="status1" class="leftbar" role="complementary">
		<g:sideMenu default="${page_sidenav }"></g:sideMenu>
	</div>
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
		
		<fieldset><legend>TREESELECT TEST</legend>
		
		<div class="chosentree"></div>
		</fieldset>
		
	</div>

	<script>
	
		$(document).ready(function() {
			$("#accordion").accordion({
				active : cbc_params.active_sidebar()
			});

			$("#tabs").tabs({
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

			$('div.chosentree').chosentree({
			      width: 500,
			      deepLoad: true,
			      selected:function (node){
				      alert("selected!")
				      },
			      load: function(node, callback) {
			        /**
			         * This would typically call jQuery.ajax to load a new node
			         * on your server where you would return the tree structure
			         * for the provided node.
			         */
			    	  setTimeout(function() {
			              callback(loadChildren(node, 0));
			            }, 1000);   
			      }
			 });
		}); // end ready

		 var maxDepth = 3;
	     var loadChildren = function(node, level) {
	       var hasChildren = node.level < maxDepth;
	       for (var i=0; i<8; i++) {
	         var id = node.id + (i+1).toString();
	         node.children.push({
	           id:id,
	           title:'Node ' + id,
	           has_children:hasChildren,
	           level: node.level + 1,
	           children:[]
	         });
	         if (hasChildren && level < 2) {
	           loadChildren(node.children[i], (level+1));
	         }
	       }
	       return node;
	     };
	</script>
</body>
</html>
