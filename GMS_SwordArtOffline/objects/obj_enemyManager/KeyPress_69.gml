/// @description Insert description here
// You can write your code in this editor

if(!ds_list_empty(global.mapEnemies)){
	var enemy=ds_list_find_value(global.mapEnemies, 0);
	
	newPourWater(enemy.x,enemy.y,enemy.roleType,enemy.MAX_MOVEMENT
		,enemy.roleAttackRangFrom,enemy.roleAttackRangTo,ControlType.enemy,true);
	
	
	var i;
	for(i=0;i<instance_number(obj_canMove);i++){
		//get the ith canMove
		var ins_canMove=instance_find(obj_canMove,i);
		if(ins_canMove.image_index==CAN_ATTACK||ins_canMove.image_index==CAN_MOVE_ATTACK){
		//pick out if is a can attack tile	
			var pos_player=instance_position(ins_canMove.x,ins_canMove.y,obj_role_player);
			//get the player in this tile
			if(pos_player!=noone){
			//pick out if the role exist
				show_debug_message(string(enemy.id)+" can attack "+pos_player.name);
			}
		}

	}
	

}
	