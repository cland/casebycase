<g:set var="cbcApiService" bean="cbcApiService"/>

<script type="text/javascript">
//<![CDATA[
var cbc_params = {
		active_tab : function(){ if (${params.tab==null}) return 0; else return ${params.tab};},
		active_sidebar : function(){ if (${params.sidebar==null}) return 0; else return ${params.sidebar};},
		active_sidenav : "../layouts/${sidenav}",
		thisId : '${params?.id}',
		canEdit :${cbcApiService.canEdit(thisInstance)},
		canView :${cbcApiService.canView(thisInstance)},
		actions : {
			edit_url : "../jq_remove_action", 
			maingrid_id		: "action_list",
			maingrid_id_pager : "action_list_pager",			
			list_url : "../jq_list_actions?caseid=${params?.id}"
		}
	}
//]]>
function onCaseStatusChange(tab_selector,panel_selector, tabnum){
	var _selected = $("#status option:selected").text();
	var _disabled = true; //"disable"
	if(_selected=='Closed' || _selected=='Case Closed - Intimidation') _disabled = false;
	disableTab(tab_selector,panel_selector,tabnum,_disabled)
	
} //end

function disableTab(tab_selector,panel_selector,tabnum,disabled){
	if(disabled ){
		$( tab_selector ).tabs( "disable",  tabnum  )
		disableInputs(panel_selector,true)
	}else{
		$( tab_selector ).tabs(  "enable", tabnum  )
		disableInputs(panel_selector,false)
	}
}
function disableInputs(selector, _disabled){
	//console.log(">> disableInputs(" + _disabled + ") - panel: " + selector)
	//get the tab divs and disable the fields inside
	var _state = (_disabled?"disabled":null);
	var inputs = $(selector + " :input" );			
	inputs.each(function(){
		//console.log(">> " + $(this).prop("name"))
		$(this).prop("disabled",_state);
	});
}
function onSelectCategory(_root_parent_name){
	if(_root_parent_name == "Labour") disableTab("#tabs","#tab-labour", 1,false); else  disableTab("#tabs","#tab-labour", 1,true);
    if(_root_parent_name == "Evictions") disableTab("#tabs","#tab-evictions", 2,false); else  disableTab("#tabs","#tab-evictions", 2,true);
}
</script>
