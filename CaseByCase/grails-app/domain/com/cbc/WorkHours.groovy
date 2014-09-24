
package com.cbc

class WorkHours {
	transient cbcApiService
	long overtime
	long daily
	long weekend
	long holiday
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated

	static transients = ["createdByName","lastUpdatedByName"]
    static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
		overtime nullable:true
		daily nullable:true
		weekend nullable:true
		holiday nullable:true 
	}
	
	String toString(){
		"Overtime: ${overtime}, Daily: ${daily}"
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
