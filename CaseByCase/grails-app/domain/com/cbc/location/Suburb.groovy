package com.cbc.location

class Suburb {

	String name
	String code
	
	static belongsTo = [mainplace:MainPlace]
    static constraints = {
		name unique:true, blank:false
		code unique:true, blank:false
    }
	
	String toString(){
		return name
	}
}
