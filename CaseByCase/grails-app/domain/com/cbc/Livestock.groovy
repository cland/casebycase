
package com.cbc

class Livestock {
	transient cbcApiService

	Integer cow
	Integer chicken
	Integer sheep
	Integer goat
	Integer dog
	Integer cat
	Integer horse
	Integer other
	
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static transients = ["createdByName","lastUpdatedByName"]
    static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
	}
	static mapping = {
		cow defaultValue : 0
		chicken defaultValue : 0
		sheep defaultValue : 0
		goat defaultValue : 0
		dog defaultValue : 0
		cat defaultValue : 0
		horse defaultValue : 0
		other defaultValue : 0
	}
	String toString(){
		"Cows:${cow}, Chickens:${chicken}, Sheep:${sheep}, Goats:${goat}, Dogs:${dog}, Cat:${cat}, Horses:${horse}, Other:${other}"
	}
	def beforeInsert = {
		createdBy = cbcApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = cbcApiService.getCurrentUserId()
	}

	String getCreatedByName(){
		User user = User.get(createdBy)
		return (user==null?"unknown":user?.person.toString())
	}
	String getLastUpdatedByName(){
		User user = User.get(lastUpdatedBy)
		return (user==null?"unknown":user?.person.toString())
	}
	def onLoad = {
		// your code goes here
	}
	
	
} //end class
import java.util.Date
