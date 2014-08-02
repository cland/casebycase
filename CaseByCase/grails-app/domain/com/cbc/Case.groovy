package com.cbc

import java.util.Date;

class Case {
	int totalMale
	int totalFemale
	int totalUnknown
	String issueNumber
	Date dateOpen
	Date problemStart
	String description
	String subject
	Event thisevent
	static belongsTo = [office:Office]
	static hasMany = [clients: Person,orgclients:Organization,actions:Action]
    static constraints = {
		thisevent nullable:true
    }
	static mapping = {
		table 'issue'  //def tableName = GrailsDomainBinder.getMapping(Case).table.name 
	}
}
