package com.cbc

import java.util.Date;

class Category {

    String name
	Category category
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	static hasMany = [categories:Category]
	static belongsTo = [Category]
    static constraints = {
		name blank:false
		category blank:true, nullable:true
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
    }
	
	String toString(){
		boolean checkCategory = false
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
		return itemString
	}
	
	def beforeInsert = {
		createdBy = cbcApiService.getCurrentUserId()
	}
	def beforeUpdate = {
		lastUpdatedBy = cbcApiService.getCurrentUserId()
	}
}
