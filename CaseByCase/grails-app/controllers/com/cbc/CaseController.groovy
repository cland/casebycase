package com.cbc

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

import com.cbc.location.Location;
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;

@Transactional(readOnly = true)
class CaseController {

    static allowedMethods = [save: "POST", update: "POST", delete: "DELETE", jq_list_actions: "GET"]
	def cbcApiService
	def autoCompleteService
    def index(Integer max) {
        params.max = Math.min(max ?: 30, 100)
		def results = cbcApiService.getCases(params)
		respond results, model:[caseInstanceCount: results.totalCount]
       // respond Case.list(params), model:[caseInstanceCount: Case.count()]
    }

    def show(Case caseInstance) {
		if(!cbcApiService.canView(caseInstance)){
			//redirect to access denied
			redirect action: 'index', params: params
		}
		
        respond caseInstance
    }

    def create() {	
        respond new Case(params)
    }

    @Transactional
    def save(Case caseInstance) {
		if(!cbcApiService.canEdit(caseInstance)){
			//redirect to access denied
			redirect action: 'index'
		}
        if (caseInstance == null) {
            notFound()
            return
        }

        if (caseInstance.hasErrors()) {
            respond caseInstance.errors, view:'create', params:params
            return
        }

		//save evictions and labour
		try{
			def categoryInstance = caseInstance?.categories?.find{true}
			def rootCategory = categoryInstance?.getRootParentName(categoryInstance)
			if (rootCategory == "Labour"){
				Labour labour = saveLabour(params)
				if(labour){
					caseInstance.labour = labour
					caseInstance = caseInstance.merge()
				}
			}else if(rootCategory == "Evictions"){
				caseInstance = saveEviction(params, caseInstance)				
			}
		}catch(Exception e){
			println(">> "+ e)
			flash.message = "Error: Failed to save form due to an errors on some fields."
			
			//render(view: "create", model: [caseInstance: caseInstance,params:params])
			//return
		}
		caseInstance.save flush:true
        if(caseInstance?.hasErrors()){
			println(caseInstance.errors)
		}else{			
			attachUploadedFilesTo(caseInstance)
		}
        request.withFormat {
            form multipartForm{				
                flash.message = message(code: 'default.created.message', args: [message(code: 'caseInstance.label', default: 'Case'), caseInstance.toString()])
                redirect caseInstance //action:"show", id:caseInstance?.id
            }
            '*' { respond caseInstance, [status: CREATED] }
        }
    }

    def edit(Case caseInstance) {
		if(!cbcApiService.canEdit(caseInstance)){
			//redirect to access denied
			redirect action: 'show', params: params
		}
        respond caseInstance
    }

    @Transactional
    def update(Case caseInstance) {
		if(!cbcApiService.canEdit(caseInstance)){
			//redirect to access denied
			redirect action: 'index'
		}
	
        if (caseInstance == null) {
            notFound()
            return
        }

        if (caseInstance.hasErrors()) {
            respond caseInstance.errors, view:'edit'
            return
        }
		caseInstance?.categories?.clear()  //= []
		params?.categories.each {
			def _category = Category.get(it)
			caseInstance?.categories?.add(_category)
		}		
		//save evictions and labour
		try{
			def categoryInstance = caseInstance?.categories?.find{true} 
			def rootCategory = categoryInstance?.getRootParentName(categoryInstance)
			if (rootCategory == "Labour"){
				Labour labour = saveLabour(params)
			}else if(rootCategory == "Evictions"){
				caseInstance = saveEviction(params, caseInstance)
			}
		}catch(Exception e){
			println(">> "+ e)
			flash.message = "Error: Failed to save form due to an errors on some fields."
		}
		
		
		caseInstance.save flush:true
		if(caseInstance?.hasErrors()){
			println(caseInstance.errors)
		}
		
		attachUploadedFilesTo(caseInstance)
		
        request.withFormat {
            form multipartForm {				
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
	private Labour saveLabour(params) throws Exception{
		def labour = Labour.get(params?.labour?.id)
		if(!labour){
			labour = new Labour(params?.labour).save()
			if(labour?.hasErrors() || !labour){
				println "Errors: " + labour?.errors
				throw new Exception("Failed to save new labour details... "  + labour?.errors)
			}
			
		}
		
		//Work hours
		def workhours = WorkHours.get(params?.labour?.workhours?.id)
		if(!workhours){
			workhours = new WorkHours(params?.labour?.workhours).save()
			if(workhours?.hasErrors()){
				println(workhours?.errors)
			}else{
				labour.workhours = workhours
			}
		}
		
		//Leave days
		def leavedays = LeaveDays.get(params?.labour?.leavedays?.id)
		if(!leavedays){
			leavedays = new LeaveDays(params?.labour?.leavedays).save()
			if(leavedays?.hasErrors()){
				println(leavedays?.errors)
			}else{
				labour.leavedays = leavedays
			}
		}
		
		//Allowance
		def allowamt = AllowanceAmount.get(params?.labour?.allowAmount?.id)
		if(!allowamt){
			allowamt = new AllowanceAmount(params?.labour?.allowAmount).save()
			if(allowamt?.hasErrors()){
				println(allowamt?.errors)
			}else{
				labour.allowAmount = allowamt	
			}
		}
		//Benefits
		def allowBenefit = BenefitsAmount.get(params?.labour?.allowBenefit?.id)
		if(!allowBenefit){
			allowBenefit = new BenefitsAmount(params?.labour?.allowBenefit).save()
			if(allowBenefit?.hasErrors()){
				println(allowBenefit?.errors)
			}else{
				labour.allowBenefit = allowBenefit
			}
		}
		labour?.save()
		return labour
	}
	private Case saveEviction(params, caseInstance) throws Exception{
		def eviction = Eviction.get(params?.eviction?.id)
		boolean isNew = false
		if(!eviction){
			eviction = new Eviction(params?.eviction).save()
			if(eviction?.hasErrors() || !eviction){
				println "Errors: " + eviction?.errors
				throw new Exception("Failed to save new eviction details... "  + eviction?.errors)
			}	
			isNew = true
		}
		
		//Livestock
		def livestock = Livestock.get(params?.eviction?.livestock?.id)
		if(!livestock){
			livestock = new Livestock(params?.eviction?.livestock).save()
			if(livestock?.hasErrors()){
				println(livestock?.errors)
			}else{
				eviction.livestock = livestock
			}
		}
		
		
		if(isNew){
			caseInstance.eviction = eviction
			caseInstance = caseInstance.merge()
		}
		return caseInstance
	}
} //end class
