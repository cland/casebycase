class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

       //"/"(view:"/index")
		"/"(controller:"home",action:"index")
		"/admin/technical" (view:"/admin/technical")
		"/admin/"(view:"/admin/index")
						
		"500"(view:'/error')
		"404"(view:'/error')
	}
}
