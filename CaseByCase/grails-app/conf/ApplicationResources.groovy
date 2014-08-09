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
}