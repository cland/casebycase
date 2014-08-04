package com.cbc

import java.util.Date;

class Case {
	transient cbcApiService
	static attachmentable = true
	int totalMale
	int totalFemale
	int totalUnknown
	String caseNumber
	Date dateOpen
	Date problemStart
	String description
	String subject
	Event thisevent
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static belongsTo = [office:Office]
	static hasMany = [clients: Person,orgclients:Organisation,actions:Action]
    static constraints = {
		thisevent nullable:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
    }
	static mapping = {
		table 'issue'  //def tableName = GrailsDomainBinder.getMapping(Case).table.name 
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
		return caseNumber
	}
}
