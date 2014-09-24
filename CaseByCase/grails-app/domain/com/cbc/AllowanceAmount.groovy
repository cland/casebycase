
package com.cbc

class AllowanceAmount {
	transient cbcApiService
	BigDecimal nightWork
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
		nightWork defaultValue : new Double(0.0)
	}
	String toString(){
		nightWork?.toString()
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
