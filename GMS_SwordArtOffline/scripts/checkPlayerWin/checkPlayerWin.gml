switch(argument0){
	case room_battle_1_1:
		show_debug_message("check win,enmey remain "+string(ds_list_size(global.frontEnemies)));
		return ds_list_size(global.frontEnemies)==0;
	default:
		return false;

}