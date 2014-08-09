package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PcmController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Pcm.list(params), model:[pcmInstanceCount: Pcm.count()]
    }

    def show(Pcm pcmInstance) {
        respond pcmInstance
    }

    def create() {
        respond new Pcm(params)
    }

    @Transactional
    def save(Pcm pcmInstance) {
        if (pcmInstance == null) {
            notFound()
            return
        }

        if (pcmInstance.hasErrors()) {
            respond pcmInstance.errors, view:'create'
            return
        }

        pcmInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'pcmInstance.label', default: 'Pcm'), pcmInstance.toString()])
                redirect pcmInstance
            }
            '*' { respond pcmInstance, [status: CREATED] }
        }
    }

    def edit(Pcm pcmInstance) {
        respond pcmInstance
    }

    @Transactional
    def update(Pcm pcmInstance) {
        if (pcmInstance == null) {
            notFound()
            return
        }

        if (pcmInstance.hasErrors()) {
            respond pcmInstance.errors, view:'edit'
            return
        }

        pcmInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Pcm.label', default: 'Pcm'), pcmInstance.toString()])
                redirect pcmInstance
            }
            '*'{ respond pcmInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Pcm pcmInstance) {

        if (pcmInstance == null) {
            notFound()
            return
        }

        pcmInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Pcm.label', default: 'Pcm'), pcmInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'pcmInstance.label', default: 'Pcm'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
