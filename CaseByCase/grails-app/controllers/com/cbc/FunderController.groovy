package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class FunderController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Funder.list(params), model:[funderInstanceCount: Funder.count()]
    }

    def show(Funder funderInstance) {
        respond funderInstance
    }

    def create() {
        respond new Funder(params)
    }

    @Transactional
    def save(Funder funderInstance) {
        if (funderInstance == null) {
            notFound()
            return
        }

        if (funderInstance.hasErrors()) {
            respond funderInstance.errors, view:'create'
            return
        }

        funderInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'funderInstance.label', default: 'Funder'), funderInstance.toString()])
                redirect funderInstance
            }
            '*' { respond funderInstance, [status: CREATED] }
        }
    }

    def edit(Funder funderInstance) {
        respond funderInstance
    }

    @Transactional
    def update(Funder funderInstance) {
        if (funderInstance == null) {
            notFound()
            return
        }

        if (funderInstance.hasErrors()) {
            respond funderInstance.errors, view:'edit'
            return
        }

        funderInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Funder.label', default: 'Funder'), funderInstance.toString()])
                redirect funderInstance
            }
            '*'{ respond funderInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Funder funderInstance) {

        if (funderInstance == null) {
            notFound()
            return
        }

        funderInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Funder.label', default: 'Funder'), funderInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'funderInstance.label', default: 'Funder'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
