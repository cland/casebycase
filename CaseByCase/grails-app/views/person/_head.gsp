<g:set var="cbcApiService" bean="cbcApiService"/>
<script type="text/javascript">
//<![CDATA[
var cbc_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 1; else return ${params.sidebar};},
		active_sidenav : '../layouts/${sidenav}',
		thisId : '${params?.id}',
		canEdit :${cbcApiService.canEdit(thisInstance)},
		canView :${cbcApiService.canView(thisInstance)}
	}
//]]>
$(document).ready(function() {		
	$( "#birth-date" ).datepicker({
		dateFormat: "dd-M-yy",
		altFormat: "yy-mm-dd",
		defaultDate : "-18y",					
		maxDate:"-2y",
		minDate:"-90y"
		});		                
}); 
</script>