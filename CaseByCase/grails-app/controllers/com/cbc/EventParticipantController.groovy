package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventParticipantController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EventParticipant.list(params), model:[eventParticipantInstanceCount: EventParticipant.count()]
    }

    def show(EventParticipant eventParticipantInstance) {
        respond eventParticipantInstance
    }

    def create() {
        respond new EventParticipant(params)
    }

    @Transactional
    def save(EventParticipant eventParticipantInstance) {
        if (eventParticipantInstance == null) {
            notFound()
            return
        }

        if (eventParticipantInstance.hasErrors()) {
            respond eventParticipantInstance.errors, view:'create'
            return
        }

        eventParticipantInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'eventParticipantInstance.label', default: 'EventParticipant'), eventParticipantInstance.toString()])
                redirect eventParticipantInstance
            }
            '*' { respond eventParticipantInstance, [status: CREATED] }
        }
    }

    def edit(EventParticipant eventParticipantInstance) {
        respond eventParticipantInstance
    }

    @Transactional
    def update(EventParticipant eventParticipantInstance) {
        if (eventParticipantInstance == null) {
            notFound()
            return
        }

        if (eventParticipantInstance.hasErrors()) {
            respond eventParticipantInstance.errors, view:'edit'
            return
        }

        eventParticipantInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EventParticipant.label', default: 'EventParticipant'), eventParticipantInstance.toString()])
                redirect eventParticipantInstance
            }
            '*'{ respond eventParticipantInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EventParticipant eventParticipantInstance) {

        if (eventParticipantInstance == null) {
            notFound()
            return
        }

        eventParticipantInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EventParticipant.label', default: 'EventParticipant'), eventParticipantInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'eventParticipantInstance.label', default: 'EventParticipant'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
