/// @argument0 battle_map

switch(argument0){
	case room_battle_1_1:
		room_goto(room_fake_1_2);
		global.storyLine=1;
		break;
		
		
	/*
		
		global.inputReceiver=InputReceiver.worldTeamFlag;
		room_goto(room_world);
		show_message("room_battle_1_1 win");
	*/

	default:

}

//
for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
	var frontRole=ds_list_find_value(global.playerFrontTeam, i);
	frontRole.isFront=false;
}


//reset playerFrontTeam
ds_list_clear(global.playerFrontTeam)
