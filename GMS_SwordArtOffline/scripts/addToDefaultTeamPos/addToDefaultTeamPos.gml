///@argument0 role
var role=argument0;

for(var i=0;i<NUM_TEAM_SLOT;i++){
	var i_role=ds_list_find_value(global.thisGame.teamLayoutManager.teamLayoutSlots,i);
	if(i_role==noone){
		ds_list_replace(global.thisGame.teamLayoutManager.teamLayoutSlots,i,role);
		return;
	}
}