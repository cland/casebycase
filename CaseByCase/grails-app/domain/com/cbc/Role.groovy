package com.cbc

class Role {

	String authority
	String description
	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
		description nullable:true
	}
	String toString(){
		(!description?.equals("")? description : authority)
	}
}
