package com.cbc



import grails.test.mixin.*
import spock.lang.*

@TestFor(ActionTypeController)
@Mock(ActionType)
class ActionTypeControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.actionTypeInstanceList
            model.actionTypeInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.actionTypeInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def actionType = new ActionType()
            actionType.validate()
            controller.save(actionType)

        then:"The create view is rendered again with the correct model"
            model.actionTypeInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            actionType = new ActionType(params)

            controller.save(actionType)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/actionType/show/1'
            controller.flash.message != null
            ActionType.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def actionType = new ActionType(params)
            controller.show(actionType)

        then:"A model is populated containing the domain instance"
            model.actionTypeInstance == actionType
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def actionType = new ActionType(params)
            controller.edit(actionType)

        then:"A model is populated containing the domain instance"
            model.actionTypeInstance == actionType
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/actionType/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def actionType = new ActionType()
            actionType.validate()
            controller.update(actionType)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.actionTypeInstance == actionType

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            actionType = new ActionType(params).save(flush: true)
            controller.update(actionType)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/actionType/show/$actionType.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/actionType/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def actionType = new ActionType(params).save(flush: true)

        then:"It exists"
            ActionType.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(actionType)

        then:"The instance is deleted"
            ActionType.count() == 0
            response.redirectedUrl == '/actionType/index'
            flash.message != null
    }
}
