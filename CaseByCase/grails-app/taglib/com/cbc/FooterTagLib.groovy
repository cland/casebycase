package com.cbc


class FooterTagLib {
	def thisYear = {
		out << new Date().format("yyyy")
		}
	def copyright = {attrs, body->
		out << "&copy; " + attrs.startYear
		if(thisYear() != attrs.startYear)	out << " - " + thisYear()
		out << " :: " + body()
		}
} //end class
