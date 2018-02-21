switch(argument0){
	case room_battle_1_1:
		return ds_list_size(global.frontEnemies)==0;
	case room_battle_2_1:
		return !instance_exists(obj_role_minotaur);	
	case room_battle_3_1:
		return ds_list_size(global.frontEnemies)==0;		


}