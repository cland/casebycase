
package com.cbc

class Eviction {
	transient cbcApiService
	static attachmentable = true

	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	
	/*** Environment Section ** */
	//-Type of dwelling
	Keywords dwellingType  //dropdown
	//-Number of livestock:
	Livestock livestock		//fields
	
	//- Consent to live on land:
	Keywords landConsentType	//dropdown
	
	/*** Actual Eviction Section ** */

	
	static hasMany = [evictionBy:Keywords]
	static transients = ["createdByName","lastUpdatedByName"]
	static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
		
	   	livestock nullable:true 
		dwellingType nullable:true
		landConsentType nullable:true
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
