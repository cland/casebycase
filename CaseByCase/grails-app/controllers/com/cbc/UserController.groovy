package com.cbc



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.macrobit.grails.plugins.attachmentable.domains.Attachment;

@Transactional(readOnly = true)
class UserController {
	def cbcApiService
	def groupManagerService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond User.list(params), model:[userInstanceCount: User.count()]
    }

    def show(User userInstance) {
		//get the roles
		//def roleMap = userInstance.getAuthorities()
        respond userInstance
    }

    def create() {
        respond new User(params)
    }

    @Transactional
    def save(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }
	
		if(!params?.person?.id){
			if(params?.person?.id == ""){
				def p = new Person(params?.person)
				if(!p.save(flush:true)){
					println("Failed to save new person..."  + p?.errors)
					flash.message = "Error: Failed to save login details due to an error saving person details."
					
					render(view: "create", model: [userInstance: userInstance])
					return
				}
				userInstance.person = p
				userInstance = userInstance.merge()
			}
		}

		userInstance.save(flush:true)
		if (userInstance.hasErrors()) {
			println(userInstance.errors)
			respond userInstance.errors, view:'create'
			return
		}
		
		//Add user to access groups
		def officegroups = (params.list("officegroups")*.toLong())
		println(officegroups)
		groupManagerService.addUserToGroup(userInstance,officegroups)
		
        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userInstance.label', default: 'User'), userInstance.toString()])
                redirect userInstance
            }
            '*' { respond userInstance, [status: CREATED] }
        }
    }

    def edit(User userInstance) {
        respond userInstance
    }

    @Transactional
    def update(User userInstance) {
        if (userInstance == null) {
            notFound()
            return
        }

        if (userInstance.hasErrors()) {
            respond userInstance.errors, view:'edit'
            return
        }

        userInstance.save flush:true
		
		//Add user to access groups - we clear all his groups first in this instance
		UserRoleGroup.removeAll(userInstance, true)
		def officegroups = (params.list("officegroups")*.toLong())
		groupManagerService.addUserToGroup(userInstance,officegroups)
		
        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'User.label', default: 'User'), userInstance.toString()])
                redirect userInstance
            }
            '*'{ respond userInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(User userInstance) {

        if (userInstance == null) {
            notFound()
            return
        }

        userInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'User.label', default: 'User'), userInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userInstance.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
