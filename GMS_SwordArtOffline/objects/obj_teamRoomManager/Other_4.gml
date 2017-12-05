/// @description Insert description here
// You can write your code in this editor
if(room==room_team){
	global.inputReceiver=InputReceiver.teamRoomManager;	
	
	if(ds_list_size(global.playerWorldTeam)>0)
		selectedRole=ds_list_find_value(global.playerWorldTeam,0);
	else
		selectedRole=noone;	
		
	if(ds_list_size(selectedRole.items)>0)
		selectedBagItem=ds_list_find_value(selectedRole.items,0);
	else
		selectedBagItem=noone;
		
		
}




