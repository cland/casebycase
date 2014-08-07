
package com.cbc

class AgeGroup {
	transient cbcApiService
	static attachmentable = true
	String name
	int upperAge
	int lowerAge
	String gender
	
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static transients = ["createdByName","lastUpdatedByName"]
    static constraints = {
		lowerAge min:0, max:55
		upperAge min:1, max: 150
		gender inList: Gender.list()
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
	/**
	 * To ensure that all attachments are removed when the "owner" domain is deleted.
	 */
	transient def beforeDelete = {
		withNewSession{
		  removeAttachments()
		}
	 }
	
} //end class
import java.util.Date
