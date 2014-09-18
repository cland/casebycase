package com.cbc.location

import java.util.Date;
import java.util.List;

import com.cbc.RoleGroup;

class Region {
	transient groupManagerService
	transient cbcApiService
	String name
	String code
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static belongsTo = [country:Country]
	static hasMany = [cities:City,districts:District]
	static transients = ["regionGroups"]
	static constraints = {
		name(blank:false,unique:true)
		code blank:false,unique:true
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
		"${name}"
	}
	def toAutoCompleteMap(){
		return [id:id,
		label:name + " (" + code + ")",
		value:id,
		region:this,
		category:(country?.name ? country?.name : "Unknown")]
	}
	List<RoleGroup> getOfficeGroups(){
		return groupManagerService.getRegionGroups(this)
	}
} //end of class
