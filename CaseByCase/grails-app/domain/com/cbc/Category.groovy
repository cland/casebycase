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
		"lastUpdatedByName",
		"level",
		"hasChildren"
	]

	static hasMany = [categories:Category]
	static belongsTo = [Category]
	static constraints = {
		name blank:false
		category blank:true, nullable:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
	}

	int getLevel(Category cat){
		if(!cat || cat?.id == 1) return 0
		return getLevel(cat?.category) + 1
	}
	def getNodeChildren(){
		if(!hasChildren()) return []
		return categories*.toTreeMap()
	}
	boolean hasChildren(){
		return (categories?.size() > 0)
	}
	def toTreeMap(){
		return [id:id,
			title:name,
			has_children:hasChildren(),
			level:getLevel(this),
			children:getNodeChildren(),
			value:id,
			link:''
			]
	}
	
	String toString(){
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
