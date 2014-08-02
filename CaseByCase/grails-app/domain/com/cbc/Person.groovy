package com.cbc

import java.util.Date;

class Person {
	static searchable = {
		spellCheck "include"
	}
	transient springSecurityService
	String firstName
	String lastName
	String contactNumber
	Date dateOfBirth
	String gender
	String idNumber
	Race race
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	Citizenship citizenship
	static belongsTo = [office:Office]
	static transients = [ 'mediumDetails','shortDetails','firstLastName','lastFirstName','age' ]
	static attachmentable = true
    static constraints = {
		firstName blank:false
		lastName blank:false
		dateOfBirth blank:true, nullable:true
		contactNumber matches: "[0-9]*"
		gender inList: ["Male", "Female", "Unknown"]
		idNumber  blank:true, unique:true	
		race blank:true, nullable:true		
    }
	
	String toString(){
		return firstName + " " + lastName
	}
	public getShortDetails(){
		toString() + " (${gender})"
	}
	public String getMediumDetails(){
		toString() + "${gender} | ${race})"
	}
	public String getLastFirstName(String s = " "){
		"${lastName}" + s + "${firstName}"
	}
	public String getFirstLastName(String s = " "){
		"${firstName}" + s + "${lastName}"
	}
	/**
	 * To ensure that all attachments are removed when the "onwer" domain is deleted.
	 */
	transient def beforeDelete = {
		withNewSession{
		  removeAttachments()
		}
	  }
	public getAge(){
		if(dateOfBirth == null){
			return 0
		}
		def now = new GregorianCalendar()
		Integer birthMonth = dateOfBirth.getAt(Calendar.MONTH)
		Integer birthYear = dateOfBirth.getAt(Calendar.YEAR)
		Integer birthDate = dateOfBirth.getAt(Calendar.DATE)
		Integer yearNow = now.get(Calendar.YEAR)

		def offset = new GregorianCalendar(
				yearNow,
				birthMonth-1,
				birthDate)
		return (yearNow - birthYear - (offset > now ? 1 : 0))
	}
} //end class
