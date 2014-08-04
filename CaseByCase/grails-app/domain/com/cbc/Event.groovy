package com.cbc

import java.util.Date;

class Event {
	transient cbcApiService
	static attachmentable = true
	String topic
	String number
	Date date
	String venue
	String description
	String objective
	int totalMale = 0
	int totalFemale = 0
	String outcome
	String eventType
	String focusArea
	Office office
	User user
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static hasMany = [funders:Funder]
    static constraints = {
		topic blank:false
		number blank:false, unique:true
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
		return topic + "(" + number + ")"
	}
}
