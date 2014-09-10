
package com.cbc

class Labour {
	transient cbcApiService
	static attachmentable = true
	String name
	//WorkHours workhours
	//LeaveDays leavedays
	long createdBy   
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	//static belongsTo=[thiscase:Case]
	static transients = ["createdByName","lastUpdatedByName"]
	
	String tradeUnionMember
	String employerDetail
	String unionAtWork
	String memberOfWorkUnion
	String wages
	String leaveProblem
	String allowProblem
	String benefitsProblem
	String healthAndSafety
	String dismisal
	String uif
	Integer workHours
	Double allowAmount
	Double allowBenefit
	String hoursWorked
	String earnings
	
	
	
	static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
		tradeUnionMember nullable: true, blank: true, inList: ["Yes", "No"]
		employerDetail nullable: true, blank: true
		unionAtWork nullable: true, blank: true, inList: ["Yes", "No"]
		memberOfWorkUnion nullable: true, blank: true, inList: ["Yes", "No"]
		wages nullable: true, blank: true, inList: ["Unpaid", "underpaid", "Outstanding", "Illegal Deductions"]
		leaveProblem nullable: true, blank: true, inList: ["Annual", "Sick", "Maternity", "Family Responsibility"]
		allowProblem nullable: true, blank: true, inList: ["Night Work"]
		benefitsProblem nullable: true, blank: true, inList: ["Provident/Pension Fund Non-Contribution", "Provident/Pension Fund Non-Payment to Fund", "Provident Other"]
		healthAndSafety nullable: true, blank: true, inList: ["Workmen't Compensation"]
		dismisal nullable: true, blank: true, inList: ["Rentrenchment", "Work Performance", "Misconduct", "Contract"]
		uif nullable: true, blank: true, inList: ["Non-Contribution", "Non-Registration", "UI.19"]
		workHours nullable: true, blank: true
		allowAmount nullable: true, blank: true
		allowBenefit nullable: true, blank: true
		hoursWorked nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		earnings nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		//leavedays nullable: true, blank: true
		//workhours nullable: true, blank: true
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
