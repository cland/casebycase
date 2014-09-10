package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OrganisationController {
	def autoCompleteService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 50, 100)
        respond Organisation.list(params), model:[organisationInstanceCount: Organisation.count()]
    }

    def show(Organisation organisationInstance) {
        respond organisationInstance
    }

    def create() {
        respond new Organisation(params)
    }

    @Transactional
    def save(Organisation organisationInstance) {
        if (organisationInstance == null) {
            notFound()
            return
        }

        if (organisationInstance.hasErrors()) {
            respond organisationInstance.errors, view:'create'
            return
        }

        organisationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'organisationInstance.label', default: 'Organisation'), organisationInstance.toString()])
                redirect organisationInstance
            }
            '*' { respond organisationInstance, [status: CREATED] }
        }
    }

    def edit(Organisation organisationInstance) {
        respond organisationInstance
    }

    @Transactional
    def update(Organisation organisationInstance) {
        if (organisationInstance == null) {
            notFound()
            return
        }

        if (organisationInstance.hasErrors()) {
            respond organisationInstance.errors, view:'edit'
            return
        }

        organisationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Organisation.label', default: 'Organisation'), organisationInstance.toString()])
                redirect organisationInstance
            }
            '*'{ respond organisationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Organisation organisationInstance) {

        if (organisationInstance == null) {
            notFound()
            return
        }

        organisationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Organisation.label', default: 'Organisation'), organisationInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'organisationInstance.label', default: 'Organisation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def orglist = {		
		render autoCompleteService.searchOrgs(params) as JSON
	} //end orglist
	
	def dialogcreate() {
		respond new Organisation(params)
	}
	@Transactional
	def dialogsave(Organisation organisationInstance) {
		if (organisationInstance == null) {
			def response = [message: "Error: Organisation not found!", id:id]
			render response as JSON
			return ["failed":true] as JSON
		}

		if (organisationInstance.hasErrors()) {
			def response = [message: "Error: Failed to save record! " + organisationInstance.errors, id:organisationInstance.id]
			render response as JSON
			return
		}
		
		organisationInstance.save flush:true

		def response = [message: organisationInstance.toString() + " created!", id:organisationInstance.id]
		render response as JSON
	}
} //end class
