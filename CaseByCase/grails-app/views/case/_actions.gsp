
<script>
$(document).ready(function() {
	/** GRID **/

  //initialize the staffgrid 
  jQuery("#" + cbc_params.actions.maingrid_id).jqGrid({
      url:cbc_params.actions.list_url,
      editurl:cbc_params.actions.edit_url,
      autowidth: true,
      height:"100%",
      datatype: "json",
      colNames:['Action Type','Case Worker','Subject','Status','id','<input class="edit" type="button" name="Add_Case" onClick="addActionRow(\''+cbc_params.thisId+'\',\''+cbc_params.actions.maingrid_id+'\');" id="staff_add" value="Add"/>'],
      colModel:[
        {name:'actiontype', editable:false},						        
        {name:'owner', editable:false},
        {name:'subject', editable:false},
        {name:'followUpStatus', editable:false},          
        {name:'id',hidden:true},
        {name:'act',index:'act', width:100,sortable:false,search:false}
       // {name:'modid',index:'modid',editable:true, hidden:true,sortable:false,search:false,editoptions:{defaultValue:cbc_params.thisId}}
     ],
     rowNum:20,
     rowList:[5,10,20,30,40,50,100],
     multiselect: false,
    pager: jQuery('#' + cbc_params.actions.maingrid_id_pager),
    viewrecords: true,
    gridview: true,
  // 	postData:{id:cbc_params.thisId},
    cellEdit:false,
    cellsubmit: 'remote',
   	cellurl:cbc_params.actions.maingrid_edit_url,					   
    subGrid : false,
    gridComplete: function(){ 
        var ids = jQuery("#" + cbc_params.actions.maingrid_id).jqGrid('getDataIDs'); 
        
        for(var i=0;i < ids.length;i++)
            { 
            	var cl = ids[i]; 
	          
	            rs = "<input class='view' style='height:22px;width:80px;' type='button' value='Details' onclick=\"viewCase('"+cl+"','"+cbc_params.actions.maingrid_id+"');\" />";
	            rm = "<input class='edit' style='height:22px;width:80px;' type='button' value='Remove' onclick=\"removeGridRow('"+cl+"','"+cbc_params.actions.maingrid_id+"');\" />";
	            jQuery("#" + cbc_params.actions.maingrid_id).jqGrid('setRowData',ids[i],{act:rs+rm}); //be+se+ce+de forall actions 
            }
        if(cbc_params.canEdit) $(".edit").show(); else  $(".edit").hide();
        if(cbc_params.canEdit) $(".delete").show(); else  $(".delete").hide();
    } 
    }).navGrid('#' + cbc_params.actions.maingrid_id_pager,
            {add:true,edit:false,del:false,search:true,refresh:true}, // which buttons to show?
            {closeAfterEdit:true, afterSubmit:afterSubmitEvent,savekey:[true,13],afterShowForm: centerForm},  // edit options
            {addCaption:'New Record',afterSubmit:afterSubmitEvent,savekey:[true,13],closeAfterEdit:false}  // add options            
          // {afterShowForm: centerForm}          // delete options
        );
  //  $("#" + cbc_params.actions.maingrid_id).jqGrid('filterToolbar',{autosearch:true});            
});  
/** helper functions **/  
		  
		  function viewCase(id,grid_id){
		  	document.location.href= "../../action/show/" + id
		  	
		  }
		  function addActionRow(_id, grid_id){
			  var _link = "${g.createLink(controller: 'action', action: 'dialogedit')}";
			  _link = _link + "?thiscase.id=" + _id;
		  	 var $dialog = $('<div><div id="wait" style="font-weight:bold;text-align:center;">Loading...</div></div>')           
                        .load(_link)
                        .dialog({
                            modal:true,
                            autoOpen: false,
                            width:850,
                            beforeClose: function(event,ui){
                            	
                            },
                            buttons:{
    	                        "DONE":function(){
    	                      	  //location.reload();
    		                      	  $(this).dialog('close')
    	                            },
    	                         "CANCEL":function(){
    	                      	   $(this).dialog('close')
    	                             }
    	                       },
                            close: function(event){     
                            	$(this).dialog('destroy').remove()                                                
                            	//$("#" + grid_id).trigger('reloadGrid')  //?? NOT RELOAD GRID CORRECTLY
                            },
                            position: {my:"top",at:"top",of:window},
                            title: 'New Action'                         
                        });
                            
                        $dialog.dialog('open');
		  }
		  function clearSelection(grid_id){jQuery('#' + grid_id).jqGrid('resetSelection'); }
</script>