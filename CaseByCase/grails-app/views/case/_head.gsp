<script type="text/javascript">
//<![CDATA[
var cbc_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 0; else return ${params.sidebar};},
		active_sidenav : "../layouts/${sidenav}",
		thisId : '${params?.id}',
		canEdit :${grails.plugin.springsecurity.SpringSecurityUtils.ifAnyGranted("ROLE_ADMIN")},
		actions : {
			edit_url : "../jq_remove_action", 
			maingrid_id		: "action_list",
			maingrid_id_pager : "action_list_pager",			
			list_url : "../jq_list_actions?caseid=${params?.id}"
		}
	}
//]]>
</script>
