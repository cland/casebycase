
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
							gender:"Male"
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
						new Organization(name:"Casual Workers",code:"CWAO",status:"Active",isMember:true,isHost:true,phoneNo:"021 333 4444,021 222 4565,021 333 4444,023 344 3344",email:"mail@mymail.com")
						new Document(name:'\$home',content:"<h2>Welcome</h2>").save()
						new Document(name:"\$aboutus",content:"<h2>About us</h2>").save()
						new Document(name:"\$news",content:"<h2>Some news maybe</h2>").save()
						new Document(name:"\$contactus",content:"<h2>About us</h2>").save()
						new Document(name:"\$side-noticeboard",content:"<h2>Some notice</h2>").save()
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
