package com.cbc



import grails.test.mixin.*
import spock.lang.*

@TestFor(EventOutcomeController)
@Mock(EventOutcome)
class EventOutcomeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.eventOutcomeInstanceList
            model.eventOutcomeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.eventOutcomeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def eventOutcome = new EventOutcome()
            eventOutcome.validate()
            controller.save(eventOutcome)

        then:"The create view is rendered again with the correct model"
            model.eventOutcomeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            eventOutcome = new EventOutcome(params)

            controller.save(eventOutcome)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/eventOutcome/show/1'
            controller.flash.message != null
            EventOutcome.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def eventOutcome = new EventOutcome(params)
            controller.show(eventOutcome)

        then:"A model is populated containing the domain instance"
            model.eventOutcomeInstance == eventOutcome
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def eventOutcome = new EventOutcome(params)
            controller.edit(eventOutcome)

        then:"A model is populated containing the domain instance"
            model.eventOutcomeInstance == eventOutcome
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/eventOutcome/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def eventOutcome = new EventOutcome()
            eventOutcome.validate()
            controller.update(eventOutcome)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.eventOutcomeInstance == eventOutcome

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            eventOutcome = new EventOutcome(params).save(flush: true)
            controller.update(eventOutcome)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/eventOutcome/show/$eventOutcome.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/eventOutcome/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def eventOutcome = new EventOutcome(params).save(flush: true)

        then:"It exists"
            EventOutcome.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(eventOutcome)

        then:"The instance is deleted"
            EventOutcome.count() == 0
            response.redirectedUrl == '/eventOutcome/index'
            flash.message != null
    }
}
