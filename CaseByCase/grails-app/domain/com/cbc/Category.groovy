package com.cbc

import java.util.Date;
//comment
class Category {
	def cbcApiService
	/** Tab 1 **/
	String name
	Category category

	/** Tab 2**/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated

	static transients = [
		"createdByName",
		"lastUpdatedByName"
	]

	static hasMany = [categories:Category]
	static belongsTo = [Category]
	static constraints = {
		name blank:false
		category blank:true, nullable:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
	}

	String toString(){
		/*boolean checkCategory = false
		 Category current = this
		 String itemString = ""
		 while(!checkCategory){
		 Category parent = current.category
		 if(parent !=null){
		 itemString = parent.name + "-" + itemString
		 }else{ 
		 checkCategory = true
		 }
		 current = parent
		 }
		 itemString += this.name
		 return itemString*/
		return name
	}

	String getCreatedByName(){
		User user = User.get(createdBy)
		return user==null?"unknown":user.username
	}

	String getLastUpdatedByName(){
		User user = User.get(lastUpdatedBy)
		return user==null?"unknown":user.username
	}

	def beforeInsert = {
		createdBy = cbcApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = cbcApiService.getCurrentUserId()
	}
}
