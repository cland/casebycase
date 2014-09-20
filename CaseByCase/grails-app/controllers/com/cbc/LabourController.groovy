package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LabourController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Labour.list(params), model:[labourInstanceCount: Labour.count()]
    }

    def show(Labour labourInstance) {
        respond labourInstance
    }

    def create() {
        respond new Labour(params)
    }

    @Transactional
    def save(Labour labourInstance) {
		WorkHours workhours = new WorkHours()
		workhours.overtime = (params.overtime).toLong()
		workhours.weekend = (params.weekend).toLong()
		workhours.holiday = (params.holiday).toLong()
		LeaveDays leavedays = new LeaveDays()
		leavedays.annual = (params.annual).toLong()
		leavedays.sick = (params.sick).toLong()
		leavedays.maternity = (params.maternity).toLong()
		leavedays.family = (params.family).toLong()
		labourInstance.leavedays = leavedays
		labourInstance.workhours = workhours
		
        if (labourInstance == null) {
            notFound()
            return
        }

        if (labourInstance.hasErrors()) {
            respond labourInstance.errors, view:'create'
            return
        }
		leavedays.save flush: true
		workhours.save flush: true
        labourInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'labourInstance.label', default: 'Labour'), labourInstance.toString()])
                redirect labourInstance
            }
            '*' { respond labourInstance, [status: CREATED] }
        }
    }

    def edit(Labour labourInstance) {
        respond labourInstance
    }

    @Transactional
    def update(Labour labourInstance) {
        if (labourInstance == null) {
            notFound()
            return
        }

        if (labourInstance.hasErrors()) {
            respond labourInstance.errors, view:'edit'
            return
        }

        labourInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Labour.label', default: 'Labour'), labourInstance.toString()])
                redirect labourInstance
            }
            '*'{ respond labourInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Labour labourInstance) {

        if (labourInstance == null) {
            notFound()
            return
        }

        labourInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Labour.label', default: 'Labour'), labourInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'labourInstance.label', default: 'Labour'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
