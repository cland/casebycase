package com.cbc

import java.util.Date;
//comment
class Category {
	def cbcApiService
	/** Tab 1 **/
	String name
	Category parent

	/** Tab 2**/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated

	static transients = [
		"createdByName",
		"lastUpdatedByName",
		"level",
		"hasChildren",
		"fullCategoryName"
	]

	static hasMany = [categories:Category]
	static belongsTo = [Category]
	static constraints = {
		name blank:false
		parent blank:true, nullable:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
	}

	int getLevel(Category cat){
		if(!cat || cat?.id == 1) return 0
		return getLevel(cat?.parent) + 1
	}
	String getFullCategoryName(Category cat){
		if(!cat || cat?.id == 1) return ""
		String _val = getFullCategoryName(cat?.parent)
		return (_val.equals("") ? cat?.name :  _val + "~" + cat?.name)
	}
	Category getParentCategoryAtLevel(Category cat, int level){
		int l = getLevel(cat)
		if(level >= l) return cat
		return getParentCategoryAtLevel(cat?.parent,level)
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
			text:name,
			state:[opened:false,disabled:false,selected:false]			
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
