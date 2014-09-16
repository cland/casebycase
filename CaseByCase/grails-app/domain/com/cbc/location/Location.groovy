
package com.cbc.location

class Location {
	Country country
	Region region
	District district
	Municipality municipality
	MainPlace mainplace
	Suburb suburb
	String township
	String description
    static constraints = {
		township blank:true, nullable:true
		description blank:true,nullable:true
	}
	String toString(){
		"Country:${country},Region:${region},District:${district},Municipality:${municipality},MainPlace:${mainplace},Suburb:${suburb}"
	}
	def beforeInsert = {
		
	}
	def beforeUpdate = {
		
	}

	
	def onLoad = {
		// your code goes here
	}
	
	
} //end class

