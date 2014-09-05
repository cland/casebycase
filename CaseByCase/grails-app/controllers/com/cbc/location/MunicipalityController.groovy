package com.cbc.location



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MunicipalityController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Municipality.list(params), model:[municipalityInstanceCount: Municipality.count()]
    }

    def show(Municipality municipalityInstance) {
        respond municipalityInstance
    }

    def create() {
        respond new Municipality(params)
    }

    @Transactional
    def save(Municipality municipalityInstance) {
        if (municipalityInstance == null) {
            notFound()
            return
        }

        if (municipalityInstance.hasErrors()) {
            respond municipalityInstance.errors, view:'create'
            return
        }

        municipalityInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'municipalityInstance.label', default: 'Municipality'), municipalityInstance.toString()])
                redirect municipalityInstance
            }
            '*' { respond municipalityInstance, [status: CREATED] }
        }
    }

    def edit(Municipality municipalityInstance) {
        respond municipalityInstance
    }

    @Transactional
    def update(Municipality municipalityInstance) {
        if (municipalityInstance == null) {
            notFound()
            return
        }

        if (municipalityInstance.hasErrors()) {
            respond municipalityInstance.errors, view:'edit'
            return
        }

        municipalityInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Municipality.label', default: 'Municipality'), municipalityInstance.toString()])
                redirect municipalityInstance
            }
            '*'{ respond municipalityInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Municipality municipalityInstance) {

        if (municipalityInstance == null) {
            notFound()
            return
        }

        municipalityInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Municipality.label', default: 'Municipality'), municipalityInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'municipalityInstance.label', default: 'Municipality'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
