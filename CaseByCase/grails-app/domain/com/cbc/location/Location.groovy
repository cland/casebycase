
package com.cbc.location

class Location {
	Country country
	Region region
	District district
	Municipality municipality
	MainPlace mainplace
	Suburb suburb
	
    static constraints = {
		
	}
	String toString(){
		""
	}
	def beforeInsert = {
		
	}
	def beforeUpdate = {
		
	}

	
	def onLoad = {
		// your code goes here
	}
	
	
} //end class

