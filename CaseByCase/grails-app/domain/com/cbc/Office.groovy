package com.cbc

class Office {

	String name
	String code
	String status
	String contactNumber
	String faxNumber
	String cellphoneNumber
	//MunicipalAreaDefinition municipalAreaDefinition
	//static mappedBy = [staffList:'staff',clientList:'clients']
	static belongsTo = []
	static hasMany = [cases: Case, staff:Person,  affiliates:Organization]
	
    static constraints = {
		name unique:true, blank:false
		code unique:true, blank:false
		status blank:false, inList: ["Active", "Inactive"]
		contactNumber nullable:true,blank:false, matches: "[0-9]*"
		cellphoneNumber nullable:true, matches: "[0-9]*"
		faxNumber nullable: true, blank:true		
    }
	
	String toString(){
		return name + "(" + code + ")"
	}
}
