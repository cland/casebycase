
package com.cbc

class Eviction {
	transient cbcApiService
	static attachmentable = true

	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	Integer stayPeriod
	String networkMember
	String specifyNetwork
	String landRights
	String councillorRole
	
	
	/*** Environment Section ** */
	Integer dwellingsNum
	String dwellingsPayer
	String dwellingsImproved
	BigDecimal improvementCost
	//-Type of dwelling
	Keywords dwellingType  //dropdown
	//-Number of livestock:
	Livestock livestock		//fields
	String crops
	String grazing
	BigDecimal livestockVal
	BigDecimal cropsVal
	String elecSource
	String waterSource
	
	/****Social Issues ***/
	String graveAccess
	String primarySchools
	String highSchools
	String clinics
	String tradPracs
	
	/***Constitutional Rights***/
	String waterAccess
	String electricityAccess
	
	//- Consent to live on land:
	Keywords landConsentType	//dropdown
	
	/*** Actual Eviction Section ** */
	Keywords currentStatus
	String shelter
	//String threatIssuedBy checkBox list
	String chargesAgainstOccupiers
	String specifyOccupierCharge
	String chargesAgainstEvictors
	String specifyEvictorCharge
	String desiredOutcome
	String labourDispute
	String cCMAReferred
	String hoursWorked
	Integer hoursWorkedValue
	String earnings
	String earningsValue

	
	static hasMany = [evictionBy:Keywords, evictionMethod: Keywords, evictionDocuments: Keywords, threatType: Keywords, threatBy: Keywords]
	static transients = ["createdByName","lastUpdatedByName"]
	static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true		
		stayPeriod nullable:true, blank: true
		networkMember nullable:true, blank: true, inList: ["Yes", "No"]
		specifyNetwork nullable:true, blank: true
		councillorRole nullable:true, blank: true
		landRights nullable:true, blank: true, inList: ["Yes", "No"]
		dwellingsNum nullable:true, blank: true
		dwellingsPayer nullable:true, blank: true
		dwellingsImproved nullable:true, blank: true, inList: ["Yes", "No"]
		improvementCost nullable:true, blank: true
	   	livestock nullable:true 
		dwellingType nullable:true
		crops nullable:true, blank: true
		grazing nullable:true, blank: true
		livestockVal nullable:true, blank: true
		cropsVal nullable:true, blank: true
		elecSource nullable:true, blank: true
		waterSource nullable:true, blank: true
		graveAccess nullable:true, blank: true, inList: ["Yes", "No"]
		primarySchools nullable:true, blank: true
		highSchools nullable:true, blank: true  
		clinics nullable:true, blank: true
		tradPracs nullable:true, blank: true 
		waterAccess nullable:true, blank: true, inList: ["Yes", "No"]
		electricityAccess nullable:true, blank: true, inList: ["Yes", "No"]
		landConsentType nullable:true 
		currentStatus nullable:true
		shelter nullable:true, blank: true, inList: ["Yes", "No"] 
		chargesAgainstOccupiers nullable:true, blank: true, inList: ["Yes", "No"]
		specifyOccupierCharge nullable:true, blank: true
		chargesAgainstEvictors nullable:true, blank: true, inList: ["Yes", "No"]
		specifyEvictorCharge  nullable:true, blank: true
		desiredOutcome nullable:true, blank: true
		labourDispute nullable:true, blank: true, inList: ["Yes", "No"]		
		cCMAReferred nullable:true, blank: true, inList: ["Yes", "No"]
		hoursWorked nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		earnings nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		earningsValue nullable:true, blank:true
		hoursWorkedValue nullable:true, blank:true
	}
	def toMap(){
		return [id:id,
			datecreated:dateCreated?.format("dd-MMM-yyyy")]
	}
	String toString(){
		id
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
	def onLoad = {
		// your code goes here
	}
	/**
	 * To ensure that all attachments are removed when the "owner" domain is deleted.
	 */
	transient def beforeDelete = {
		withNewSession{
			removeAttachments()
		}
	}

} //end class
import com.cbc.lookup.Keywords
import java.util.Date
