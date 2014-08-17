package com.cbc

import java.util.Date;

class User {
	def cbcApiService
	transient springSecurityService
	/** Tab1: Login Details **/
	//**Fieldset basic details
	String username
	String password
	String email
	
	//**Fieldset Access Rights 
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	/** Tab2: Personal Details **/
	Person person
	
	/** Tab3: Admin Tracking Information **/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	String history
	
	/** 	*END FIELDS* 		**/
	
	static transients = ["createdByName","lastUpdatedByName"]
	static belongsTo = []
	static hasMany = []	
	
	String toString(){
		return username
	}
	String getCreatedByName(){
		User user = User.get(createdBy)
		return (user==null?"unknown":user?.person.toString())
	}
	String getLastUpdatedByName(){
		User user = User.get(lastUpdatedBy)
		return (user==null?"unknown":user?.person.toString())
	}
	static constraints = {
		username blank: false, unique: true
		password blank: false, password:true
		email unique:true, blank:false, email:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		history nullable:true,editable:false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		UserRole.findAllByUser(this).collect { it.role } as Set
	}

	def beforeInsert() {
		encodePassword()
		long curId = cbcApiService.getCurrentUserId()
		createdBy = curId
		lastUpdatedBy = curId
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
		lastUpdatedBy = cbcApiService.getCurrentUserId()
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
	
	
}
