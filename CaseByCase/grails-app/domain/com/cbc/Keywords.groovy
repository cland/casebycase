package com.cbc

import java.util.Date;

import javax.management.modelmbean.RequiredModelMBean;

class Keywords {
	transient cbcApiService
	String name
	String category
	String description
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static hasMany = [values:String]
	static constraints = {
		name(unique:true)
		category(nullable:true)
		description(nullable:true) 
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
} //end class