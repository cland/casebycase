package com.cbc.location



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MainPlaceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MainPlace.list(params), model:[mainPlaceInstanceCount: MainPlace.count()]
    }

    def show(MainPlace mainPlaceInstance) {
        respond mainPlaceInstance
    }

    def create() {
        respond new MainPlace(params)
    }

    @Transactional
    def save(MainPlace mainPlaceInstance) {
        if (mainPlaceInstance == null) {
            notFound()
            return
        }

        if (mainPlaceInstance.hasErrors()) {
            respond mainPlaceInstance.errors, view:'create'
            return
        }

        mainPlaceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mainPlaceInstance.label', default: 'MainPlace'), mainPlaceInstance.toString()])
                redirect mainPlaceInstance
            }
            '*' { respond mainPlaceInstance, [status: CREATED] }
        }
    }

    def edit(MainPlace mainPlaceInstance) {
        respond mainPlaceInstance
    }

    @Transactional
    def update(MainPlace mainPlaceInstance) {
        if (mainPlaceInstance == null) {
            notFound()
            return
        }

        if (mainPlaceInstance.hasErrors()) {
            respond mainPlaceInstance.errors, view:'edit'
            return
        }

        mainPlaceInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MainPlace.label', default: 'MainPlace'), mainPlaceInstance.toString()])
                redirect mainPlaceInstance
            }
            '*'{ respond mainPlaceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MainPlace mainPlaceInstance) {

        if (mainPlaceInstance == null) {
            notFound()
            return
        }

        mainPlaceInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MainPlace.label', default: 'MainPlace'), mainPlaceInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mainPlaceInstance.label', default: 'MainPlace'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
