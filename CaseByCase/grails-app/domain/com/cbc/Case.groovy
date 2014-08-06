package com.cbc

import java.util.Date;

class Case {
	transient cbcApiService
	static attachmentable = true
	/** Tab1: Quick Details **/
	int totalMale
	int totalFemale
	int totalUnknown
	String caseNumber
	Date dateOpen
	Date problemStart
	String description
	String subject
	
	CasePriority priority
	/** Tab2: Categorisation **/
	
	//String category   	
	boolean childHeadedHouse
	boolean specialCase
	CaseStatus status
	Event thisevent		//if this case was created as a result of an event
	
	/** Tab4: Outcome **/
	Date dateClosed
	CaseOutcome outcome		//** Why closed
	Double amtRecovered
	boolean bestPractice
	
	/** Tab5: Case Metrics **/
	
	/** Tab6: Supporting Documents **/
	
	/** Tab7: Admin Tracking Information **/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	
	/** 	*END FIELDS* 		**/
	
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
