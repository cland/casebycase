package com.cbc



import grails.test.mixin.*
import spock.lang.*

@TestFor(EventFocusAreaController)
@Mock(EventFocusArea)
class EventFocusAreaControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.eventFocusAreaInstanceList
            model.eventFocusAreaInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.eventFocusAreaInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def eventFocusArea = new EventFocusArea()
            eventFocusArea.validate()
            controller.save(eventFocusArea)

        then:"The create view is rendered again with the correct model"
            model.eventFocusAreaInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            eventFocusArea = new EventFocusArea(params)

            controller.save(eventFocusArea)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/eventFocusArea/show/1'
            controller.flash.message != null
            EventFocusArea.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def eventFocusArea = new EventFocusArea(params)
            controller.show(eventFocusArea)

        then:"A model is populated containing the domain instance"
            model.eventFocusAreaInstance == eventFocusArea
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def eventFocusArea = new EventFocusArea(params)
            controller.edit(eventFocusArea)

        then:"A model is populated containing the domain instance"
            model.eventFocusAreaInstance == eventFocusArea
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/eventFocusArea/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def eventFocusArea = new EventFocusArea()
            eventFocusArea.validate()
            controller.update(eventFocusArea)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.eventFocusAreaInstance == eventFocusArea

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            eventFocusArea = new EventFocusArea(params).save(flush: true)
            controller.update(eventFocusArea)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/eventFocusArea/show/$eventFocusArea.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/eventFocusArea/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def eventFocusArea = new EventFocusArea(params).save(flush: true)

        then:"It exists"
            EventFocusArea.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(eventFocusArea)

        then:"The instance is deleted"
            EventFocusArea.count() == 0
            response.redirectedUrl == '/eventFocusArea/index'
            flash.message != null
    }
}
