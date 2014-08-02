package com.cbc

import java.util.Date;

class City {
	transient cbcApiService
	String name
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static constraints = {
		name(blank:false)
		lastUpdatedBy nullable:true
		createdBy nullable:true
	}
	def beforeInsert = {
		createdBy = cbcApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = cbcApiService.getCurrentUserId()
	}
	def beforeDelete = {
		// your code goes here
	}
	def onLoad = {
		// your code goes here
	}

	String toString(){
		//TODO: "${name}"
	}
} //end class