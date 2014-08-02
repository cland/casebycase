package com.cbc

class Suburb {

   String item
	
    static constraints = {
		item unique:true, blank:false
    }
	
	String toString(){
		return item
	}
}
