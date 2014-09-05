package com.cbc.location



import grails.test.mixin.*
import spock.lang.*

@TestFor(SuburbController)
@Mock(Suburb)
class SuburbControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.suburbInstanceList
            model.suburbInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.suburbInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def suburb = new Suburb()
            suburb.validate()
            controller.save(suburb)

        then:"The create view is rendered again with the correct model"
            model.suburbInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            suburb = new Suburb(params)

            controller.save(suburb)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/suburb/show/1'
            controller.flash.message != null
            Suburb.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def suburb = new Suburb(params)
            controller.show(suburb)

        then:"A model is populated containing the domain instance"
            model.suburbInstance == suburb
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def suburb = new Suburb(params)
            controller.edit(suburb)

        then:"A model is populated containing the domain instance"
            model.suburbInstance == suburb
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/suburb/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def suburb = new Suburb()
            suburb.validate()
            controller.update(suburb)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.suburbInstance == suburb

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            suburb = new Suburb(params).save(flush: true)
            controller.update(suburb)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/suburb/show/$suburb.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/suburb/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def suburb = new Suburb(params).save(flush: true)

        then:"It exists"
            Suburb.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(suburb)

        then:"The instance is deleted"
            Suburb.count() == 0
            response.redirectedUrl == '/suburb/index'
            flash.message != null
    }
}
