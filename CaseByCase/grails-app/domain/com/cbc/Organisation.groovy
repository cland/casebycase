package com.cbc

import java.util.Date;

class Organisation {
	transient cbcApiService
	static attachmentable = true
	String name
	String status
	String phoneNo
	String email
	boolean isMember
	boolean isHost
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static hasMany = [staff:Person]
	
    static constraints = {
		name unique:true, blank:false
		status blank:false, inList:["Active", "Inactive"]
		phoneNo nullable:true, blank:true, matches: "[0-9 ]*"
		email nullable:true, email:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
    }
	def beforeInsert = {
		createdBy = cbcApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = cbcApiService.getCurrentUserId()
	}
	/**
	 * To ensure that all attachments are removed when the "owner" domain is deleted.
	 */
	transient def beforeDelete = {
		withNewSession{
		  removeAttachments()
		}
	 }
	def onLoad = {
		// your code goes here
	}
	String toString(){
		return name 
	}
}
