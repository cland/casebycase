package com.cbc

class User {

	transient cbcApiService
	transient springSecurityService

	/** Tab1: Login Details **/
	//**Fieldset basic details
	String username
	String password
	String email

	//**Fieldset Access Rights
	boolean enabled = true
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
	/** *END FIELDS* **/
	static transients = ['springSecurityService','authorities',"createdByName","lastUpdatedByName"]

	static constraints = {
		username blank: false, unique: true
		password blank: false
		email nullable:true,blank:false, email:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		history nullable:true,editable:false
	}

	static mapping = {
		password column: '`password`'
	}
	String getCreatedByName(){
		User user = User.get(createdBy)
		return (user==null?"unknown":user?.person.toString())
	}
	String getLastUpdatedByName(){
		User user = User.get(lastUpdatedBy)
		return (user==null?"unknown":user?.person.toString())
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
	Set<RoleGroup> getAuthorities() {
		UserRoleGroup.findAllByUser(this).collect { it.roleGroup }
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
