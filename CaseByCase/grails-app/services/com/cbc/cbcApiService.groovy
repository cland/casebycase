package com.cbc

import org.codehaus.groovy.grails.web.servlet.mvc.GrailsParameterMap;
import org.codehaus.groovy.grails.plugins.springsecurity.*
import org.grails.datastore.gorm.finders.MethodExpression.IsEmpty;

import com.sun.org.apache.xalan.internal.xsltc.compiler.ForEach;
import org.apache.commons.lang.RandomStringUtils
class cbcApiService {
	static transactional = false
	def springSecurityService
	/**
	 * This function is used to update the roles for a given user from the checkbox on the user gsp
	 * @param userInstance
	 * @param params
	 * @return
	 */
    def updateRoles(User userInstance, GrailsParameterMap params) {
		UserRole.removeAll(userInstance)
		def roles = Role.list()
		for(Role r : roles){
			def tmp = params.list("role_${r.authority}")
			if (tmp[0]) UserRole.create(userInstance, r, true)
		}
    } // function
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
	
	
		boolean isAdmin(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_ADMIN.value + "," + SystemRoles.ROLE_DEVELOPER.value))
	}
		

	
	boolean isDeveloper(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_DEVELOPER.value))
	}
	
	boolean isReviewer(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_REVIEWER.value))
	}
	Long getCurrentUserId(){
		long userId = 0 //.currentUser?.id //
		if(springSecurityService.isLoggedIn()){
			User user = springSecurityService.getCurrentUser()
			if(user) 
				userId = user?.id
		}
		return userId
	}
	User getCurrentUser(){
		return springSecurityService.getCurrentUser() // springSecurityService?.currentUser
	}
	User getUser(Long id){
		return User.get(id)
	}
	String getUserFullname(Long id){
		User user = getUser(id)
		if(user) return user?.person.toString()
		return ""
	}
	
	String getHomeLink(){
		def status = ""
		if(springSecurityService.isLoggedIn()){
			Long userId = getCurrentUserId() // springSecurityService?.currentUser?.id			
			if(isAdmin()) return "/?" + status
		}
		
		//else we return the user back to home page.
		return "/?" + status
	}
	String getSideMenuName(def d = SideNav.MENU_STANDARD.toString()){
		if(springSecurityService.isLoggedIn()){		
			long userId = getCurrentUserId() //springSecurityService.currentUser?.id //?.principal?.id
			if(!isAdmin() & d.equals(SideNav.MENU_ADMIN.toString())) return SideNav.MENU_STANDARD.String()
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
}//end class
