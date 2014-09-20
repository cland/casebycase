
package com.cbc

class Labour {
	transient cbcApiService
	static attachmentable = true
	WorkHours workhours
	LeaveDays leavedays
	long createdBy   
	long lastUpdatedBy
	Date dateCreated 
	Date lastUpdated
	//static belongsTo=[thiscase:Case]
	static transients = ["createdByName","lastUpdatedByName"]
	
	String tradeUnionMember
	String specifyMembership
	String employerDetail
	String unionAtWork
	String memberOfWorkUnion
	ProblemType wages
	ProblemType leaveProblem
	ProblemType allowProblem
	ProblemType benefitsProblem
	ProblemType healthAndSafety
	ProblemType dismisal
	ProblemType uif
	//Integer workHours
	Double allowAmount
	Double allowBenefit
	String hoursWorked
	Integer hoursWorkedValue
	String earnings
	String earningsValue
	
	
	
	static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
		tradeUnionMember nullable: true, blank: true, inList: ["Yes", "No"]
		employerDetail nullable: true, blank: true
		unionAtWork nullable: true, blank: true, inList: ["Yes", "No"]
		memberOfWorkUnion nullable: true, blank: true, inList: ["Yes", "No"]
		//workHours nullable: true, blank: true
		allowAmount nullable: true, blank: true
		allowBenefit nullable: true, blank: true
		hoursWorked nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		earnings nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		leavedays nullable: true, blank: true
		workhours nullable: true, blank: true
		earningsValue nullable:true, blank:true
		hoursWorkedValue nullable:true, blank:true
		specifyMembership nullable:true, blank:true
	}
	String toString(){
		"${id}"
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

import com.cbc.lookup.ProblemType
import java.util.Date
