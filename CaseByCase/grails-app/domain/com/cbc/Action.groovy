package com.cbc

class Action {

	Date date
	String actionToFrom
	String description
	String subject
	String followUpStatus
	Date followUpDate
	double disbursementAmount
	boolean isPrivate

	String actionType
	static belongsTo = [thiscase:Case]
	
    static constraints = {
		date blank:false
		actionToFrom nullable:true
		description blank:false
		subject blank:false
		followUpStatus inList:["Done","Open","Case Closed"], blank:false
		disbursementAmount nullable:true
		isPrivate nullable:true
		
    }
	
	String toString(){
		return subject
	}
}
