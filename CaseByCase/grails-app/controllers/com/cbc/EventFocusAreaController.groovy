package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventFocusAreaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventFocusArea.list(params), model:[eventFocusAreaInstanceCount: EventFocusArea.count()]
    }

    def show(EventFocusArea eventFocusAreaInstance) {
        respond eventFocusAreaInstance
    }

    def create() {
        respond new EventFocusArea(params)
    }

    @Transactional
    def save(EventFocusArea eventFocusAreaInstance) {
        if (eventFocusAreaInstance == null) {
            notFound()
            return
        }

        if (eventFocusAreaInstance.hasErrors()) {
            respond eventFocusAreaInstance.errors, view:'create'
            return
        }

        eventFocusAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventFocusAreaInstance.label', default: 'EventFocusArea'), eventFocusAreaInstance.toString()])
                redirect eventFocusAreaInstance
            }
            '*' { respond eventFocusAreaInstance, [status: CREATED] }
        }
    }

    def edit(EventFocusArea eventFocusAreaInstance) {
        respond eventFocusAreaInstance
    }

    @Transactional
    def update(EventFocusArea eventFocusAreaInstance) {
        if (eventFocusAreaInstance == null) {
            notFound()
            return
        }

        if (eventFocusAreaInstance.hasErrors()) {
            respond eventFocusAreaInstance.errors, view:'edit'
            return
        }

        eventFocusAreaInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventFocusArea.label', default: 'EventFocusArea'), eventFocusAreaInstance.toString()])
                redirect eventFocusAreaInstance
            }
            '*'{ respond eventFocusAreaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventFocusArea eventFocusAreaInstance) {

        if (eventFocusAreaInstance == null) {
            notFound()
            return
        }

        eventFocusAreaInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventFocusArea.label', default: 'EventFocusArea'), eventFocusAreaInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventFocusAreaInstance.label', default: 'EventFocusArea'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
