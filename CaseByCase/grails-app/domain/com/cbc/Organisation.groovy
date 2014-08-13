package com.cbc

import java.util.Date;
import java.util.List;

class Organisation {
	transient cbcApiService
	static attachmentable = true
	String name
	String status
	String phoneNo
	String email
	boolean isMember
	boolean isHost
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static transients = ['adviceOfficeList','caseList']
	static hasMany = [staff:Person]
	
    static constraints = {
		name unique:true, blank:false
		status blank:false, inList:["Active", "Inactive"]
		phoneNo nullable:true, blank:true, matches: "[0-9 ]*"
		email nullable:true, email:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		email nullable:true,email:true
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
		return name 
	}
	def toAutoCompleteMap(){
		return [id:id,
		label:name + " (" + Status + ") | " + phoneNo + " | " + email,
		value:id,
		phoneno:phoneNo,
		email:email,
		status:status]
	}
	List getAdviceOfficeList(){
		//The office that this person belongs to
		def list = Office.createCriteria().list(){
			createAlias('affiliates',"a")
			eq('a.id',id)
		}
		
		return list
	}
	List getCaseList(){
		//The office that this person belongs to
		def list = Case.createCriteria().list(){
			createAlias('orgclients',"c")
			eq('c.id',id)
		}
		return list
	}
} //end class
