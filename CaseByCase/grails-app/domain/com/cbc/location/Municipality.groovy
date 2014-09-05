package com.cbc.location

class Municipality {
	String name
	String code
	static hasMany = [places:MainPlace]
	static belongsTo = [district:District]
    static constraints = {
		name blank:false, unique:true
		code blank:false, unique:true
    }
	String toString(){
		"${name}"
	}
}
