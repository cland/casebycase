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
	def toMap(params = null){
		return [id:id,
			caseid:thiscase?.id,
			actiondate:date?.format("dd-MMM-yyyy"),
			subject:subject,
			description:description,
			actiontype:actionType,
			caseworker:actionOwner.getFullname(),
			status:followUpStatus,
			followupdate: followUpDate?.format("dd-MMM-yyyy"),
			disbursement:disbursementAmount,
			isprivate:isPrivate,
			datecreated:dateCreated?.format("dd-MMM-yyyy"),
			createdby:getCreatedByName(),
			datelastupdated:lastUpdated?.format("dd-MMM-yyyy"),
			lastupdatedby:getLastUpdatedByName(),
			params:params
			]
	}
	static transients = ["createdByName","lastUpdatedByName"]
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
	String getCreatedByName(){
		User user = User.get(createdBy)
		return (user==null?"unknown":user?.person.toString())
	}
	String getLastUpdatedByName(){
		User user = User.get(lastUpdatedBy)
		return (user==null?"unknown":user?.person.toString())
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
