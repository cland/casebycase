package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LivestockController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Livestock.list(params), model:[livestockInstanceCount: Livestock.count()]
    }

    def show(Livestock livestockInstance) {
        respond livestockInstance
    }

    def create() {
        respond new Livestock(params)
    }

    @Transactional
    def save(Livestock livestockInstance) {
        if (livestockInstance == null) {
            notFound()
            return
        }

        if (livestockInstance.hasErrors()) {
            respond livestockInstance.errors, view:'create'
            return
        }

        livestockInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'livestockInstance.label', default: 'Livestock'), livestockInstance.toString()])
                redirect livestockInstance
            }
            '*' { respond livestockInstance, [status: CREATED] }
        }
    }

    def edit(Livestock livestockInstance) {
        respond livestockInstance
    }

    @Transactional
    def update(Livestock livestockInstance) {
        if (livestockInstance == null) {
            notFound()
            return
        }

        if (livestockInstance.hasErrors()) {
            respond livestockInstance.errors, view:'edit'
            return
        }

        livestockInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Livestock.label', default: 'Livestock'), livestockInstance.toString()])
                redirect livestockInstance
            }
            '*'{ respond livestockInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Livestock livestockInstance) {

        if (livestockInstance == null) {
            notFound()
            return
        }

        livestockInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Livestock.label', default: 'Livestock'), livestockInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'livestockInstance.label', default: 'Livestock'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
