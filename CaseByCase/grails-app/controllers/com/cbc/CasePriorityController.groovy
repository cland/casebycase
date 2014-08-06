package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CasePriorityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CasePriority.list(params), model:[casePriorityInstanceCount: CasePriority.count()]
    }

    def show(CasePriority casePriorityInstance) {
        respond casePriorityInstance
    }

    def create() {
        respond new CasePriority(params)
    }

    @Transactional
    def save(CasePriority casePriorityInstance) {
        if (casePriorityInstance == null) {
            notFound()
            return
        }

        if (casePriorityInstance.hasErrors()) {
            respond casePriorityInstance.errors, view:'create'
            return
        }

        casePriorityInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'casePriorityInstance.label', default: 'CasePriority'), casePriorityInstance.toString()])
                redirect casePriorityInstance
            }
            '*' { respond casePriorityInstance, [status: CREATED] }
        }
    }

    def edit(CasePriority casePriorityInstance) {
        respond casePriorityInstance
    }

    @Transactional
    def update(CasePriority casePriorityInstance) {
        if (casePriorityInstance == null) {
            notFound()
            return
        }

        if (casePriorityInstance.hasErrors()) {
            respond casePriorityInstance.errors, view:'edit'
            return
        }

        casePriorityInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CasePriority.label', default: 'CasePriority'), casePriorityInstance.toString()])
                redirect casePriorityInstance
            }
            '*'{ respond casePriorityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CasePriority casePriorityInstance) {

        if (casePriorityInstance == null) {
            notFound()
            return
        }

        casePriorityInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CasePriority.label', default: 'CasePriority'), casePriorityInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'casePriorityInstance.label', default: 'CasePriority'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
