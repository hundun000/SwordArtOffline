///@argument0 role
var role=argument0;

for(var i=0;i<NUM_TEAM_POS;i++){
	var i_role=ds_list_find_value(global.thisGame.teamRoomManager.roleInTeamPos,i);
	if(i_role==noone)
		ds_list_set(global.thisGame.teamRoomManager.roleInTeamPos,i,role);
}