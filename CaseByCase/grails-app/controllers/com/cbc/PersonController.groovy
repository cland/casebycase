package com.cbc

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import com.cbc.location.Location
import com.cbc.lookup.Keywords
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;

@Transactional(readOnly = true)
class PersonController {
	def autoCompleteService
	def cbcApiService
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE", dialogsave: "POST", dialogsave: "POST"]

    def index(Integer max) {
        params.max = Math.min(max ?: 30, 100)
		def results = cbcApiService.getClients(params)
        respond results, model:[personInstanceCount: results.totalCount]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def create() {
        respond new Person(params)
    }

    @Transactional
    def save(Person personInstance) {
		println("=====> RUNNING........ " + personInstance)
		println(params)
        if (personInstance == null) {
            notFound()
            return
        }	
		bindData(personInstance, params, [exclude: 'dateOfBirth'])
		bindData(personInstance, ['dateOfBirth': params.date('dateOfBirth', ['dd-MMM-yyyy'])], [include: 'dateOfBirth'])
		
		//** Adding phones to personInstance
		int index = 0
		int cnt = 0
		List phones = []
		def pEntry = params.get('phones[' + index + ']')
		println("=====> PHONES........ ")
		while(pEntry != null){			
			Phone p = new Phone(pEntry)	
			boolean isDeleted = pEntry.boolean("deleted")
			if(!isDeleted){
				try{		
					p?.index = cnt					
					phones.add(p)
					cnt++
				}catch(Exception e){
					println("exception")
				}
			}
			//next p
			index++
			
			pEntry = params.get('phones[' + index + ']')
		}
		
		println("=====> Adding LOCATION........ " + personInstance)
		try{
//			Location location = cbcApiService.saveLocation(params)
//			if(location){
//				personInstance.location = location
//				personInstance = personInstance.merge()		
//			}		
			println(personInstance)
		}catch(Exception e){
			println("Error saving new location..."  + e)
			flash.message = "Error: Failed to save form due to an error saving location details."
			
			render(view: "create", model: [personInstance: personInstance])
			return
		}
		
		// WORK DETAILS OBJECTS
		def workstatus = com.cbc.lookup.Keywords.get(params?.workStatus?.id)
		if(!workstatus) personInstance.workStatus = workstatus
		
		def maritalstatus = com.cbc.lookup.Keywords.get(params?.maritalStatus?.id)
		if(!maritalstatus) personInstance.maritalStatus = maritalstatus
		
		def education = com.cbc.lookup.Keywords.get(params?.education?.id)
		if(!education) personInstance.education = education
	
		def incomepersonal = com.cbc.lookup.Keywords.get(params?.incomePersonal?.id)
		if(!incomepersonal) personInstance.incomePersonal = incomepersonal
		
		def incomeHouse = com.cbc.lookup.Keywords.get(params?.incomeHouse?.id)
		if(!incomeHouse) personInstance.incomeHouse = incomeHouse
		
		//Finally merge all 
		personInstance = personInstance.merge()
		println("=====> SAVING. ........ ")
        personInstance.save flush:true
		if (personInstance.hasErrors()) {
			println("Person has errors: " + personInstance.errors)
			respond personInstance.errors, view:'create'
			return
		}
		attachUploadedFilesTo(personInstance)
        request.withFormat {
            form multipartForm{
                flash.message = message(code: 'default.created.message', args: [message(code: 'personInstance.label', default: 'Person'), personInstance.toString()])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        respond personInstance
    }

    @Transactional
    def update(Person personInstance) {
		
        if (personInstance == null) {
            notFound()
            return
        } 
		bindData(personInstance, params, [exclude: 'dateOfBirth'])
		bindData(personInstance, ['dateOfBirth': params.date('dateOfBirth', ['dd-MMM-yyyy'])], [include: 'dateOfBirth'])
		
        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'edit'
            return
        }
		
		//Update the phone list
		personInstance.phones.clear()
		int index = 0
		int cnt = 0
		def pEntry = params.get('phones[' + index + ']')
		while(pEntry != null){			
			Phone p = new Phone(pEntry)	
			boolean isDeleted = pEntry.boolean("deleted")
			if(!isDeleted){
				try{		
					p?.index = cnt					
					personInstance?.addToPhones(p)
					cnt++
				}catch(Exception e){
					println("exception")
				}
			}
			//next p
			index++
			pEntry = params.get('phones[' + index + ']')
		}
		
//		personInstance?.worksector?.clear()
//		params?.worksector.each{
//			def _worksector = Keywords.get(it)
//			personInstance?.worksector?.add(_worksector)
//		}
//		personInstance?.incomeSource?.clear()
//		params?.incomeSource.each{
//			def _incomesource = Keywords.get(it)
//			personInstance?.incomeSource?.add(_incomesource)
//		}
	
		//Save location information
		try{
			Location location = cbcApiService.saveLocation(params)
			if(location) personInstance.location = location
		}catch(Exception e){
			println("Failed to save new location..."  + e)
			flash.message = "Error: Failed to save form due to an error saving location details."
			
			render(view: "create", model: [personInstance: personInstance])
			return
		}
	//	personInstance.properties = ['dateOfBirth': params.date('dateOfBirth', ['dd-MMM-yyyy'])]
        personInstance.save flush:true
		if(personInstance.hasErrors()){
			println(personInstance.errors)
		}
		attachUploadedFilesTo(personInstance)
        request.withFormat {
            form multipartForm{
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.toString()])
                redirect personInstance
            }
            '*'{ respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'personInstance.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	/**
	 * Custom functions added:
	 */
	def personlist = {
		render autoCompleteService.searchPeople(params) as JSON
	}
	def dialogcreate() {
		respond new Person(params)
	}
	@Transactional
	def dialogsave(Person personInstance) {
		bindData(personInstance, params, [exclude: 'dateOfBirth'])
		bindData(personInstance, ['dateOfBirth': params.date('dateOfBirth', ['dd-MMM-yyyy'])], [include: 'dateOfBirth'])
		if (personInstance == null) {
			def response = [message: "Error: Person not found!", id:id]
			render response as JSON
			return ["failed":true] as JSON
		}

		if (personInstance.hasErrors()) {
			def response = [message: "Error: Failed to save record! " + personInstance.errors, id:personInstance.id]
			render response as JSON
			return
		}
		int index = 0
		int cnt = 0
		def pEntry = params.get('phones[' + index + ']')
		while(pEntry != null){
			println(pEntry)
			Phone p = new Phone(pEntry)
			if(pEntry?.deleted=='false'){
				p?.index = cnt
				personInstance?.addToPhones(p)
				cnt++
			}
			//next p
			index++
			pEntry = params.get('phones[' + index + ']')
		}
		personInstance.save flush:true
		attachUploadedFilesTo(personInstance)
		def response = [message: personInstance.toString() + " created!", id:personInstance.id]
		render response as JSON
	}
	def dialogupdate = {
		bindData(personInstance, params, [exclude: 'dateOfBirth'])
		bindData(personInstance, ['dateOfBirth': params.date('dateOfBirth', ['dd-MMM-yyyy'])], [include: 'dateOfBirth'])
		Long id = params?.long("id")
		Long version = params?.long("version")
		def personInstance = Person.get(id)
		if (!personInstance) {
		   // flash.message = message(code: 'default.not.found.message', args: [message(code: 'exam.label', default: 'Exam'), id])
			//redirect(action: "dialogedit")
			def response = [message: "Error: Person not found!", id:id]
			render response as JSON
			return ["failed":true] as JSON
		}

		if (version != null) {
			if (personInstance.version > version) {
				personInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						  [message(code: 'exam.label', default: 'Exam')] as Object[],
						  "Another user has updated this Exam while you were editing")
				
				def response = [message: "Error: Another user has updated this record while you were editing!", id:personInstance.id]
				render response as JSON
				return
			}
		}
		personInstance.phones.clear()
		int index = 0
		int cnt = 0
		def pEntry = params.get('phones[' + index + ']')
		while(pEntry != null){
			println(pEntry)
			Phone p = new Phone(pEntry)
			if(pEntry?.deleted=='false'){
				p?.index = cnt
				personInstance?.addToPhones(p)
				cnt++
			}
			//next p
			index++
			pEntry = params.get('phones[' + index + ']')
		}
		personInstance.properties = params
		
		if (!personInstance.save(flush: true)) {			
			def response = [message: "Error: Failed to save exam!", id:personInstance.id]
			render response as JSON
			return
		}
		attachUploadedFilesTo(personInstance)
		def response = [message: personInstance.toString() + " updated!", id:personInstance.id]
		render response as JSON
	}
}
