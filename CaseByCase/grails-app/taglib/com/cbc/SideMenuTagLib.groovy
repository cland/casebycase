package com.cbc


class SideMenuTagLib {
	def cbcApiService
	def sideMenu = {attrs, body ->
		
		def menuLink = "../layouts/" + cbcApiService.getSideMenuName()
		out << render(template:menuLink)
		
	}
}
