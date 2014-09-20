
package com.cbc.lookup
import com.cbc.*
class Benefit {
	transient cbcApiService
	String name
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static transients = ["createdByName","lastUpdatedByName"]
    static constraints = {
		name unique:true
		lastUpdatedBy nullable:true
		createdBy nullable:true
	}
	String toString(){
		"${name}"
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
