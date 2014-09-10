
<script>
$(document).ready(function() {
	/** GRID **/

  //initialize the staffgrid 
  jQuery("#" + cbc_params.cases.maingrid_id).jqGrid({
      url:cbc_params.cases.list_url,
      editurl:cbc_params.cases.edit_url,
      autowidth: true,
      height:"100%",
      datatype: "json",
      colNames:['Case No.','Date Opened','Subject','id','<input style="display:none" class="edit" type="button" name="Add_Case" onClick="return false;addCaseRow(\''+cbc_params.thisId+'\',\''+cbc_params.cases.maingrid_id+'\');" id="staff_add" value=""/>'],
      colModel:[
        {name:'caseno', editable:false},						        
        {name:'date_opened', editable:false},
        {name:'subject', editable:false},					             
        {name:'id',hidden:true},
        {name:'act',index:'act', width:100,sortable:false,search:false}
       // {name:'modid',index:'modid',editable:true, hidden:true,sortable:false,search:false,editoptions:{defaultValue:cbc_params.thisId}}
     ],
     rowNum:20,
     rowList:[5,10,20,30,40,50,100],
     multiselect: false,
    pager: jQuery('#' + cbc_params.cases.maingrid_id_pager),
    viewrecords: true,
    gridview: true,
  // 	postData:{id:cbc_params.thisId},
    cellEdit:false,
    cellsubmit: 'remote',
   	cellurl:cbc_params.cases.maingrid_edit_url,					   
    subGrid : false,
    gridComplete: function(){ 
        var ids = jQuery("#" + cbc_params.cases.maingrid_id).jqGrid('getDataIDs'); 
        
        for(var i=0;i < ids.length;i++)
            { 
            	var cl = ids[i]; 
	          
	            rs = "<input class='view' style='height:22px;width:80px;' type='button' value='Details' onclick=\"viewCase('"+cl+"','"+cbc_params.cases.maingrid_id+"');\" />";
	            rm = "<input class='edit' style='height:22px;width:80px;' type='button' value='Remove' onclick=\"removeGridRow('"+cl+"','"+cbc_params.cases.maingrid_id+"');\" />";
	            jQuery("#" + cbc_params.cases.maingrid_id).jqGrid('setRowData',ids[i],{act:rs+rm}); //be+se+ce+de forall actions 
            }
        if(cbc_params.canEdit) $(".edit").show(); else  $(".edit").hide();
        if(cbc_params.canEdit) $(".delete").show(); else  $(".delete").hide();
    } 
    }).navGrid('#' + cbc_params.cases.maingrid_id_pager,
            {add:false,edit:false,del:false,search:false,refresh:true}, // which buttons to show?
            {closeAfterEdit:true, afterSubmit:afterSubmitEvent,savekey:[true,13],afterShowForm: centerForm},  // edit options
            {addCaption:'New Record',afterSubmit:afterSubmitEvent,savekey:[true,13],closeAfterEdit:false}  // add options            
          // {afterShowForm: centerForm}          // delete options
        );
  //  $("#" + cbc_params.cases.maingrid_id).jqGrid('filterToolbar',{autosearch:true});            
});  
/** helper functions **/  
		  
		  function viewCase(id,grid_id){
		  	document.location.href= "../../case/show/" + id
		  	
		  }
		  function addCaseRow(person_id, grid_id){
		  	 var $dialog = $('<div></div>')
           
                        .load('../user/create?person.id=' + person_id)
                        .dialog({
                            autoOpen: false,
                            width:350,
                            beforeClose: function(event,ui){
                            	
                            },
                            close: function(event){                                                     
                            	$("#" + grid_id).trigger('reloadGrid')
                            },
                            title: 'New Case'                         
                        });
                            
                        $dialog.dialog('open');
		  }
		  function clearSelection(grid_id){jQuery('#' + grid_id).jqGrid('resetSelection'); }
</script>