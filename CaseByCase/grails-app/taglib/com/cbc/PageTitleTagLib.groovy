package com.cbc


class PageTitleTagLib {
	def appTitle = {attrs, body ->
		out << "cBc " + attrs.title
		out << " : " + body()
		}
	
}
