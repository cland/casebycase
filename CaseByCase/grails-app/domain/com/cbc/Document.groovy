package com.cbc

import java.util.Date;

class Document {
	transient cbcApiService
	String name
	String docType
	String content
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static attachmentable = true
	static constraints = {
		name(blank:false,unique:true)
		content(nullable:true)
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		docType(nullable:true)
	}
	static mapping = {
		content sqlType: "longtext"
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