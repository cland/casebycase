package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CaseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", jq_list_actions: "GET"]
	def cbcApiService
	def autoCompleteService
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Case.list(params), model:[caseInstanceCount: Case.count()]
    }

    def show(Case caseInstance) {
        respond caseInstance
    }

    def create() {
        respond new Case(params)
    }

    @Transactional
    def save(Case caseInstance) {
        if (caseInstance == null) {
            notFound()
            return
        }

        if (caseInstance.hasErrors()) {
            respond caseInstance.errors, view:'create'
            return
        }

        caseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'caseInstance.label', default: 'Case'), caseInstance.toString()])
                redirect caseInstance
            }
            '*' { respond caseInstance, [status: CREATED] }
        }
    }

    def edit(Case caseInstance) {
        respond caseInstance
    }

    @Transactional
    def update(Case caseInstance) {
        if (caseInstance == null) {
            notFound()
            return
        }

        if (caseInstance.hasErrors()) {
            respond caseInstance.errors, view:'edit'
            return
        }

        caseInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Case.label', default: 'Case'), caseInstance.toString()])
                redirect caseInstance
            }
            '*'{ respond caseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Case caseInstance) {

        if (caseInstance == null) {
            notFound()
            return
        }

        caseInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Case.label', default: 'Case'), caseInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'caseInstance.label', default: 'Case'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	def jq_list_actions = {
		def caseInstance = Case.get(params.caseid)
		if (!caseInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'case.label', default: 'Case'), params.id])}"
			render [] as JSON
			return
		}
		
		def all_results = caseInstance.actions.sort(false){[it.actionType]}
		int total = all_results?.size()
		if(total < 1){
			def t =[records:0,page:0]
			render  t as JSON
			return
		}
		int max = (params?.rows ? params.int('rows') : 30)
		int page = (params?.page ? params.int('page') : 1)
		int total_pages = (total > 0 ? Math.ceil(total/max) : 0)
		if(page > total_pages)	page = total_pages
		int offset = max*page-max
		
		int upperLimit = cbcApiService.findUpperIndex(offset, max, total)

		List resultList = all_results.getAt(offset..upperLimit)
		def jsonCells =	resultList.collect {
			[cell: [it.actionType.toString(),
					it?.actionOwner?.person?.toString(),
					it.subject,
				], id: it.id]
		}
		
		
		def jsonData= [rows: jsonCells,page:page,records:total,total:total_pages]
		render jsonData as JSON
		
	} //end jq_list_actions
	def clientlist = {
		List clients = autoCompleteService.searchPeople(params)
		clients.addAll(autoCompleteService.searchOrgs(params))
		render clients as JSON
	}
} //end class
