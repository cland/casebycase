package com.cbc


import com.macrobit.grails.plugins.attachmentable.domains.Attachment;
import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActionController {
	def autoCompleteService
	def cbcApiService
    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 30, 100)
		def results = cbcApiService.getActions(params)
        respond results, model:[actionInstanceCount:results.totalCount]
    }

    def show(Action actionInstance) {
        respond actionInstance
    }

    def create() {
        respond new Action(params)
    }

    @Transactional
    def save(Action actionInstance) {
        if (actionInstance == null) {
            notFound()
            return
        }

        if (actionInstance.hasErrors()) {
            respond actionInstance.errors, view:'create'
            return
        }

        actionInstance.save flush:true
		attachUploadedFilesTo(actionInstance)
        request.withFormat {
            form multipartForm{
                flash.message = message(code: 'default.created.message', args: [message(code: 'actionInstance.label', default: 'Action'), actionInstance.toString()])
                redirect actionInstance
            }
            '*' { respond actionInstance, [status: CREATED] }
        }
    }

    def edit(Action actionInstance) {
        respond actionInstance
    }
	
	def dialogedit(){
		respond new Action(params)
		//if(actionInstance == null) respond new Action(params) else respond actionInstance
	}

    @Transactional
    def update(Action actionInstance) {
        if (actionInstance == null) {
            notFound()
            return
        }

        if (actionInstance.hasErrors()) {
            respond actionInstance.errors, view:'edit'
            return
        }

        actionInstance.save flush:true
		attachUploadedFilesTo(actionInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Action.label', default: 'Action'), actionInstance.toString()])
                redirect actionInstance
            }
            '*'{ respond actionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Action actionInstance) {

        if (actionInstance == null) {
            notFound()
            return
        }

        actionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Action.label', default: 'Action'), actionInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'actionInstance.label', default: 'Action'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	@Transactional
	def dialogupdate(Action actionInstance) {
		if (actionInstance == null) {
			def response = [message: "Error: Action not found!", id:id]
			render response as JSON
            return ["failed":true] as JSON
		}

		if (actionInstance.hasErrors()) {
			def response = [message: "Error: Failed to save!", id:id]
			render response as JSON
            return ["failed":true] as JSON
		}

		actionInstance.save flush:true

		def response = [message: actionInstance.toString() + " updated!", id:actionInstance.id]
		render response as JSON
	}
}
