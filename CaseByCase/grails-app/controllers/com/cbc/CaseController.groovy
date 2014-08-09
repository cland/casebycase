package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CaseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Case.list(params), model:[caseInstanceCount: Case.count()]
    }

    def show(Case caseInstance) {
        respond caseInstance
    }

    def create() {
        respond new Case(params)
    }

    @Transactional
    def save(Case caseInstance) {
        if (caseInstance == null) {
            notFound()
            return
        }

        if (caseInstance.hasErrors()) {
            respond caseInstance.errors, view:'create'
            return
        }

        caseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'caseInstance.label', default: 'Case'), caseInstance.toString()])
                redirect caseInstance
            }
            '*' { respond caseInstance, [status: CREATED] }
        }
    }

    def edit(Case caseInstance) {
        respond caseInstance
    }

    @Transactional
    def update(Case caseInstance) {
        if (caseInstance == null) {
            notFound()
            return
        }

        if (caseInstance.hasErrors()) {
            respond caseInstance.errors, view:'edit'
            return
        }

        caseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Case.label', default: 'Case'), caseInstance.toString()])
                redirect caseInstance
            }
            '*'{ respond caseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Case caseInstance) {

        if (caseInstance == null) {
            notFound()
            return
        }

        caseInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Case.label', default: 'Case'), caseInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseInstance.label', default: 'Case'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
