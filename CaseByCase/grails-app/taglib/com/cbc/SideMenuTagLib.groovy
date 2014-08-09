package com.cbc


class SideMenuTagLib {
	def cbcApiService
	def sideMenu = {attrs, body ->
		println attrs?.default

		def menuLink = "../layouts/" + cbcApiService.getSideMenuName(attrs?.default)
		out << render(template:menuLink)
		
	}
}
