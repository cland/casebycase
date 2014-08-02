package com.cbc

class Citizenship {
	String name
    static constraints = {
		name  unique:true
    }
	
	String toString(){
		"$name"
	}
}
