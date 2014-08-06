package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CaseOutcomeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CaseOutcome.list(params), model:[caseOutcomeInstanceCount: CaseOutcome.count()]
    }

    def show(CaseOutcome caseOutcomeInstance) {
        respond caseOutcomeInstance
    }

    def create() {
        respond new CaseOutcome(params)
    }

    @Transactional
    def save(CaseOutcome caseOutcomeInstance) {
        if (caseOutcomeInstance == null) {
            notFound()
            return
        }

        if (caseOutcomeInstance.hasErrors()) {
            respond caseOutcomeInstance.errors, view:'create'
            return
        }

        caseOutcomeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'caseOutcomeInstance.label', default: 'CaseOutcome'), caseOutcomeInstance.toString()])
                redirect caseOutcomeInstance
            }
            '*' { respond caseOutcomeInstance, [status: CREATED] }
        }
    }

    def edit(CaseOutcome caseOutcomeInstance) {
        respond caseOutcomeInstance
    }

    @Transactional
    def update(CaseOutcome caseOutcomeInstance) {
        if (caseOutcomeInstance == null) {
            notFound()
            return
        }

        if (caseOutcomeInstance.hasErrors()) {
            respond caseOutcomeInstance.errors, view:'edit'
            return
        }

        caseOutcomeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CaseOutcome.label', default: 'CaseOutcome'), caseOutcomeInstance.toString()])
                redirect caseOutcomeInstance
            }
            '*'{ respond caseOutcomeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CaseOutcome caseOutcomeInstance) {

        if (caseOutcomeInstance == null) {
            notFound()
            return
        }

        caseOutcomeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CaseOutcome.label', default: 'CaseOutcome'), caseOutcomeInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseOutcomeInstance.label', default: 'CaseOutcome'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
