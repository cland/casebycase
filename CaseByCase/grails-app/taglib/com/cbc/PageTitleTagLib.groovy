package com.cbc


class PageTitleTagLib {
	def appTitle = {attrs, body ->
		def org = Organisation.find{isMember==true}
		def prefix = "cBc: "
		if(org?.name) prefix = org?.name + ": "
		out << prefix  + attrs.title
		out << " " + body()
		}
	
}
