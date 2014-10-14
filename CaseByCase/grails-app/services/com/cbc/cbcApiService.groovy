package com.cbc

import javassist.expr.Instanceof;
import grails.plugin.springsecurity.*
import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;
//import org.codehaus.groovy.grails.plugins.springsecurity.*
import org.grails.datastore.gorm.finders.MethodExpression.IsEmpty;

import com.cbc.location.Location
import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;
import org.apache.commons.lang.RandomStringUtils

/**
 * This service class should hold business logic related to cbc application only. 
 * @author Cland
 *
 */
class cbcApiService {
	static transactional = false
	def springSecurityService
	def groupManagerService
	
	
	Location saveLocation(params) throws Exception{
		def location = null	
		if(!params?.location?.id){		
			if(params?.location?.id == ""){				
				location = new Location(params?.location).save()			
				if(location.hasErrors()){
					throw new Exception("Failed to save new location... "  + location?.errors)
				}			
			}
		}
		
		return location
	}
	
	String getUserFullname(Long id){
		User user = groupManagerService.getUser(id)
		if(user) return user?.person.toString()
		return ""
	}
	Office getUserPrimaryOffice(User user = null){
		if(user == null){
			user = springSecurityService.getCurrentUser()
		}
		return user?.person?.getPrimaryOffice()
	} //end function
	
	def getUserAllowedOffices(User user = null){
		if(user == null){
			user = springSecurityService.getCurrentUser()
		}
		if(groupManagerService.isAdmin()) return Office.list()
		List offices = []
		offices.add(user?.person?.getPrimaryOffice())
		//TODO: Search for office the user is elligible to work with. NB: groups will have the final say if user is actually allowed.
		
		return offices
	}
	
	boolean canView(Object obj){
		
		if(obj.instanceOf(Person)){
			Person p = obj
			
		}else if(obj.instanceOf(Office)){
			Office o = obj
		}else if(obj.instanceOf(Case)){
			if(groupManagerService.isAdmin()) return true
			List allowedOffices = getUserAllowedOffices()  //for currently logged in user
			Case thiscase = (Case)obj
			if(!allowedOffices?.contains(thiscase?.office)) return true 
		}
		return false
	} //end can view
	boolean canEdit(Object obj){
		
		if(obj.instanceOf(Person)){
			Person p = obj
			
		}else if(obj.instanceOf(Office)){
			Office o = obj
		}else if(obj.instanceOf(Case)){
			if(groupManagerService.isAdmin()) return true
			List allowedOffices = getUserAllowedOffices()  //for currently logged in user
			Case thiscase = (Case)obj
			if(!allowedOffices?.contains(thiscase?.office) && 
				(groupManagerService.isOfficeAdmin(thiscase?.office) || 
					groupManagerService.isOfficeWorker(thiscase?.office) ||
					groupManagerService.isOfficeSpecialWorker(thiscase?.office))) return true
		}
		return false
	} //end canEdit
	
	String getHomeLink(){
		def status = ""
		if(springSecurityService.isLoggedIn()){
			Long userId = groupManagerService.getCurrentUserId() // springSecurityService?.currentUser?.id			
			if(groupManagerService.isAdmin()) return "/?" + status
		}
		
		//else we return the user back to home page.
		return "/?" + status
	}
	String getSideMenuName(def d = SideNav.MENU_STANDARD.toString()){
		if(springSecurityService.isLoggedIn()){		
			long userId = groupManagerService.getCurrentUserId() //springSecurityService.currentUser?.id //?.principal?.id
			if(!groupManagerService.isAdmin() & d.equals(SideNav.MENU_ADMIN.toString())) return SideNav.MENU_STANDARD.String()
			//return the requested menu.
			return d
		} 
		return SideNav.MENU_STANDARD.toString()		
	}
	
	String generateIdNumber(Date birthday){
		String charset = (('A'..'Z') + ('0'..'9')).join()
		Integer length = 7
		String randomString = RandomStringUtils.random(length, charset.toCharArray())
		if(birthday == null) birthday = new Date();
		return birthday?.format("yymmdd") + randomString
	}
	private static int findUpperIndex(int offset, int max, int total) {
		max = offset + max - 1
		if (max >= total) {
			max -= max - total + 1
		}
		return max
	} //end helper method findUpperIndex
	
	def getStaffForOffice(Office office=null,params){
		if(!office) office = getUserPrimaryOffice()
		if(!groupManagerService.isAdmin()){
			//validate if this user is allowed to view this office information
			List allowedOffices = getUserAllowedOffices()  //for currently logged in user
			if(!allowedOffices?.contains(office)) office = getUserPrimaryOffice()
		}

		def results = User.createCriteria().list(params) {
				person {
					eq('office.id',office?.id)
				}
			//order('office.name','asc')
		}

		return results
//		def tmp = office?.staff*.getLoginDetails()
//		tmp.removeAll([null])
//		return tmp // office?.staff*.getLoginDetails()
		
	}
	
	def getCasesForOffice(Office office = null, params)	{
		if(!office) office = getUserPrimaryOffice()
		if(!groupManagerService.isAdmin()){
			//validate if this user is allowed to view this office information
			List allowedOffices = getUserAllowedOffices()  //for currently logged in user
			if(!allowedOffices?.contains(office)) office = getUserPrimaryOffice()
		}
	
		def results = Case.createCriteria().list(params) {
			eq('office.id',office?.id)
			//order('office.name','asc')
		}
		return results
	} //end method
	
	def getCases(params){
		if(groupManagerService.isAdmin()){ 
			return Case.createCriteria().list(params) {}  //this is an admin function to return all cases
		}
		//Otherwise we check for office related cases only
		Office office = getUserPrimaryOffice()
		return getCasesForOffice(office, params) //results 
	}
	
	@Deprecated
	/**
	 * is the function isAdmin() in GroupManagerService instead
	 */
	boolean isAdmin(){
		return groupManagerService.isAdmin()
	}

	@Deprecated
	boolean isDeveloper(){
		return groupManagerService.isDeveloper()
	}
	@Deprecated
	boolean isReviewer(){
		return groupManagerService.isNCO()
	}
	@Deprecated
	Long getCurrentUserId(){
		return groupManagerService.getCurrentUserId()
	}
	@Deprecated
	User getCurrentUser(){
		return springSecurityService.getCurrentUser() // springSecurityService?.currentUser
	}
	@Deprecated
	User getUser(Long id){
		return groupManagerService.getUser(id)
	}
	/**
	 * This function is used to update the roles for a given user from the checkbox on the user gsp
	 * @param userInstance
	 * @param params
	 * @return
	 */
	@Deprecated
	def updateRoles(User userInstance, GrailsParameterMap params) {
		UserRole.removeAll(userInstance)
		def roles = Role.list()
		for(Role r : roles){
			def tmp = params.list("role_${r.authority}")
			if (tmp[0]) UserRole.create(userInstance, r, true)
		}
	} // function
	@Deprecated
	def getUsersWithRole(List<String> rolelist){
		List alldata = []
		def role = null
		for(int i=0;i<rolelist.size();i++){
			role = Role.findByAuthority(rolelist[i])
			//def data = UserRole.findByRole(role)*.user
			def tmp = UserRole.findAllByRole(role)*.user
			if( tmp ) alldata.addAll(tmp)
		}
		return alldata?.unique()
	} //
}//end class
