package com.cbc

import java.util.Date;

class Person {
	transient cbcApiService
	static attachmentable = true
	static searchable = {
		spellCheck "include"
	}

	/** Tab1: Quick Details fields **/
	//**Fieldset 1: basic details
	String firstName
	String lastName
	String knownAs
	String title
	//**Fieldset 2: Identity
	Citizenship citizenship
	Date dateOfBirth
	String idNumber
	
	/** Tab2: Person Profile **/
	String gender
	Race race
	
	/** Tab3: Contact Details **/
	String contactNumber
	
	/** Tab4: Employment Profile **/
	String empHowJobFound
	String empHowJobFoundDesc
	
	/** Tab5: Supporting Documents **/
	
	/** Tab6: Admin Tracking Information **/
	long createdBy
	long lastUpdatedBy
	Date dateCreated
	Date lastUpdated
	String history
	
	/** 	*END FIELDS* 		**/
	
	static belongsTo = [office:Office]
	static transients = [ 'mediumDetails','shortDetails','firstLastName','lastFirstName','age' ]

    static constraints = {
		firstName blank:false
		lastName blank:false
		title nullable:true
		knownAs nullable:true
		dateOfBirth blank:true, nullable:true
		contactNumber matches: "[0-9]*"
		gender inList: ["Male", "Female", "Unknown"]
		idNumber  blank:true, unique:true	
		race blank:true, nullable:true	
		empHowJobFound nullable:true
		empHowJobFoundDesc nullable:true,widget:'textarea'		
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		history nullable:true,editable:false
    }
	def beforeInsert = {
		createdBy = cbcApiService.getCurrentUserId()
		if(idNumber == null || idNumber?.equals("")){
			idNumber = cbcApiService.generateIdNumber(dateOfBirth)
		}
	}
	def beforeUpdate = {
		lastUpdatedBy = cbcApiService.getCurrentUserId()
	}
	/**
	 * To ensure that all attachments are removed when the "owner" domain is deleted.
	 */
	transient def beforeDelete = {
		withNewSession{
		  removeAttachments()
		}
	 }
	def onLoad = {
		// your code goes here
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
