package com.cbc

import com.cbc.location.Region
import grails.transaction.Transactional
import grails.plugin.springsecurity.*

@Transactional
class GroupManagerService {
	def springSecurityService
    def generateOfficeGroups(Office office) {
		println "... Generating Office Groups..."
		//def _tmp = getGroupNamePrefix(office) //"GROUP_" + office?.code?.toString()?.toUpperCase()?.replace(" ","_") 
		def _tmp_desc = office?.name?.toString()

		
		def officeAdminGroup = new RoleGroup(name: _GroupName(office,SystemRoles.ROLE_OCO.getKey()),description:_tmp_desc + " - Admins" ).save(flush:true)		
		def officeWorkerGroup = new RoleGroup(name:_GroupName(office,SystemRoles.ROLE_CWO.getKey()),description:_tmp_desc + " - Case Workers").save(flush:true)
		def officeSPGroup = new RoleGroup(name:_GroupName(office,SystemRoles.ROLE_SPO.getKey()),description:_tmp_desc + " - Special Workers").save(flush:true)
		def officeReviewerGroup = new RoleGroup(name:_GroupName(office,SystemRoles.ROLE_REVIEWER.getKey()),description:_tmp_desc + " - Readers Full").save(flush:true)
		def officeReaderGroup = new RoleGroup(name:_GroupName(office,SystemRoles.ROLE_REVIEWER.getKey()),description:_tmp_desc + " - Readers Limited").save(flush:true)
		
		RoleGroupRole.create officeAdminGroup, Role.findByAuthority(SystemRoles.ROLE_OCO.value)
		RoleGroupRole.create officeWorkerGroup, Role.findByAuthority(SystemRoles.ROLE_CWO.value)
		RoleGroupRole.create officeSPGroup, Role.findByAuthority(SystemRoles.ROLE_SPO.value)
		RoleGroupRole.create officeReviewerGroup, Role.findByAuthority(SystemRoles.ROLE_REVIEWER.value)
		RoleGroupRole.create officeReaderGroup, Role.findByAuthority(SystemRoles.ROLE_READER.value)
		
		println "... Done generating Office Groups..."
    }// end generateGroups
	
