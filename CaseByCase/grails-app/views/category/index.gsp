
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
<%--<g:javascript library="categoryHierarchyStructure" />--%>
<%--<g:javascript library="treeselect" />--%>
<g:javascript library="jstree" />
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
<%--		<div id="hierarchyStructure" class="hierarchyStructure"></div>--%>
		
		
		<fieldset><legend>jsTree Test</legend>
		  <div id="jstree">
			    <!-- in this example the tree is populated from inline HTML -->
			    <ul>
			      <li>Root node 1
			        <ul>
			          <li id="child_node_1">Child node 1</li>
			          <li>Child node 2</li>
			        </ul>
			      </li>
			      <li>Root node 2</li>
			    </ul>
			  </div>
			<button>demo button</button>
		
		</fieldset>
		
		<fieldset><legend>TREESELECT TEST</legend>		
			<div class="chosentree"></div>
		</fieldset>
		
	</div>

	<script>	
	/*
	try:: =>  
	http://www.jstree.com/demo/
		OR
	http://www.jeasyui.com/demo/main/index.php?plugin=ComboTree&theme=default&dir=ltr&pitem=
	*/
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

			$('#jstree').jstree({
				"core" : {
			    	"multiple" : false,
			    	"animation" : 0,
			    	'data' : {
			    	    'url' :"${resource()}/category/ajaxNodeChildren?parentid=1",
			    	    'data' : function (node) {
			    	      		return { 'id' : node.id };
			    	 		}
			  		}
				}
			});
		    // 7 bind to events triggered on the tree
		    $('#jstree').on("changed.jstree", function (e, data) {
		      console.log(data.selected);
		      
		    });
		    // 8 interact with the tree - either way is OK
		    $('button').on('click', function () {
			    //** Options to select a node **//
		    //  $('#jstree').jstree(true).select_node('16');  //** Option 1
		    //  $('#jstree').jstree('select_node', '16'); //** Option 2
		      $.jstree.reference('#jstree').select_node('16'); //** Option 3
		    });

			
<%--			$('div.chosentree').chosentree({--%>
<%--			      width: 400,--%>
<%--			      inputId:'category-select',--%>
<%--			      inputName:'mycategory',--%>
<%--			      deepLoad: true,--%>
<%--			      default_value: {}, --%>
<%--			      input_placeholder:'Please Only One',		    --%>
<%--			      selected:mySelection(),--%>
<%--			      load: function(node, callback) {--%>
<%--			        /**--%>
<%--			         * This would typically call jQuery.ajax to load a new node--%>
<%--			         * on your server where you would return the tree structure--%>
<%--			         * for the provided node.--%>
<%--			         */--%>
<%--			        loadMyChildren(node, 0,1,callback)--%>
<%--			         //callback(n);--%>
<%--			      }--%>
<%--			 });--%>
			 
		}); // end ready


		var loadMyChildren = function(node,level,_id,callback){
	    	var _link ="${resource()}/category/ajaxNodeChildren";		 	
	 		$.ajax({
	 			url : _link, 
	 			dataType: "json",
	 			data : 'parentid=' + _id,
	 			success : function(data) {		 			
		 			$.each(data,function(index,item){
			 			//item.link="/cbc/category/show/" + item.id
		 				node.children.push(item)
			 			});
	 				//return node;
	 				callback(node)
	 			},
	 			error : function() { // handle server errors
	 				alert("Unable to retrieve data");
	 				return node;
	 			}
	 		});
		 };
	     
	</script>
</body>
</html>
