/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.teamRoomManager)	return;

switch(teamRoomState){
	
	case TeamRoomState.selectingRole:
		if(isA){
			teamRoomState=TeamRoomState.selectingBagItem;
		}
		else if(isB){
			room_goto(room_world);	
			return;
		}
		else if(input_dx!=0){
			var curRoleIndex=ds_list_find_index(global.playerWorldTeam,selectedRole);
			var nextRoleIndex=clamp(curRoleIndex+input_dx,0,ds_list_size(global.playerWorldTeam)-1);
		}
		
		break;
	case TeamRoomState.selectingBagItem:
	
	default:
	
	
	
}