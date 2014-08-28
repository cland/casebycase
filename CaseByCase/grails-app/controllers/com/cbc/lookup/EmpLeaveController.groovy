package com.cbc.lookup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EmpLeaveController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EmpLeave.list(params), model:[empLeaveInstanceCount: EmpLeave.count()]
    }

    def show(EmpLeave empLeaveInstance) {
        respond empLeaveInstance
    }

    def create() {
        respond new EmpLeave(params)
    }

    @Transactional
    def save(EmpLeave empLeaveInstance) {
        if (empLeaveInstance == null) {
            notFound()
            return
        }

        if (empLeaveInstance.hasErrors()) {
            respond empLeaveInstance.errors, view:'create'
            return
        }

        empLeaveInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'empLeaveInstance.label', default: 'EmpLeave'), empLeaveInstance.toString()])
                redirect empLeaveInstance
            }
            '*' { respond empLeaveInstance, [status: CREATED] }
        }
    }

    def edit(EmpLeave empLeaveInstance) {
        respond empLeaveInstance
    }

    @Transactional
    def update(EmpLeave empLeaveInstance) {
        if (empLeaveInstance == null) {
            notFound()
            return
        }

        if (empLeaveInstance.hasErrors()) {
            respond empLeaveInstance.errors, view:'edit'
            return
        }

        empLeaveInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EmpLeave.label', default: 'EmpLeave'), empLeaveInstance.toString()])
                redirect empLeaveInstance
            }
            '*'{ respond empLeaveInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EmpLeave empLeaveInstance) {

        if (empLeaveInstance == null) {
            notFound()
            return
        }

        empLeaveInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EmpLeave.label', default: 'EmpLeave'), empLeaveInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'empLeaveInstance.label', default: 'EmpLeave'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
