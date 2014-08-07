package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventType.list(params), model:[eventTypeInstanceCount: EventType.count()]
    }

    def show(EventType eventTypeInstance) {
        respond eventTypeInstance
    }

    def create() {
        respond new EventType(params)
    }

    @Transactional
    def save(EventType eventTypeInstance) {
        if (eventTypeInstance == null) {
            notFound()
            return
        }

        if (eventTypeInstance.hasErrors()) {
            respond eventTypeInstance.errors, view:'create'
            return
        }

        eventTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventTypeInstance.label', default: 'EventType'), eventTypeInstance.toString()])
                redirect eventTypeInstance
            }
            '*' { respond eventTypeInstance, [status: CREATED] }
        }
    }

    def edit(EventType eventTypeInstance) {
        respond eventTypeInstance
    }

    @Transactional
    def update(EventType eventTypeInstance) {
        if (eventTypeInstance == null) {
            notFound()
            return
        }

        if (eventTypeInstance.hasErrors()) {
            respond eventTypeInstance.errors, view:'edit'
            return
        }

        eventTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventType.label', default: 'EventType'), eventTypeInstance.toString()])
                redirect eventTypeInstance
            }
            '*'{ respond eventTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventType eventTypeInstance) {

        if (eventTypeInstance == null) {
            notFound()
            return
        }

        eventTypeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventType.label', default: 'EventType'), eventTypeInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventTypeInstance.label', default: 'EventType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
