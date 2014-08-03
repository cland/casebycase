package com.cbc

class Organization {

	String name
	String status
	String phoneNo
	String email
	boolean isMember
	boolean isHost
	static hasMany = [staff:Person]
	
    static constraints = {
		name unique:true, blank:false
		status blank:false, inList:["Active", "Inactive"]
		phoneNo nullable:true
		email nullable:true
    }
	
	String toString(){
		return name + "(" + code + ")"
	}
}
