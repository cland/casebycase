package com.cbc

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
				location = new Location(params?.location)
				if(!location.save()){
					throw new Exception("Failed to save new location... "  + location?.errors)
				}				
			}
		}else{
			println("No location to deal with ??? ")
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
		return groupManagerService.isReviewer()
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
