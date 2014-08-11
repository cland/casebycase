<script type="text/javascript">
//<![CDATA[
var cbc_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 0; else return ${params.sidebar};},
		active_sidenav : '../layouts/${sidenav}',
		staff_edit_url : "../jq_remove_staff", 
		staff_maingrid_id		: "staff_list",
		staff_maingrid_id_pager : "staff_list_pager",
		thisId : '${params?.id}',
		staff_list_url : "../jq_list_staff?officeid=${params?.id}",
		canEdit :${org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")}
	}
//]]>
</script>