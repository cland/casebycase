<g:set var="cbcApiService" bean="cbcApiService"/>
<script type="text/javascript">
//<![CDATA[
var cbc_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 0; else return ${params.sidebar};},
		active_sidenav : "../layouts/${sidenav}",
		thisId : '${params?.id}',
		canEdit :${cbcApiService.canEdit(thisInstance)},
		canView :${cbcApiService.canView(thisInstance)}
	}
//]]>
</script>
