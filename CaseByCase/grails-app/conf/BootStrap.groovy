
import com.cbc.*
import grails.util.*
import org.springframework.web.context.support.*;
import org.codehaus.groovy.grails.commons.*;
import groovy.ui.Console;
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

class BootStrap {

	def init = { servletContext ->
		/**
		 * Launch the console to allow us to run scripts etc while site is running
		 */

		boolean showGroovyConsole = false

		if (Environment.getCurrent() == Environment.DEVELOPMENT && showGroovyConsole) {

			def appCtx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext)

			def grailsApp = appCtx.getBean(GrailsApplication.APPLICATION_ID);

			Binding b = new Binding();

			b.setVariable("ctx", appCtx);

			def console = new Console(grailsApp.classLoader, b);

			console.run()

		}

		println "Bootstrap > environment: " + Environment.getCurrent()
		/*
		 * if in need to run this with creating records whose domains uses audit-trail plugin
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils

// set up a default user, if one doesn't already exist
def defaultUser = User.findByUsername('default') ?: new User(username:'default').save()

// run the following code as if that user were logged in
SpringSecurityUtils.doWithAuth('default') {
  new Note(name:'Testing').save()
}
		 */
		def appName = grails.util.Metadata.current.'app.name'
		println (">> Bootstrapping: ${appName} on OS >> " + System.properties["os.name"] )
		boolean doBootStrap = false
		def userlist = User.list()
		if(userlist?.size() < 1){
			println("BootStrap >> ON!")
			doBootStrap = true
		}else{
		println("BootStrap >> off!")
		}
		switch(Environment.getCurrent()){
			case "DEVELOPMENT":
				if(doBootStrap){
				//* Admin user
					def adminUser = null
					Office.withTransaction{
						Citizenship rsa = new Citizenship(name:"RSA").save();
						new Citizenship(name:"Permanent Residennce").save();
						new Citizenship(name:"Temporary Residence").save();
						new Citizenship(name:"Refugee").save();
						new Citizenship(name:"Other").save();
						
						def office = new Office(name:"Main Office",code:"MO",status:"Active")
						office.save()
						if(office.hasErrors()){
							println office.errors
						}
						def person = new Person(
							firstName: 'System',
							lastName: 'Admin',
							idNumber :"3456753463453",
							contactNumber : "021334232",
							dateOfBirth:(new Date() - 365*30),
							gender:Gender.MALE.toString(),
							citizenship:rsa
							)
						office.addToStaff(person)
						office.save(flush:true)
						if(office.hasErrors()){
							println office.errors
						}
//						person.save()
//						if(person.hasErrors()){
//							println person.errors
//						}
						
						adminUser = new User(username: 'admin',
							enabled: true,
							password: 'password',
							email:"jay@whereever.com",
							office:office,
							person:person)
							adminUser.save()
							if(adminUser.hasErrors()){
								println adminUser.errors
							}
					} //end withTransaction
				 
				 
				 
				 SpringSecurityUtils.doWithAuth('admin') {					 	
						def devRole = new Role(authority: 'ROLE_DEVELOPER').save(flush: true, failOnError:true)
						def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, failOnError:true)						
						def reviewerRole = new Role(authority: 'ROLE_REVIEWER').save(flush: true, failOnError:true)
		
						def sa = new Country(name:"South Africa")
						sa.addToRegions(new Region(name:"Western Cape"))
						sa.addToRegions(new Region(name:"KZN"))
						sa.addToRegions(new Region(name:"Limpopo"))
						sa.addToRegions(new Region(name:"Mpumalanga"))
						sa.addToRegions(new Region(name:"Gauteng"))
						sa.addToRegions(new Region(name:"North West"))
						sa.addToRegions(new Region(name:"Free State"))
						sa.addToRegions(new Region(name:"Eastern Cape"))
						sa.addToRegions(new Region(name:"Northern Cape"))
						sa.save()
						if(sa.hasErrors()){
							println(sa.errors)
						}
						new Race(name:"Asian").save()
						new Race(name:"Black").save()
						new Race(name:"Caucasian").save()
						new Race(name:"Coloured").save()
						new Race(name:"Indian").save()						
						new Race(name:"Other").save()
	
						if(adminUser) UserRole.create(adminUser, adminRole, true)

						//keywords for location
						def keyword = new Keywords(name:"system_areas",category:"system_locations")
						keyword.addToValues("one")
						keyword.addToValues("two")
						keyword.addToValues("three")
						keyword.save()
						if(keyword.hasErrors()){
							println keyword.errors
						}
						new Organisation(name:"Casual Workers",status:"Active",isMember:true,isHost:true,phoneNo:"021 333 4444,021 222 4565,021 333 4444,023 344 3344",email:"mail@mymail.com")
						new Document(name:'\$home',content:"<h2>Welcome</h2>").save()
						new Document(name:"\$aboutus",content:"<h2>About us</h2>").save()
						new Document(name:"\$news",content:"<h2>Some news maybe</h2>").save()
						new Document(name:"\$contactus",content:"<h2>About us</h2>").save()
						new Document(name:"\$side-noticeboard",content:"<h2>Some notice</h2>").save()
						
						//Case status
						new CaseStatus(name:"Closed").save()
						new CaseStatus(name:"Open").save()
						new CaseStatus(name:"Referred - Still Open").save()
						new CaseStatus(name:"Case Closed - Intimidation").save()
						//Case Priority
						new CasePriority(name:"Critical").save()
						new CasePriority(name:"Extremely Urgent").save()
						new CasePriority(name:"Urgent").save()
						new CasePriority(name:"Standard").save()
						//Case Outcome
						new CaseOutcome(name:"Case Resolved").save()
						new CaseOutcome(name:"CCMA/BC Ruling").save()
						new CaseOutcome(name:"Client requests closure").save()
						new CaseOutcome(name:"Compliance Order").save()
						new CaseOutcome(name:"Court Ruling").save()
						new CaseOutcome(name:"Deceased").save()
						new CaseOutcome(name:"Educated beneficiary").save()
						new CaseOutcome(name:"Grant Rejected").save()
						new CaseOutcome(name:"No more client contact").save()
						new CaseOutcome(name:"Referred and Closed").save()
						new CaseOutcome(name:"Abandoned - Lack Of Client Resources").save()
						new CaseOutcome(name:"Other").save()
						//Category
						new Category(name:"Root").save()
						//Action type
						new ActionType(name:"Case Report").save()
						new ActionType(name:"CCMA").save()
						new ActionType(name:"Consultation").save()
						new ActionType(name:"Correspondence").save()
						new ActionType(name:"Court").save()
						new ActionType(name:"Documentation").save()
						new ActionType(name:"Home Visit").save()
						new ActionType(name:"Followup").save()
						new ActionType(name:"Letter of Demand").save()
						new ActionType(name:"Medical Consultation").save()
						new ActionType(name:"Meeting").save()
						new ActionType(name:"Phone").save()
						new ActionType(name:"Refer").save()
						new ActionType(name:"Status Update").save()
						new ActionType(name:"Took Instruction").save()
						new ActionType(name:"Other").save()
						
						//Age groups
						new AgeGroup(name:"Pensioner Male",gender:Gender.MALE.toString()).save()
						new AgeGroup(name:"Pensioner",gender:Gender.FEMALE.toString()).save()
						new AgeGroup(name:"Adult",gender:Gender.MALE.toString()).save()
						new AgeGroup(name:"Adult",gender:Gender.FEMALE.toString()).save()
						new AgeGroup(name:"Male Youth",gender:Gender.MALE.toString()).save()
						new AgeGroup(name:"Female Youth",gender:Gender.FEMALE.toString()).save()
						new AgeGroup(name:"Male Child",gender:Gender.MALE.toString()).save()
						new AgeGroup(name:"Female Child",gender:Gender.FEMALE.toString()).save()
						new AgeGroup(name:"Infant",gender:Gender.UNKNOWN.toString()).save()
						
						//Event focus area
						new EventFocusArea(name:"Admin Justice PAJA").save()
						new EventFocusArea(name:"Basic Income Grant").save()
						new EventFocusArea(name:"Capacity Building").save()
						new EventFocusArea(name:"CCMS").save()
						new EventFocusArea(name:"Child Support").save()
						new EventFocusArea(name:"Other").save()
						
						//Event type
						new EventType(name:"Bi-monthly meeting").save()
						new EventType(name:"Campaign").save()
						new EventType(name:"Conference").save()
						new EventType(name:"Cross Sectored").save()
						new EventType(name:"Other").save()
						
						//Event Outcome
						new EventOutcome(name:"Advocacy & Lobbying").save()
						new EventOutcome(name:"Community Education").save()
						new EventOutcome(name:"Community Mobilisation").save()
						new EventOutcome(name:"Worker Forum").save()
						new EventOutcome(name:"Networking").save()
						new EventOutcome(name:"Staff Development").save()
						new EventOutcome(name:"Other").save()
						
						//Event participants
						new EventParticipant(name:"Civil Society").save()
						new EventParticipant(name:"Claiments").save()
						new EventParticipant(name:"Commercial Farmers").save()
						new EventParticipant(name:"Farmworkers").save()
						new EventParticipant(name:"Local Community").save()
						new EventParticipant(name:"Other").save()
						
				 }
					
				} //end if doBootStrap
				break
			case "PRODUCTION" :
				if(doBootStrap) {
					
					
				} //end doBootStrap
				
				break
		}
	} //end init


	def destroy = {
	}
} //end class
