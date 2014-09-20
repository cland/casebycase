package com.cbc.lookup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProblemTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		def results = ProblemType.createCriteria().list(params) {
		    isNotEmpty("problemTypes")
		}
        respond results, model:[problemTypeInstanceCount: results.totalCount]
    }

    def show(ProblemType problemTypeInstance) {
        respond problemTypeInstance
    }

    def create() {
        respond new ProblemType(params)
    }

    @Transactional
    def save(ProblemType problemTypeInstance) {
        if (problemTypeInstance == null) {
            notFound()
            return
        }

        if (problemTypeInstance.hasErrors()) {
            respond problemTypeInstance.errors, view:'create'
            return
        }

        problemTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'problemTypeInstance.label', default: 'ProblemType'), problemTypeInstance.toString()])
                redirect problemTypeInstance
            }
            '*' { respond problemTypeInstance, [status: CREATED] }
        }
    }

    def edit(ProblemType problemTypeInstance) {
        respond problemTypeInstance
    }

    @Transactional
    def update(ProblemType problemTypeInstance) {
        if (problemTypeInstance == null) {
            notFound()
            return
        }

        if (problemTypeInstance.hasErrors()) {
            respond problemTypeInstance.errors, view:'edit'
            return
        }

        problemTypeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ProblemType.label', default: 'ProblemType'), problemTypeInstance.toString()])
                redirect problemTypeInstance
            }
            '*'{ respond problemTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ProblemType problemTypeInstance) {

        if (problemTypeInstance == null) {
            notFound()
            return
        }

        problemTypeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ProblemType.label', default: 'ProblemType'), problemTypeInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'problemTypeInstance.label', default: 'ProblemType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
