package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventOutcomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventOutcome.list(params), model:[eventOutcomeInstanceCount: EventOutcome.count()]
    }

    def show(EventOutcome eventOutcomeInstance) {
        respond eventOutcomeInstance
    }

    def create() {
        respond new EventOutcome(params)
    }

    @Transactional
    def save(EventOutcome eventOutcomeInstance) {
        if (eventOutcomeInstance == null) {
            notFound()
            return
        }

        if (eventOutcomeInstance.hasErrors()) {
            respond eventOutcomeInstance.errors, view:'create'
            return
        }

        eventOutcomeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventOutcomeInstance.label', default: 'EventOutcome'), eventOutcomeInstance.toString()])
                redirect eventOutcomeInstance
            }
            '*' { respond eventOutcomeInstance, [status: CREATED] }
        }
    }

    def edit(EventOutcome eventOutcomeInstance) {
        respond eventOutcomeInstance
    }

    @Transactional
    def update(EventOutcome eventOutcomeInstance) {
        if (eventOutcomeInstance == null) {
            notFound()
            return
        }

        if (eventOutcomeInstance.hasErrors()) {
            respond eventOutcomeInstance.errors, view:'edit'
            return
        }

        eventOutcomeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventOutcome.label', default: 'EventOutcome'), eventOutcomeInstance.toString()])
                redirect eventOutcomeInstance
            }
            '*'{ respond eventOutcomeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventOutcome eventOutcomeInstance) {

        if (eventOutcomeInstance == null) {
            notFound()
            return
        }

        eventOutcomeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventOutcome.label', default: 'EventOutcome'), eventOutcomeInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventOutcomeInstance.label', default: 'EventOutcome'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
