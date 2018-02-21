/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.TEAM_LAYOUT)	return;

frameCounter++;
if(frameCounter==MY_GAMESPEED_FPS/2){
	positonSimultaneousFrame=!positonSimultaneousFrame;
	frameCounter=0;
}

switch(teamLayoutState){
	case TeamLayoutState.selectingSlot:
		if(isA){
			teamLayoutState=TeamLayoutState.selectingTeamRole;
			selectedTeamRole=ds_list_find_value(global.playerWorldTeam,0);
		}
		else if(isB){
			room_goto(room_home);	
			return;
		}
		else if(input_dy!=0){
			selectedSlotIndex=clamp(selectedSlotIndex+input_dy,0,NUM_TEAM_SLOT-1);
		}
		break;
	case TeamLayoutState.selectingTeamRole:
		if(isA){
			var lastSlotIndex=ds_list_find_index(teamLayoutSlots,selectedTeamRole);
			ds_list_replace(teamLayoutSlots,selectedSlotIndex,selectedTeamRole);
			ds_list_replace(teamLayoutSlots,lastSlotIndex,noone);
			
			teamLayoutState=TeamLayoutState.selectingSlot;
			selectedTeamRole=noone;
		}
		else if(isB){
			teamLayoutState=TeamLayoutState.selectingSlot;
			selectedTeamRole=noone;
		}
		else if(input_dy!=0){
			var curRoleIndex=ds_list_find_index(global.playerWorldTeam,selectedTeamRole);
			var nextRoleIndex=clamp(curRoleIndex+input_dy,0,ds_list_size(global.playerWorldTeam)-1);
			selectedTeamRole=ds_list_find_value(global.playerWorldTeam,nextRoleIndex);
		}


}