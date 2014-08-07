package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AgeGroupController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AgeGroup.list(params), model:[ageGroupInstanceCount: AgeGroup.count()]
    }

    def show(AgeGroup ageGroupInstance) {
        respond ageGroupInstance
    }

    def create() {
        respond new AgeGroup(params)
    }

    @Transactional
    def save(AgeGroup ageGroupInstance) {
        if (ageGroupInstance == null) {
            notFound()
            return
        }

        if (ageGroupInstance.hasErrors()) {
            respond ageGroupInstance.errors, view:'create'
            return
        }

        ageGroupInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ageGroupInstance.label', default: 'AgeGroup'), ageGroupInstance.toString()])
                redirect ageGroupInstance
            }
            '*' { respond ageGroupInstance, [status: CREATED] }
        }
    }

    def edit(AgeGroup ageGroupInstance) {
        respond ageGroupInstance
    }

    @Transactional
    def update(AgeGroup ageGroupInstance) {
        if (ageGroupInstance == null) {
            notFound()
            return
        }

        if (ageGroupInstance.hasErrors()) {
            respond ageGroupInstance.errors, view:'edit'
            return
        }

        ageGroupInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AgeGroup.label', default: 'AgeGroup'), ageGroupInstance.toString()])
                redirect ageGroupInstance
            }
            '*'{ respond ageGroupInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AgeGroup ageGroupInstance) {

        if (ageGroupInstance == null) {
            notFound()
            return
        }

        ageGroupInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AgeGroup.label', default: 'AgeGroup'), ageGroupInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ageGroupInstance.label', default: 'AgeGroup'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
