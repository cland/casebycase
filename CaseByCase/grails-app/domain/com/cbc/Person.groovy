package com.cbc
import org.apache.commons.collections.list.LazyList;
import org.apache.commons.collections.FactoryUtils;

import java.util.Date;
import java.util.List;
import java.util.Set;

class Person {
	transient groupManagerService
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
	String email
	//**Fieldset 2: Identity
	Citizenship citizenship
	Date dateOfBirth
	String idNumber
	//Office office
	/** Tab2: Person Profile **/
	String gender
	Race race
	
	/** Tab3: Contact Details **/
	List phones // = new ArrayList()
	
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
	static hasMany = [phones:Phone]
	static transients = [ 'mediumDetails',
		'shortDetails',
		'firstLastName',
		'lastFirstName',
		'age',
		'hasLoginDetails',
		'primaryOffice',
		'loginDetails',
		'authorities',
		'caseList' ]

	static mapping = {
		phones cascade:"all-delete-orphan"
	}
    static constraints = {
		firstName blank:false,nullable:true
		lastName blank:false,nullable:true
		title nullable:true
		knownAs nullable:true
		dateOfBirth blank:true, nullable:true
		gender inList: Gender.list() ,nullable:true
		idNumber  blank:true, unique:true ,nullable:true
		race blank:true, nullable:true	
		empHowJobFound nullable:true
		empHowJobFoundDesc nullable:true,widget:'textarea'		
		lastUpdatedBy nullable:true, editable:false
		createdBy nullable:true, editable:false
		history nullable:true,editable:false
		email nullable:true,email:true
		citizenship nullable:true 
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
	public boolean hasLoginDetails(){
		//work out if this person has a user account
		return (getLoginDetails() != null?true:false)
	}
	public User getLoginDetails(){
		return User.findByPerson(this)
	}
	public Office getPrimaryOffice(){
		//The office that this person belongs to
		def list = Office.createCriteria().list(){
			createAlias('staff',"s")
			eq('s.id',id)
		}
		
		if(list.size() > 0) office = list.get(0) 
		return office
	}

	public List getCaseList(){
		//The office that this person belongs to
		def list = Case.createCriteria().list(){
			createAlias('clients',"c")
			eq('c.id',id)
		}	
		return list
	}
	def toAutoCompleteMap(){
		Office office = getPrimaryOffice()
		return [id:id,
		label:firstName + " " + lastName + " | " + idNumber + " | " + dateOfBirth?.format("dd MMM yyyy"),
		value:id,
		person:(this==null?Person.get(id):this),
		category:(gender==null?"Unknown":gender),
		usergroups:getAuthorities(),
		officegroups:(office==null?null:office.getOfficeGroups())]
	}
	def getPhonesList() {
		return LazyList.decorate(
		phones,
		FactoryUtils.instantiateFactory(Phone.class))
	}
	public Set<RoleGroup> getAuthorities() {
		User u = getLoginDetails()
		if(!u) return []
		return u.authorities
	}
} //end class
