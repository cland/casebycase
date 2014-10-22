package com.cbc

import java.util.Date;

class Funder {
	transient cbcApiService
	static attachmentable = true
	String name
	String workNumber
	String cellphone
	BigDecimal amount
	Date periodFrom
	Date periodTo	
	String funderType
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static belongsTo = [event:Event]
	static hasMany = [persons:Person,orgs:Organisation]
	
    static constraints = {
		workNumber nullable:true, matches: "[0-9]*"
		cellphone nullable:true, matches: "[0-9]*"
		amount nullable:true, min:0.0
		periodFrom nullable:true
		periodTo nullable:true
		funderType nullable:false, blank:false
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
