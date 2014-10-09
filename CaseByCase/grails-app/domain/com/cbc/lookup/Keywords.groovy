package com.cbc.lookup

import java.util.Date;

import javax.management.modelmbean.RequiredModelMBean;

class Keywords {
	transient cbcApiService
	String name
	String label
	String category
	String description
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static hasMany = [values:Keywords]
	static constraints = {
		name(unique:true)
		category(nullable:true)
		description(nullable:true) 
		label blank:true,nullable:true		
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
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
		(label?label:name)
	}
} //end class