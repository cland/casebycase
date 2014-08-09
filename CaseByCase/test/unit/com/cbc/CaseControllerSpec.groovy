package com.cbc



import grails.test.mixin.*
import spock.lang.*

@TestFor(CaseController)
@Mock(Case)
class CaseControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.caseInstanceList
            model.caseInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.caseInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def thiscase = new Case()
            thiscase.validate()
            controller.save(thiscase)

        then:"The create view is rendered again with the correct model"
            model.caseInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            thiscase = new Case(params)

            controller.save(thiscase)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/case/show/1'
            controller.flash.message != null
            Case.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def thiscase = new Case(params)
            controller.show(thiscase)

        then:"A model is populated containing the domain instance"
            model.caseInstance == thiscase
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def thiscase = new Case(params)
            controller.edit(thiscase)

        then:"A model is populated containing the domain instance"
            model.caseInstance == thiscase
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/case/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def thiscase = new Case()
            thiscase.validate()
            controller.update(thiscase)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.caseInstance == thiscase

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            thiscase = new Case(params).save(flush: true)
            controller.update(thiscase)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/case/show/$thiscase.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/case/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def thiscase = new Case(params).save(flush: true)

        then:"It exists"
            Case.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(thiscase)

        then:"The instance is deleted"
            Case.count() == 0
            response.redirectedUrl == '/case/index'
            flash.message != null
    }
}
