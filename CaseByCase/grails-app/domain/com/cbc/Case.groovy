package com.cbc

import java.util.Date;
import org.joda.time.DateTime
import org.joda.time.Days
import org.joda.time.Period
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
	static transients = ["createdByName","lastUpdatedByName",
		"timeLapsed",
		"timeToResolve",		
		"totalActions",
		"totalConsultations",
		"totalClientsAffected",
		"problemLasted"]
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
		caseNumber unique:'office'
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
	
	/** Case Matrics **/
	def getTimeLapsed(){
		//today - date case opened
		def days = 0
		
		try{
			def startdate = dateOpen
			if(!startdate) startdate = dateCreated			
			DateTime tmp = new DateTime(startdate)
			
			def today = new DateTime()
			Days result = Days.daysBetween(tmp, today);
			days = result.days
			if(days < 0) days = 0
			
		}catch(Exception e){
			days = -1
		}
		return days  //Days
	}
	def getTimeToResolve(){
		//dateclosed - dateOpen
		def days = 0
		
		try{
			def todate = dateClosed
			if(!todate) todate = lastUpdated
			def frmdate = dateOpen
			if(!frmdate) frmdate = dateCreated
			DateTime to = new DateTime(todate)
			DateTime frm = new DateTime(frmdate)	
			println(frm.toDate().toString() + " - " + to.toDate().toString())		
			Days result = Days.daysBetween(frm, to);
			days = result.days
			if(days < 0) days = 0
		}catch(Exception e){
			days = -1
		}
		return days  //Days	
	}
	def getProblemLasted(){
		//casedate - casedatestarted
		def days = 0
		
		try{
			def todate = dateOpen
			if(!todate) todate = dateCreated
			def frmdate = problemStart
			if(!frmdate) frmdate = dateOpen
			
			DateTime to = new DateTime(todate)
			DateTime frm = new DateTime(frmdate)
			Days result = Days.daysBetween(frm, to);
			days = result.days
			if(days < 0) days = 0
		}catch(Exception e){
			days = -1
		}
		return days  //Days
		return 0  //days 
	}
	def getTotalActions(){
		return actions?.size()
	}
	def getTotalConsultations(){
		ActionType t = ActionType.findByName("Consultation")
		return actions?.findAll { 				
			it.actionType?.id == t?.id
		
		}?.size()
	}
	def getTotalClientsAffected(){
		def total = totalFemale + totalMale + totalUnknown
		return total
	}
	/** END Case Matrics **/
	
	
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
		return caseNumber
	}
	
	def toMap(params=null){
		return [id:id,
			casenumber:caseNumber,
			subject:subject,
			dateopen:dateOpen?.format("dd-MMM-yyyy"),
			dateproblemstart:problemStart?.format("dd-MMM-yyyy"),
			description:description,
			totalmale:totalMale,
			totalfemale:totalFemale,
			totalunknown:totalUnknown,
			caseworker:assignedTo?.getFullname(),
			respondent:respondent,
			priority:priority,
			status:status,
			event:thisevent,
			specialcase:specialCase,
			outcome:outcome,
			dateclosed:dateClosed?.format("dd-MMM-yyyy"),
			amountrecovered:amtRecovered,
			bestpractice:bestPractice,
			datecreated:dateCreated?.format("dd-MMM-yyyy"),
			createdby:getCreatedByName(),
			datelastupdated:lastUpdated?.format("dd-MMM-yyyy"),
			lastupdatedby:getLastUpdatedByName(),
			labour:(labour?labour?.toMap():null),
			eviction:(eviction?eviction?.toMap():null),
			category:categories?.collect{it.getFullCategoryName(it)}?.join(","),
			params:params 
			]
	}
	def toAutoCompleteMap(){
		return [id:id,
		label:caseNumber + " (" + Status + ")",
		value:id,
		thiscase:this,
		category:office?.name]
	}

} //
