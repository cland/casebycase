
package com.cbc

class Pcm {
	transient cbcApiService
	static attachmentable = true
	
	//PCM details from the external pcm system
	Date pcmDate
	String sender
	String content
	String receiver
	
	//Client details
	String name		
	AgeGroup agegroup
	
	Location location
	
	//Case
	String description
	String referredBy
	Office referredTo
	
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static transients = ["createdByName","lastUpdatedByName"]
    static constraints = {
		lastUpdatedBy nullable:true
		createdBy nullable:true
		location nullable:true
		receiver nullable:true
	}
	String toString(){
		"${name} ${sender}"
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
import com.cbc.location.Location
import com.cbc.location.Region;

