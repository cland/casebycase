package com.cbc.location

import static org.springframework.http.HttpStatus.*
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CountryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Country.list(params), model:[countryInstanceCount: Country.count()]
    }

    def show(Country countryInstance) {
		
        respond countryInstance
    }

    def create() {
        respond new Country(params)
    }

    @Transactional
    def save(Country countryInstance) {
        if (countryInstance == null) {
            notFound()
            return
        }

        if (countryInstance.hasErrors()) {
            respond countryInstance.errors, view:'create'
            return
        }

        countryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'countryInstance.label', default: 'Country'), countryInstance.toString()])
                redirect countryInstance
            }
            '*' { respond countryInstance, [status: CREATED] }
        }
    }

    def edit(Country countryInstance) {
        respond countryInstance
    }

    @Transactional
    def update(Country countryInstance) {
        if (countryInstance == null) {
            notFound()
            return
        }

        if (countryInstance.hasErrors()) {
            respond countryInstance.errors, view:'edit'
            return
        }

        countryInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Country.label', default: 'Country'), countryInstance.toString()])
                redirect countryInstance
            }
            '*'{ respond countryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Country countryInstance) {

        if (countryInstance == null) {
            notFound()
            return
        }

        countryInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Country.label', default: 'Country'), countryInstance.toString()])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'countryInstance.label', default: 'Country'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
	
	/** SUPPORTING ACTIONS **/
	def getRegions = {
		def country = Country.get(params.id)
		render country?.regions as JSON
	} //end getRegions
	def getDistricts = {
		def region = Region.get(params.id)
		render region?.districts as JSON
	} //end getDistricts
	def getMunicipalities = {
		def district = District.get(params.id)
		render district?.municipalities as JSON
	} //end Municipalities
	def getMainPlaces = {
		def municipality = Municipality.get(params.id)
		render municipality?.places as JSON
	} //
	def getSuburbs = {
		def mainplace = MainPlace.get(params.id)
		render mainplace?.suburbs as JSON
	} //
	
} //end class
