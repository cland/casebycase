package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EvictionController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Eviction.list(params), model:[evictionInstanceCount: Eviction.count()]
    }

    def show(Eviction evictionInstance) {
        respond evictionInstance
    }

    def create() {
        respond new Eviction(params)
    }

    @Transactional
    def save(Eviction evictionInstance) {
        if (evictionInstance == null) {
            notFound()
            return
        }

        if (evictionInstance.hasErrors()) {
            respond evictionInstance.errors, view:'create'
            return
        }

		//Deal the checkbox
	//	params.remove "_evictionBy"
	//	bindData evictionInstance, params
		
        evictionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'evictionInstance.label', default: 'Eviction'), evictionInstance.toString()])
                redirect evictionInstance
            }
            '*' { respond evictionInstance, [status: CREATED] }
        }
    }

    def edit(Eviction evictionInstance) {
        respond evictionInstance
    }

    @Transactional
    def update(Eviction evictionInstance) {
        if (evictionInstance == null) {
            notFound()
            return
        }

        if (evictionInstance.hasErrors()) {
            respond evictionInstance.errors, view:'edit'
            return
        }

        evictionInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Eviction.label', default: 'Eviction'), evictionInstance.toString()])
                redirect evictionInstance
            }
            '*'{ respond evictionInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Eviction evictionInstance) {

        if (evictionInstance == null) {
            notFound()
            return
        }

        evictionInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Eviction.label', default: 'Eviction'), evictionInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'evictionInstance.label', default: 'Eviction'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
