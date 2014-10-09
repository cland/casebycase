package com.cbc



import grails.test.mixin.*
import spock.lang.*

@TestFor(EvictionController)
@Mock(Eviction)
class EvictionControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.evictionInstanceList
            model.evictionInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.evictionInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def eviction = new Eviction()
            eviction.validate()
            controller.save(eviction)

        then:"The create view is rendered again with the correct model"
            model.evictionInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            eviction = new Eviction(params)

            controller.save(eviction)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/eviction/show/1'
            controller.flash.message != null
            Eviction.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def eviction = new Eviction(params)
            controller.show(eviction)

        then:"A model is populated containing the domain instance"
            model.evictionInstance == eviction
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def eviction = new Eviction(params)
            controller.edit(eviction)

        then:"A model is populated containing the domain instance"
            model.evictionInstance == eviction
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/eviction/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def eviction = new Eviction()
            eviction.validate()
            controller.update(eviction)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.evictionInstance == eviction

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            eviction = new Eviction(params).save(flush: true)
            controller.update(eviction)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/eviction/show/$eviction.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/eviction/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def eviction = new Eviction(params).save(flush: true)

        then:"It exists"
            Eviction.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(eviction)

        then:"The instance is deleted"
            Eviction.count() == 0
            response.redirectedUrl == '/eviction/index'
            flash.message != null
    }
}
