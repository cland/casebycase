package com.cbc

class Funder {

	String name
	String workNumber
	String cellphone
	double amount
	Date periodFrom
	Date periodTo	
	String funderType
	static belongsTo = [event:Event]
	static hasMany = [persons:Person,orgs:Organization]
	
    static constraints = {
		workNumber nullable:true, matches: "[0-9]*"
		cellphone nullable:true, matches: "[0-9]*"
		amount nullable:true
		periodFrom nullable:true
		periodTo nullable:true
		funderType nullable:false, blank:false
    }
	
	String toString(){
		return name
	}
}
