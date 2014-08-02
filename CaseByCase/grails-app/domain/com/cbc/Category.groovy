package com.cbc

class Category {

    String name
	Category category
	static hasMany = [categories:Category]
	static belongsTo = [Category]
    static constraints = {
		name blank:false
		category blank:true, nullable:true
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
}
