package com.cbc

import java.util.Date;

class Office {
	transient cbcApiService
	static attachmentable = true
	/** Tab1: Setup and Members List **/
	String name
	String code
	String status
	
	/** Tab2: Contact Details **/
	String contactNumber
	String faxNumber
	String cellphoneNumber
	//MunicipalAreaDefinition location
	String locationDesc
	
	/** Tab3: Admin Tracking Information **/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	String history
	/** 	*END FIELDS* 		**/
	
	static belongsTo = []
	static hasMany = [cases: Case, staff:Person, affiliates:Organisation]
	
    static constraints = {
		name unique:true, blank:false
		code unique:true, blank:false
		status blank:false, inList: ["Active", "Inactive"]
		contactNumber nullable:true,blank:false, matches: "[0-9 ]*"
		cellphoneNumber nullable:true, matches: "[0-9 ]*"
		faxNumber nullable: true, blank:true, matches: "[0-9 ]*"	
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		history nullable:true,editable:false
		locationDesc nullable:true,widget:'textarea'
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
		return name + " (" + code + ")"
	}
}
