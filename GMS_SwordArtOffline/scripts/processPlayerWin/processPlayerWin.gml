switch(argument0){
	case room_battle_1_1:
		global.storyLine=1;
		with(obj_world_map){
			image_index=1;
		}
		global.inputReceiver=InputReceiver.worldTeamFlag;
		room_goto(room_world);
		show_message("room_battle_1_1 win");
	default:

}