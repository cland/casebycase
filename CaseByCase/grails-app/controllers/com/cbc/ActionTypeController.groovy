package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ActionTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ActionType.list(params), model:[actionTypeInstanceCount: ActionType.count()]
    }

    def show(ActionType actionTypeInstance) {
        respond actionTypeInstance
    }

    def create() {
        respond new ActionType(params)
    }

    @Transactional
    def save(ActionType actionTypeInstance) {
        if (actionTypeInstance == null) {
            notFound()
            return
        }

        if (actionTypeInstance.hasErrors()) {
            respond actionTypeInstance.errors, view:'create'
            return
        }

        actionTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'actionTypeInstance.label', default: 'ActionType'), actionTypeInstance.toString()])
                redirect actionTypeInstance
            }
            '*' { respond actionTypeInstance, [status: CREATED] }
        }
    }

    def edit(ActionType actionTypeInstance) {
        respond actionTypeInstance
    }

    @Transactional
    def update(ActionType actionTypeInstance) {
        if (actionTypeInstance == null) {
            notFound()
            return
        }

        if (actionTypeInstance.hasErrors()) {
            respond actionTypeInstance.errors, view:'edit'
            return
        }

        actionTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ActionType.label', default: 'ActionType'), actionTypeInstance.toString()])
                redirect actionTypeInstance
            }
            '*'{ respond actionTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ActionType actionTypeInstance) {

        if (actionTypeInstance == null) {
            notFound()
            return
        }

        actionTypeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ActionType.label', default: 'ActionType'), actionTypeInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'actionTypeInstance.label', default: 'ActionType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
