import com.cbc.*
import grails.util.*
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.authority.AuthorityUtils
import org.springframework.security.core.context.SecurityContextHolder as SCH

class BootStrap {
def groupManagerService
	def init = { servletContext ->
		println "Bootstrap > environment: " + Environment.getCurrent()
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
		if(doBootStrap){
			switch(Environment.getCurrent()){
				case "DEVELOPMENT":			
					println ("1. Create users ...")
					createUsers("admin123")
				//	println ("2. Login ...")
				//	loginAsAdmin()
					println ("3. Initialize Request map ...")
					initRequestmap()
					println ("4. Add other components ...")
					createOtherComponents()
				//	println ("5. Logout ...")
					// logout
				//	SCH.clearContext()
				break
				case "PRODUCTION":
					println ("1. Create users ...")
					createUsers("AdminCbC9")
				//	println ("2. Login ...")
				//	loginAsAdmin()
					println ("3. Initialize Request map ...")
					initRequestmap()
					println ("4. Add other components ...")
					createOtherComponents()
				break
			} //end switch
		} //end doBootStrap

		
	} //end init
	def destroy = {
		
	} //End destroy
	
	// *** HELPER FUNCTIONS ***
	
	/**
	 * Creates initial users
	 * @return
	 */
	private boolean createUsers(String pwd) {
		Citizenship rsa = new Citizenship(name:"RSA").save();
		new Citizenship(name:"Permanent Residennce").save();
		new Citizenship(name:"Temporary Residence").save();
		new Citizenship(name:"Refugee").save();
		new Citizenship(name:"Other").save();
		
		//Create office and person
		def personAdmin = new Person(firstName:"Sys",lastName:"Sysuser",idNumber :"1111111111",
			contactNumber : "021334232",
			dateOfBirth:(new Date() - 365*30),
			gender:Gender.MALE.toString(),
			citizenship:rsa)
		def personDev = new Person(firstName:"Sys",lastName:"Devuser",idNumber :"10101010101",
			contactNumber : "021334232",
			dateOfBirth:(new Date() - 365*30),
			gender:Gender.MALE.toString(),
			citizenship:rsa)
		def mainOffice = new Office(name:"Main Office",code:"NHO",status:"Active")
		mainOffice.addToStaff(personAdmin)
		mainOffice.addToStaff(personDev)
		mainOffice.save(flush:true)
		if(mainOffice.hasErrors()) {
			println mainOffice.errors
			return false;
		}
		
		try{
			//create ROLES
		//	new Role(authority:"ROLE_ADMINTEST",description:"test description").save(flush:true)
			groupManagerService.generateRoles()
			groupManagerService.generateOfficeGroups(mainOffice)
			
			println ">> find a admin and dev roles"
			def adminRole = Role.findByAuthority(SystemRoles.ROLE_ADMIN.value)	// new Role(authority:"ROLE_ADMIN").save(flush:true)
			def devRole = Role.findByAuthority(SystemRoles.ROLE_DEVELOPER.value) //new Role(authority:"ROLE_USER").save(flush:true)
			
			//SYSTEM ADMIN group(s)
			def adminGroup = new RoleGroup(name:"GROUP_ADMIN",description:"Administrators").save(flush:true)
			def devGroup = new RoleGroup(name:"GROUP_DEVELOPER",description:"Developers").save(flush:true)
			
			println ">> creating RoleGroupRoles..."
			RoleGroupRole.create adminGroup, adminRole
			RoleGroupRole.create devGroup, devRole
			
			1.times {
				long id = it + 1
				def user = new User(username: "dev$id", enabled: true, password: pwd,person:personDev).save(flush:true)
				//UserRoleGroup.create user, devGroup
				if(!user.hasErrors()){
					println ">> Adding dev user to office groups"
					groupManagerService.addUserToGroup(user, mainOffice, SystemRoles.list())
				}else{
					println(user.errors)
				}
				
			}
		
			println ">> Creating admin user..."
			def admin = new User(username: 'admin', enabled: true, password: pwd,person:personAdmin).save(flush:true)
		
			if(!admin.hasErrors()){
				UserRoleGroup.create admin, devGroup
				UserRoleGroup.create admin, adminGroup, true
				
				//ADD Admin user to list of roles
				println ">> Adding admin to office groups"
				groupManagerService.addUserToGroup(admin, mainOffice, [SystemRoles.ROLE_OCO,SystemRoles.ROLE_CWO])
			}else{
				println(admin.errors)
			}
		}catch(Exception e){
			println "Error " + e
			return false
		}
		
		return true
	} //end create users
	private void loginAsAdmin(String pwd) {
		// have to be authenticated as an admin to create ACLs
		SCH.context.authentication = new UsernamePasswordAuthenticationToken( 'admin', pwd, AuthorityUtils.createAuthorityList(SystemRoles.ROLE_ADMIN.value))
	}
	
