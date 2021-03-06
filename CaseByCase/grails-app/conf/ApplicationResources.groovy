modules = {
    application {
        dependsOn 'jquery, jquery-ui'		
        resource url:'js/application.js'
        resource url:'js/jquery.metadata.js'
        resource url:'js/jquery.ui.writetable.js'			
		resource url: 'js/jquery-ui.multidatespicker.js'		
		resource url: 'js/hoverIntent.js'
		resource url: 'js/superfish.min.js'
		resource url: 'js/app-common.js'
    }
	
	jquerygrid{
		dependsOn 'jquerygridlocale'
		resource url: 'js/jquery.jqGrid.min.js', disposition: 'head'
	}
	jquerygridlocale{
		resource url: 'js/i18n/grid.locale-en.js', disposition: 'head'
	}
	
	categoryHierarchyStructure{
		dependsOn 'application'
		resource url: 'js/renderHierarchyStructureToHTML.js'
		resource url: 'css/hierarchy.css'
		
	}
	treeselect{
		dependsOn 'application'
		resource url:'js/jquery.treeselect.js'
		resource url:'js/jquery.chosentree.js'
		resource url:'css/treeselect.css'
		resource url:'css/chosentree.css'
	}
	
	jstree{
		dependsOn 'application'
		resource url:'js/jstree/jstree.js'		
		resource url:'js/jstree/themes/default/style.css'
	}
	chosen{
		dependsOn 'application'
		resource url:'js/chosen/chosen.jquery.js'
		resource url:'js/chosen/chosen.css'
	}
	jqueryfiledownload{
		dependsOn 'application'
		resource url: 'js/jquery.fileDownload.js', disposition: 'head'
	}
}