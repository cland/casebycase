
package com.cbc.lookup
import com.cbc.*
class ProblemType {
	transient cbcApiService
	String name
	String label
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
		label blank:true,nullable:true
		lastUpdatedBy nullable:true
		createdBy nullable:true
	}
	static mapping = {
		sort name: "asc"
	}
	String toString(){
		(label?label:name)
	}
	def beforeInsert = {
		createdBy = cbcApiService.getCurrentUserId()
		if(label == "" | label == null) label = name
	}
	def beforeUpdate = {
		lastUpdatedBy = cbcApiService.getCurrentUserId()
		if(!label) label = name
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
	
	
} //end class
import java.util.Date
