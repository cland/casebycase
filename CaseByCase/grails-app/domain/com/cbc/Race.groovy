package com.cbc

import java.util.Date;

class Race {
	transient cbcApiService
	String name
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
    static constraints = {
		name()
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
		"${name}"
	}
} //end of class
