package com.cbc

class Event {

	String topic
	String number
	Date date
	String venue
	String description
	String objective
	int totalMale = 0
	int totalFemale = 0
	String outcome
	String eventType
	String focusArea
	Office office
	User user

	static hasMany = [funders:Funder]
    static constraints = {
		topic blank:false
		number blank:false, unique:true
		date blank:false
		venue nullable:true
		description blank:false
		objective nullable:true
		totalMale blank:false
		totalFemale blank:false
    }
	
	String toString(){
		return topic + "(" + number + ")"
	}
}
