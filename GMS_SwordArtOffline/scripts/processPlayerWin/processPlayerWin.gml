/// @argument0 battle_map

switch(argument0){
	case room_battle_1_1:
		room_goto(room_fake_1_2);
		global.storyLine=1;
		break;
	case room_battle_2_1:
		room_goto(room_fake_2_2);
		global.storyLine=2;
		break;	
		

	default:

}

//reset player role as not in front
for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
	var frontRole=ds_list_find_value(global.playerFrontTeam, i);
	frontRole.isFront=false;
}


//reset playerFrontTeam
ds_list_clear(global.playerFrontTeam);
