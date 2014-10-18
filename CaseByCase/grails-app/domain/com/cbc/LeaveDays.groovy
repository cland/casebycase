
package com.cbc

class LeaveDays {
	transient cbcApiService
	static attachmentable = true
	Long annual
	Long sick
	Long maternity
	Long family
	//static belongsTo = [labour:Labour]
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static transients = ["createdByName","lastUpdatedByName"]
    static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
	}
	def toMap(params=null){
		return [id:id,
			annual:annual,
			sick:sick,
			maternity:maternity,
			family:family,
			params:params]
	}
	String toString(){
		"Annual: ${annual}"
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
