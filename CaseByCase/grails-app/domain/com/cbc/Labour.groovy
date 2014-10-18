
package com.cbc

class Labour {
	transient cbcApiService
	static attachmentable = true
	WorkHours workhours
	LeaveDays leavedays
	AllowanceAmount allowAmount
	BenefitsAmount allowBenefit
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
	String specifyWorkUnion
	String memberOfWorkUnion
	ProblemType wages
	ProblemType leaveProblem
	ProblemType allowProblem
	ProblemType benefitsProblem
	ProblemType healthAndSafety
	ProblemType dismisal
	ProblemType uif
	//Integer workHours

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
		hoursWorked nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		earnings nullable: true, blank: true, inList: ["Weekly", "Fortnightly", "Monthly"]
		leavedays nullable: true, blank: true
		workhours nullable: true, blank: true
		earningsValue nullable:true, blank:true
		hoursWorkedValue nullable:true, blank:true
		specifyMembership nullable:true, blank:true
		wages nullable:true, blank:true
		leaveProblem nullable:true, blank:true
		allowProblem nullable:true, blank:true
		benefitsProblem nullable:true, blank:true
		healthAndSafety nullable:true, blank:true
		dismisal nullable:true, blank:true
		uif nullable:true, blank:true
		allowAmount nullable:true, blank:true
		allowBenefit nullable:true, blank:true
		specifyWorkUnion nullable:true, blank:true
	}
	def toMap(params=null){
		return [id:id,
			workhours:workhours?.toMap(),
			leavedays:leavedays?.toMap(),
			allowamount:allowAmount,
			allowbenefits:allowBenefit,
			tradeunionmember:tradeUnionMember,
			specifymembership:specifyMembership,
			workunion:unionAtWork,
			specifyworkunion:specifyWorkUnion,
			workunionmember:memberOfWorkUnion,
			wages:wages,
			leave:leaveProblem,
			allowance:allowProblem,
			benefits:benefitsProblem,
			health:healthAndSafety,
			dismisal:dismisal,
			uif:uif,
			hoursworked: "${hoursWorked} ${hoursWorkedValue}",
			earnings: "${earningsValue} ${earnings}",
			datecreated:dateCreated?.format("dd-MMM-yyyy"),
			createdby:getCreatedByName(),
			datelastupdated:lastUpdated?.format("dd-MMM-yyyy"),
			lastupdatedby:getLastUpdatedByName(),
			params:params]
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
