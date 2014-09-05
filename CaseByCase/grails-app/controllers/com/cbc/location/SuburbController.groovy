package com.cbc.location



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SuburbController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Suburb.list(params), model:[suburbInstanceCount: Suburb.count()]
    }

    def show(Suburb suburbInstance) {
        respond suburbInstance
    }

    def create() {
        respond new Suburb(params)
    }

    @Transactional
    def save(Suburb suburbInstance) {
        if (suburbInstance == null) {
            notFound()
            return
        }

        if (suburbInstance.hasErrors()) {
            respond suburbInstance.errors, view:'create'
            return
        }

        suburbInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'suburbInstance.label', default: 'Suburb'), suburbInstance.toString()])
                redirect suburbInstance
            }
            '*' { respond suburbInstance, [status: CREATED] }
        }
    }

    def edit(Suburb suburbInstance) {
        respond suburbInstance
    }

    @Transactional
    def update(Suburb suburbInstance) {
        if (suburbInstance == null) {
            notFound()
            return
        }

        if (suburbInstance.hasErrors()) {
            respond suburbInstance.errors, view:'edit'
            return
        }

        suburbInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Suburb.label', default: 'Suburb'), suburbInstance.toString()])
                redirect suburbInstance
            }
            '*'{ respond suburbInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Suburb suburbInstance) {

        if (suburbInstance == null) {
            notFound()
            return
        }

        suburbInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Suburb.label', default: 'Suburb'), suburbInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'suburbInstance.label', default: 'Suburb'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
