class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

       //"/"(view:"/index")
		"/"(controller:"home",action:"index")
		"/admin/"(view:"/admin/index")
		"/admin/technical" (view:"/admin/technical")				
		"500"(view:'/error')
		"404"(view:'/error')
	}
}
