package com.cbc

import java.util.Date;

class Image {
	transient cbcApiService
	String name
	String caption
	String description
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	
	static attachmentable = true
	static hasMany = [locations:String]
	static constraints = {
		name (unique: true )
		caption(nullable:true)
		description(nullable:true)
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
} //end class