	def generateRegionGroups(Region region) {
		println "... Generating Region Groups..."
		//def _tmp = getGroupNamePrefix(office) //"GROUP_" + office?.code?.toString()?.toUpperCase()?.replace(" ","_")
		def _tmp_desc = region?.name?.toString()	
		def regionPCOGroup = new RoleGroup(name: _GroupName(region,SystemRoles.ROLE_PCO.getKey()),description:_tmp_desc + " - National Co-Ordinators - Statistical Information Only" ).save(flush:true)		
		RoleGroupRole.create regionPCOGroup, Role.findByAuthority(SystemRoles.ROLE_PCO.value)		
		println "... Done generating Region Groups..."
	}// end generateRegion Groups
	def getRegionGroups(Region region){
		List <RoleGroup> grplist = []
		
		RoleGroup grp = RoleGroup.findByName(_GroupName(region,SystemRoles.ROLE_PCO.getKey()))
		if(grp) grplist.add(grp)
		
		return grplist
	}
	private String getGroupNamePrefix(Object obj){
		if(obj.instanceOf(Office)){
			Office office = (Office)obj
			return "GROUP_" + office?.code?.toString()?.toUpperCase()?.replace(" ","_")
		}
		if(obj.instanceOf(Region)){
			Region region = (Region)obj
			return "GROUP_REGION_" + region?.code?.toString()?.toUpperCase()?.replace(" ","_")
		}
	}
	private String _GroupName(Object obj, def rolename){
		return getGroupNamePrefix(obj) + "_" + rolename
	}
	def getOfficeGroups(Office office){
		List <RoleGroup> grplist = []
		SystemRoles.list().each{r ->
			RoleGroup grp = RoleGroup.findByName(_GroupName(office,r?.getKey()))
			if(grp) grplist.add(grp)
		}
		return grplist 
	} 	
	def removeOfficeGroups(Office office){
	//	def _tmp = getGroupNamePrefix(office) //"GROUP_" + office?.code?.toString()?.toUpperCase()?.replace(" ","_")
		def _tmp_desc = office?.name?.toString()
		
		def officeAdminGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_OCO.getKey()))
		def officeWorkerGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_CWO.getKey()))
		def officeSPGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_SPO.getKey()))
		def officeReviewerGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_REVIEWER.getKey()))
		def officeReaderGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_READER.getKey()))
		
		RoleGroupRole.remove officeAdminGroup, Role.findByAuthority(SystemRoles.ROLE_OCO.value)
		RoleGroupRole.remove officeWorkerGroup, Role.findByAuthority(SystemRoles.ROLE_CWO.value)
		RoleGroupRole.remove officeSPGroup, Role.findByAuthority(SystemRoles.ROLE_SPO.value)
		RoleGroupRole.remove officeReviewerGroup, Role.findByAuthority(SystemRoles.ROLE_REVIEWER.value)
		RoleGroupRole.remove officeReaderGroup, Role.findByAuthority(SystemRoles.ROLE_READER.value)
		
		officeAdminGroup?.delete flush:true
		officeWorkerGroup?.delete flush:true
		officeSPGroup?.delete flush:true
		officeReaderGroup?.delete flush:true
		officeReviewerGroup?.delete flush:true
	}
	
	def removeRegionGroups(Region region){
		def _tmp_desc = region?.name?.toString()			
		def regionPCOGroup = RoleGroup.findByName(_GroupName(region,SystemRoles.ROLE_PCO.getKey()))			
		RoleGroupRole.remove regionPCOGroup, Role.findByAuthority(SystemRoles.ROLE_PCO.value)
		regionPCOGroup?.delete flush:true
	}
	
	/**
	 * On user for, expect to select roles for user and then based on those roles add to the given office groups
	 * @param user
	 * @param office
	 * @param roles
	 * @return
	 */
	def addUserToGroup(User user,Office office,List roles){
		def _tmp = getGroupNamePrefix(office) //"GROUP_" + office?.code?.toString()?.toUpperCase()?.replace(" ","_")
		roles.each{role ->
			def group = RoleGroup.findByName(_tmp + "_" +role.getKey())
			if(group)UserRoleGroup.create user, group
		}		
	}
	def addUserToGroup(User userInstance, def groupIdList){
		groupIdList?.each{_id ->
			RoleGroup rolegroup = RoleGroup.get(_id)
			if(rolegroup) UserRoleGroup.create userInstance, rolegroup
		}
	}
	def getUserGroups(User user){
		return UserRoleGroup.findByUser(user)
	}
	def getUserRoles(User user){
		List<RoleGroup> grps = getUserGroups(user)
		List<Role>rolelist = []
		grps.each{grp ->
			List<Role> roles = RoleGroupRole.findAllByRoleGroup(grp)
			rolelist.addAll(roles)
		}
		
		return rolelist
	}
	def generateRoles(){
		println "... Generating ROLES..."
	//	def adminRole = new Role(authority:"ROLE_ADMIN22",description:"").save(flush:true)
	//	println(adminRole)
		def tmp = SystemRoles.list()
		
		tmp.each{item ->
			println(item?.value + " - " + item?.description)
			new Role(authority:item?.value,description:item?.description).save(flush:true)
		}
		println "... DONE Generating ROLES!"
	}
	
	def listGroups(params){
		def term = "%" + params?.term + "%"
		
		def query = {
			or {
				ilike("name", term )
				ilike("description", term)
			}
		}
		def clist = RoleGroup.createCriteria().list(query)

		def selectList = []
		clist.each {
			selectList.add(it.toAutoCompleteMap())
		}
		return selectList
	
	} //end list groups
	
	boolean isAdmin(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_ADMIN.value + "," + SystemRoles.ROLE_DEVELOPER.value))
	}
	boolean isDeveloper(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_DEVELOPER.value))
	}
	/**
	 * Can read statistical information at a national level
	 * @return
	 */
	boolean isNCO(){
		return (SpringSecurityUtils.ifAnyGranted(SystemRoles.ROLE_NCO.value))
	}
	/**
	 * Can read statistical information at a regional level for a given region
	 * @param region
	 * @return
	 */
	boolean isPCO(Region region){
		RoleGroup roleGroup = RoleGroup.findByName(_GroupName(region,SystemRoles.ROLE_PCO?.getKey()))		
		return isMember(roleGroup)
	}
	/**
	 * Can manage office users, office information, create/edit cases.
	 * @param office
	 * @return
	 */
	boolean isOfficeAdmin(Office office){
		println "\tGetting rolegroup for '" + _GroupName(office,SystemRoles.ROLE_OCO?.getKey()) + "'"
		RoleGroup roleGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_OCO?.getKey()))		
		return isMember(roleGroup)
	}
	/**
	 * Can create/edit cases and actions only
	 * @param office
	 * @return
	 */
	boolean isOfficeWorker(Office office){
		RoleGroup roleGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_CWO?.getKey()))		
		return isMember(roleGroup)
	}
	/**
	 * Can read and edit certain cases that are marked as private
	 * @param office
	 * @return
	 */
	boolean isOfficeSpecialWorker(Office office){
		return false
	}
	
	/**
	 * Can read only - full information i.e. including personal information like firstname, surname
	 * @param office
	 * @return
	 */
	boolean isOfficeReviewer(Office office){
		println "\tGetting rolegroup for '" + _GroupName(office,SystemRoles.ROLE_REVIEWER?.getKey()) + "'"
		RoleGroup roleGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_REVIEWER?.getKey()))		
		return isMember(roleGroup)
	}
	/**
	 * Can read only - limited information i.e. NO personal information such as surname or first name
	 * @param office
	 * @return
	 */
	boolean isOfficeReader(Office office){
		RoleGroup roleGroup = RoleGroup.findByName(_GroupName(office,SystemRoles.ROLE_READER?.getKey()))	
			
		return isMember(roleGroup)
	}
	
	boolean isMember(RoleGroup roleGroup){	
		println("\t\tRoles: " + roleGroup.toAutoCompleteMap() + " " + roleGroup.getAuthorities()*.authority)	
		return SpringSecurityUtils.ifAnyGranted(roleGroup.getAuthorities()*.authority?.toString())		
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
} //END CLASS
