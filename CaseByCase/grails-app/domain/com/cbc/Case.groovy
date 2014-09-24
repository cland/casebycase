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
	User assignedTo
	String respondent
	CasePriority priority
	/** Tab2: Categorisation **/
	
	   	
	boolean childHeadedHouse
	boolean specialCase
	CaseStatus status
	Event thisevent		//if this case was created as a result of an event
	
	/** Tabs: labour and evictions **/
	 Labour labour
	 Eviction eviction
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
	
	//static hasOne=[labour:Labour,eviction:Eviction]
	static belongsTo = [office:Office]
	static hasMany = [clients: Person,orgclients:Organisation,actions:Action,categories:Category]
    static constraints = {		
		priority nullable:true
		status nullable:true
		specialCase nullable:true
		childHeadedHouse nullable:true		
		thisevent nullable:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		outcome nullable:true
		dateClosed nullable:true
		amtRecovered  nullable:true
		bestPractice nullable:true
		labour nullable:true
		eviction nullable:true
		amtRecovered nullable:true
		assignedTo nullable:true
		respondent nullable:true
		caseNumber unique:true
    }
	static mapping = {
		table 'issue'  //def tableName = GrailsDomainBinder.getMapping(Case).table.name 
		amtRecovered defaultValue : new Double(0.0)
		labour cascade:"all-delete-orphan"
		eviction cascade:"all-delete-orphan"
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
	
	def toAutoCompleteMap(){
		return [id:id,
		label:caseNumber + " (" + Status + ")",
		value:id,
		thiscase:this,
		category:office?.name]
	}
} //
