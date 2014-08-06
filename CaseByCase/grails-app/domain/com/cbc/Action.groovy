package com.cbc

import java.util.Date;

class Action {
	transient cbcApiService
	static attachmentable = true
	/** Tab1: Action Details **/
	Date date
	ActionType actionType
	String actionToFrom
	String description
	String subject
	User actionOwner		//person responsible for the case
	String followUpStatus
	Date followUpDate
	double disbursementAmount
	boolean isPrivate
	
	/** Tab2: Supporting Documents **/
	
	/** Tab3: Admin Tracking Information **/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	
	/** 	*END FIELDS* 		**/
	
	static belongsTo = [thiscase:Case]
	static hasMany = [followers:User]
    static constraints = {
		date blank:false
		actionToFrom nullable:true
		description blank:false
		subject blank:false
		followUpStatus inList:["Done","Open","Case Closed"], blank:false
		disbursementAmount nullable:true
		isPrivate nullable:true
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
		return subject
	}
}
