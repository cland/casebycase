package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonController {
	def autoCompleteService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params), model:[personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def create() {
        respond new Person(params)
    }

    @Transactional
    def save(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }	
	
		//** Adding phones to personInstance
		int index = 0
		int cnt = 0
		List phones = []
		def pEntry = params.get('phones[' + index + ']')
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
		
        personInstance.save flush:true
		if (personInstance.hasErrors()) {
			println("Person has errors: " + personInstance.errors)
			respond personInstance.errors, view:'create'
			return
		}
        request.withFormat {
            form {
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
	
        personInstance.save flush:true
		if(personInstance.hasErrors()){
			println(personInstance.errors)
		}
        request.withFormat {
            form {
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

		def response = [message: personInstance.toString() + " created!", id:personInstance.id]
		render response as JSON
	}
	def dialogupdate = {
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

		def response = [message: personInstance.toString() + " updated!", id:personInstance.id]
		render response as JSON
	}
}
