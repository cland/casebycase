package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.converters.JSON
@Transactional(readOnly = true)
class OfficeController {
	def cbcApiService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Office.list(params), model:[officeInstanceCount: Office.count()]
    }

    def show(Office officeInstance) {
        respond officeInstance
    }

    def create() {
        respond new Office(params)
    }

    @Transactional
    def save(Office officeInstance) {
        if (officeInstance == null) {
            notFound()
            return
        }

        if (officeInstance.hasErrors()) {
            respond officeInstance.errors, view:'create'
            return
        }

        officeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'officeInstance.label', default: 'Office'), officeInstance.toString()])
                redirect officeInstance
            }
            '*' { respond officeInstance, [status: CREATED] }
        }
    }

    def edit(Office officeInstance) {
        respond officeInstance
    }

    @Transactional
    def update(Office officeInstance) {
        if (officeInstance == null) {
            notFound()
            return
        }

        if (officeInstance.hasErrors()) {
            respond officeInstance.errors, view:'edit'
            return
        }

        officeInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Office.label', default: 'Office'), officeInstance.toString()])
                redirect officeInstance
            }
            '*'{ respond officeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Office officeInstance) {

        if (officeInstance == null) {
            notFound()
            return
        }

        officeInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Office.label', default: 'Office'), officeInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'officeInstance.label', default: 'Office'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    } //end notFound()
	
	/**
	 * jqGrid support functions
	 */
	/** Custom jquery function
	 * Lists all the courses that the person.id is registered for.
	 *
	 ***/
	def jq_list_staff = {
		//println("jq_list_staff: ${params}")
		def officeInstance = Office.get(params.officeid)
		if (!officeInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'office.label', default: 'Office'), params.id])}"
			redirect(action: "show",params:params)
		}
		
		def all_staff = officeInstance.staff.sort(false){[it.firstLastName]}
		int total = all_staff?.size()
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

		List resultList = all_staff.getAt(offset..upperLimit)
		def jsonCells =	resultList.collect {
			[cell: [it.firstLastName,
					it.gender,
					it.dateOfBirth,
				], id: it.id] 
		}
		
		def jsonData= [rows: jsonCells,page:page,records:total,total:total_pages]

		render jsonData as JSON
		
	} //end jq_list_staff
} //end class
