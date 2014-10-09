package com.cbc.lookup



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KeywordsController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		def results = Keywords.createCriteria().list(params) {
			//isNotEmpty("values")
			isNull("keyword")
		}
		respond results, model:[keywordsInstanceCount: results.totalCount]
    }

    def show(Keywords keywordsInstance) {
        respond keywordsInstance
    }

    def create() {
        respond new Keywords(params)
    }

    @Transactional
    def save(Keywords keywordsInstance) {
        if (keywordsInstance == null) {
            notFound()
            return
        }

        if (keywordsInstance.hasErrors()) {
            respond keywordsInstance.errors, view:'create'
            return
        }

        keywordsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'keywordsInstance.label', default: 'Keywords'), keywordsInstance.toString()])
                redirect keywordsInstance
            }
            '*' { respond keywordsInstance, [status: CREATED] }
        }
    }

    def edit(Keywords keywordsInstance) {
        respond keywordsInstance
    }

    @Transactional
    def update(Keywords keywordsInstance) {
        if (keywordsInstance == null) {
            notFound()
            return
        }

        if (keywordsInstance.hasErrors()) {
            respond keywordsInstance.errors, view:'edit'
            return
        }

        keywordsInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Keywords.label', default: 'Keywords'), keywordsInstance.toString()])
                redirect keywordsInstance
            }
            '*'{ respond keywordsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Keywords keywordsInstance) {

        if (keywordsInstance == null) {
            notFound()
            return
        }

        keywordsInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Keywords.label', default: 'Keywords'), keywordsInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'keywordsInstance.label', default: 'Keywords'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
