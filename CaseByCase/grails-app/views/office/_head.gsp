<script type="text/javascript">
//<![CDATA[
var cbc_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 4; else return ${params.sidebar};},
		active_sidenav : '../layouts/${sidenav}',
		staff_edit_url : "../jq_remove_staff", 
		staff_maingrid_id		: "staff_list",
		staff_maingrid_id_pager : "staff_list_pager",
		thisId : '${params?.id}',
		staff_list_url : "../jq_list_staff?officeid=${params?.id}",
		canEdit :${grails.plugin.springsecurity.SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")},
		cases : {
				edit_url : "../jq_remove_case", 
				maingrid_id		: "case_list",
				maingrid_id_pager : "case_list_pager",			
				list_url : "../jq_list_cases?officeid=${params?.id}"
			}
	}
//]]>
</script>