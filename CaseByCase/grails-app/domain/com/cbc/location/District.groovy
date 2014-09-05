package com.cbc.location

class District {
	String name
	String code
	
	static hasMany = [municipalities:Municipality]
	static belongsTo = [region:Region]
    static constraints = {
		name blank:false, unique:true
		code blank:false, unique:true
    }
	String toString(){
		"${name}"
	}
}
