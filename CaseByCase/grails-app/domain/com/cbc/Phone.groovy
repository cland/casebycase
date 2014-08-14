
package com.cbc

class Phone {
	int index
	String number
	PhoneType type
	boolean deleted
	
	static transients = [ 'deleted' ]
	static belongsTo = [ contact:Person]
	static constraints = {
		index(blank:false, min:0)
		number(blank:false)
		type(blank:false, inList:PhoneType.list(), minSize:1, maxSize:1)
	}
	static mapping = {
		index column:"phone_index"
	}
	def String toString() {
		return "($index) ${number} - ${type.value}"
	}
	
} //end class

