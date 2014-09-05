package com.cbc.location

class MainPlace {
	String name
	String code
	static hasMany = [suburbs:Suburb]
	static belongsTo = [municipality:Municipality]
	static constraints = {
		name blank:false, unique:true
		code blank:false, unique:true
	}
	String toString(){
		"${name}"
	}    
}
