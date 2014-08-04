package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CitizenshipController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Citizenship.list(params), model:[citizenshipInstanceCount: Citizenship.count()]
    }

    def show(Citizenship citizenshipInstance) {
        respond citizenshipInstance
    }

    def create() {
        respond new Citizenship(params)
    }

    @Transactional
    def save(Citizenship citizenshipInstance) {
        if (citizenshipInstance == null) {
            notFound()
            return
        }

        if (citizenshipInstance.hasErrors()) {
            respond citizenshipInstance.errors, view:'create'
            return
        }

        citizenshipInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'citizenshipInstance.label', default: 'Citizenship'), citizenshipInstance.toString()])
                redirect citizenshipInstance
            }
            '*' { respond citizenshipInstance, [status: CREATED] }
        }
    }

    def edit(Citizenship citizenshipInstance) {
        respond citizenshipInstance
    }

    @Transactional
    def update(Citizenship citizenshipInstance) {
        if (citizenshipInstance == null) {
            notFound()
            return
        }

        if (citizenshipInstance.hasErrors()) {
            respond citizenshipInstance.errors, view:'edit'
            return
        }

        citizenshipInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Citizenship.label', default: 'Citizenship'), citizenshipInstance.toString()])
                redirect citizenshipInstance
            }
            '*'{ respond citizenshipInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Citizenship citizenshipInstance) {

        if (citizenshipInstance == null) {
            notFound()
            return
        }

        citizenshipInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Citizenship.label', default: 'Citizenship'), citizenshipInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'citizenshipInstance.label', default: 'Citizenship'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
