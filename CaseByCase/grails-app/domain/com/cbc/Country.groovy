package com.cbc

import java.util.Date;

class Country {
	transient cbcApiService
	static attachmentable = true
	String name
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static hasMany = [regions:Region]
	static constraints = {
		name(blank:false)
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
		"${name}"
	}
} //end of class
