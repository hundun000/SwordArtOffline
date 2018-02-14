/// @description Insert description here
// You can write your code in this editor
if(room==room_team){
	global.inputReceiver=InputReceiver.TEAM_MENBER;	
	
	if(ds_list_size(global.playerWorldTeam)>0)
		selectedTeamRole=ds_list_find_value(global.playerWorldTeam,0);
	else
		selectedTeamRole=noone;	
		
	draw_set_font(global.font_CN_teamRoom);
		
		
}




