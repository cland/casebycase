package com.cbc

import grails.plugins.springsecurity.Secured

class HomeController {
	def cbcApiService
	def index = {
//		if (!isLoggedIn()) {
//			redirect(controller:"Login")
//			return false;
//		}
		//redirect(action: "inde", params: params)
		
	}

	def aboutus = {
		render (view:"aboutus")
	}
	def contactus = {
		render (view:"aboutus")
	}
	def news = {
		render (view:"news")
	}
	def cbc = {
		//determine who is currently logged in and redirect them to the appropriate section:
		//admin: to the admin section
		String link = cbcApiService.getHomeLink()
		redirect(uri:link)
	}
} //end of class