	private void initRequestmap(){
		
		for (String url in [			 
			 '/**/favicon.ico',
			 '/**/js/**',
			 '/**/css/**',
			 '/**/images/**',
			 '/login',
			 '/login.*',
			 '/login/*',
			 '/logout',
			 '/logout.*',			 
			 '/logout/*']) {
			 new Requestmap( url: url, configAttribute: 'permitAll').save()
		}
			 // show and lists/index
			 for (String url in ['/',
				 '/index',
				 '/index.gsp',
				 '/acl/**/**',
				 'person/personlist/**',
				 'organisation/orglist/**',
				 '/**/show/**',
				  '/**/index/**']) {
				  new Requestmap( url: url, configAttribute:'isFullyAuthenticated()').save()
			 }
		
			 //editing for office admin
			 for (String url in [
				 '/**/create/**',
				 '/**/dialogcreate/**',
				 '/**/dialogsave/**',
				 '/**/save/**',
				 '/**/update/**',
				 '/**/edit/**',]) {
				  new Requestmap( url: url, configAttribute:  SystemRoles.ROLE_ADMIN.value + ',' + SystemRoles.ROLE_OCO.value).save()
			 }
			 
			
			 //strictly admin
			 for (String url in [ '/requestmap/**',
				 '/admin/**',
				 '/role/**',
				 '/roleGroup/**',
				 '/user/**']) {
				 new Requestmap( url: url, configAttribute: SystemRoles.ROLE_ADMIN.value).save()
			}
	} //end method
	
	private void createOtherComponents(){
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
		
		//keywords for location
		def keyword = new Keywords(name:"system_areas",category:"system_locations")
		keyword.addToValues("one")
		keyword.addToValues("two")
		keyword.addToValues("three")
		keyword.save()
		if(keyword.hasErrors()){
		println keyword.errors
		}
		new Organisation(name:"Casual Workers",status:"Active",isMember:true,isHost:true,phoneNo:"021 333 4444,021 222 4565,021 333 4444,023 344 3344",email:"mail@mymail.com").save()
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
		new AgeGroup(name:"Pensioner",gender:Gender.FEMALE.toString()).save()
		new AgeGroup(name:"Adult",gender:Gender.MALE.toString()).save()
		new AgeGroup(name:"Adult",gender:Gender.FEMALE.toString()).save()
		new AgeGroup(name:"Male Youth",gender:Gender.MALE.toString()).save()
		new AgeGroup(name:"Female Youth",gender:Gender.FEMALE.toString()).save()
		new AgeGroup(name:"Male Child",gender:Gender.MALE.toString()).save()
		new AgeGroup(name:"Female Child",gender:Gender.FEMALE.toString()).save()
		new AgeGroup(name:"Infant",gender:Gender.UNKNOWN.toString()).save()
		new AgeGroup(name:"Pensioner Male",gender:Gender.MALE.toString()).save()
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
	} //end method
} //
