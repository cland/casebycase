package com.cbc

import grails.transaction.Transactional

@Transactional
class AutoCompleteService {
	def cbcApiService
	def searchPeople(params){
		Office office = cbcApiService.getUserPrimaryOffice()
		def term = params?.term + "%"
		def query = {
			or {
				ilike("firstName", term )
				ilike("lastName", term)
				ilike("idNumber","%" + term)
			}
			eq('office.id',office?.id)
		}
		def clist = Person.createCriteria().list(query)
		def selectList = []
		clist.each {
			selectList.add(it.toAutoCompleteMap()) 
		}
		return selectList
	} //end searchPeople
	
	def searchOrgs(params){
		Office office = cbcApiService.getUserPrimaryOffice()
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
