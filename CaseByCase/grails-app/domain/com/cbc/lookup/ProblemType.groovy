
package com.cbc.lookup
import com.cbc.*
class ProblemType {
	transient cbcApiService
	static attachmentable = true
	String name
	ProblemType problemType
	
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static transients = ["createdByName","lastUpdatedByName"]
	static hasMany = [problemTypes:ProblemType]
	static belongsTo = [ProblemType]
    static constraints = {
		problemType blank:true, nullable:true
		lastUpdatedBy nullable:true
		createdBy nullable:true
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
