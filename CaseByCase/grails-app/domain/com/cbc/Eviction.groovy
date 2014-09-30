
package com.cbc

class Eviction {
	transient cbcApiService
	static attachmentable = true
	String name
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	Integer yearsLived
	String networkMember
	String specify
	String landRights
	String councillorRole
	Integer dwellingsNum
	String dwellingsPayer
	String dwellingsImproved
	Integer improvementCosts
	String dwellingType
	Integer cows
	Integer chickens
	Integer goats
	Integer sheep
	Integer cats
	Integer dogs
	Integer horses
	Integer other
	String crops
	String grazing
	Double livestockVal
	Double cropsVal
	String elecSource
	String waterSource
	String graveAccess
	String primarySchools
	String highSchools
	String clinic
	String tradPractices
	String waterAccess
	String electricityAccess
	String consent
	String evictionEntity
	String evictionMethod
	String status
	String hasShelter
	String evictionDocs
	String threatType
	String threatIssuer
	String chargesLaid
	String caseDetails
	String designedOutcome
	String labourDispute
	String ccma
	Integer hoursWorked
	String hoursType
	Integer earnings
	String earningsType
	



	//static belongsTo=[thiscase:Case]
	static transients = ["createdByName","lastUpdatedByName"]
	static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
	    yearsLived nullable: true, blank: true
	    networkMember nullable: true, blank: true, inList: ["Yes", "No"]
		specify nullable: true, blank: true
		landRights nullable: true, blank: true, inList: ["Yes", "No"]
		councillorRole nullable: true, blank: true, maxSize: 255
		dwellingsNum nullable: true, blank: true
		dwellingsPayer nullable: true, blank: true
		dwellingsImproved nullable: true, blank: true, inList: ["Yes", "No"]
		improvementCosts nullable: true, blank: true
		dwellingType nullable: true, blank: true, inList: ["Yes", "No"]
		cows nullable: true, blank: true
		chickens nullable: true, blank: true
		goats nullable: true, blank: true
		sheep nullable: true, blank: true
		cats nullable: true, blank: true
		dogs nullable: true, blank: true
		horses nullable: true, blank: true
		other nullable: true, blank: true
		crops nullable: true, blank: true, maxSize: 255
		grazing nullable: true, blank: true, maxSize: 255
		livestockVal nullable: true, blank: true
		cropsVal nullable: true, blank: true
		elecSource nullable: true, blank: true
		waterSource nullable: true, blank: true
		graveAccess nullable: true, blank: true, inList: ["Yes", "No"]
		primarySchools nullable: true, blank: true, maxSize: 255
		highSchools nullable: true, blank: true, maxSize: 255
		clinic nullable: true, blank: true, maxSize: 255
		tradPractices nullable: true, blank: true, maxSize: 255
		waterAccess nullable: true, blank: true, inList: ["Yes", "No"]
		electricityAccess nullable: true, blank: true, inList: ["Yes", "No"]
		consent nullable: true, blank: true, inList: ["", "Should I use a lookup?"]
		evictionEntity nullable: true, blank: true, inList: ["Security Company","Lawyer", "Police"]
		evictionMethod nullable: true, blank: true, inList: ["Sherrif Present", "Police Present", "Police Assisted"]
		status nullable: true, blank: true, inList: ["Evicted", "Notice Served"]
		hasShelter nullable: true, blank: true, inList: ["Yes", "No"]
		evictionDocs nullable: true, blank: true
		threatType nullable: true, blank: true, inList: ["Verbal", "Physical"]
		threatIssuer nullable: true, blank: true, inList: ["Person in charge", "Owner"]
		chargesLaid nullable: true, blank: true, inList: ["Yes", "No"]
		caseDetails nullable: true, blank: true, maxSize: 255
		designedOutcome nullable: true, blank: true, maxSize: 255
		labourDispute nullable: true, blank: true, inList: ["Yes", "No"]
		ccma nullable: true, blank: true, inList: ["Yes", "No"]
		hoursWorked nullable: true, blank: true
		hoursType nullable: true, blank: true, inList: ["Weekly", "FortNightly", "Monthly"]
		earnings nullable: true, blank: true
		earningsType nullable: true, blank: true, inList: ["Weekly", "FortNightly", "Monthly"]
	}
	String toString(){
		"${name}"
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
import java.util.Date
