switch(argument0){
	case room_battle_1_1:
		//show_debug_message("check win,enmey remain "+string(ds_list_size(global.frontEnemies)));
		return ds_list_size(global.frontEnemies)==0;
	case room_battle_2_1:
		//show_debug_message("check win,enmey remain "+string(ds_list_size(global.frontEnemies)));
		return !instance_exists(obj_role_minotaur);	
	default:
		return false;

}