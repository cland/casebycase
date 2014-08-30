package com.cbc

import grails.transaction.Transactional

@Transactional
class AutoCompleteService {

	def searchPeople(params){
		def term = params?.term + "%"
		def query = {
			or {
				ilike("firstName", term )
				ilike("lastName", term)
				ilike("idNumber","%" + term)
			}
		}
		def clist = Person.createCriteria().list(query)
		def selectList = []
		clist.each {
			selectList.add(it.toAutoCompleteMap()) 
		}
		return selectList
	} //end searchPeople
	
	def searchOrgs(params){
		def term = params?.term + "%"

		def query = {
			or {
				ilike("name", term )
				ilike("email", term)
			}
		}
		def clist = Organisation.createCriteria().list(query)
		def selectList = []
		clist.each {
		selectList.add(it.toAutoCompleteMap()) 
		}
		return selectList
	} //end searchOrgs
	

} //end class
