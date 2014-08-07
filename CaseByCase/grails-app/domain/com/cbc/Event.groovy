package com.cbc

import java.util.Date;

class Event {
	transient cbcApiService
	static attachmentable = true
	/** Tab1: Quick Details **/
	String topic
	User user		//case worker involved as the primary person. Any other will be registered as followers
	String refno	//reference number. Still needed???
	Date date
	String venue
	EventType eventType
	String description
	String objective
	EventOutcome outcome
	
	/** Tab2: Event Analysis **/
	int totalMale = 0
	int totalFemale = 0
	int femaleYouth = 0
	int maleYouth = 0
	EventParticipant eventParticipants
	/** Tab3: Supporting documents **/
	
	/** Tab4: Admin Tracking Information **/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	/** 	*END FIELDS* 		**/
	
	static belongsTo=[office:Office]
	static hasMany = [funders:Funder,followers:User, focusAreas:EventFocusArea]
    static constraints = {
		topic blank:false
		refno blank:false, unique:true
		date blank:false
		venue nullable:true
		description blank:false
		objective nullable:true
		totalMale blank:false
		totalFemale blank:false
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
		return topic + "(" + refno + ")"
	}
}
