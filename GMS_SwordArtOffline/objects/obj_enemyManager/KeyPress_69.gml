/// @description Insert description here
// You can write your code in this editor


deleteCanMove();


	//****************** process one enemy ***************************
	var enemy=ds_list_find_value(global.frontEnemies, ii);
	
	newPourWater(enemy.x,enemy.y,enemy.roleType,enemy.MAX_MOVEMENT
		,enemy.roleAttackRangFrom,enemy.roleAttackRangTo,ControlType.enemy,true);
	
	
	var i;
	//------------------ renew list_canAttack ----------------------
	ds_list_clear(enemy.list_canAttack);
	for(i=0;i<instance_number(obj_canMove);i++){
		//get the ith canMove
		var ins_canMove=instance_find(obj_canMove,i);
		if(ins_canMove.image_index==CAN_ATTACK||ins_canMove.image_index==CAN_MOVE_ATTACK){
		//pick out if it's a can attack tile	
			
			var pos_player=instance_position(ins_canMove.x,ins_canMove.y,obj_role_player);
			//get the player in this tile
			
			if(pos_player!=noone){
			//pick out if the role exist
				
				show_debug_message(string(enemy.id)+" can attack "+pos_player.name);
				ds_list_add(enemy.list_canAttack,pos_player);
				
			}
		}
	}
	
	

	//--------------------- select most value target from list_canAttack -------------------\

	
	
	var mostWorthIndex=-1;
	var mostWorth=-1;
	for(i=0;i<ds_list_size(enemy.list_canAttack);i++){
		var i_value=0;
		var i_player=ds_list_find_value(enemy.list_canAttack,i);
		var i_fightInfo=getFightInfo(enemy,i_player);
		var i_worth=0;
		//calculate math expectation
		var exp_rival_damage=i_fightInfo[RIVAL_pre_damage]*i_fightInfo[RIVAL_hit_rate]*0.01
							*(1+i_fightInfo[RIVAL_critical_rate]*0.01*2);
		var exp_my_damage=i_fightInfo[MY_pre_damage]*i_fightInfo[MY_hit_rate]*0.01
						*(1+i_fightInfo[MY_critical_rate]*0.01*2);
						
		//can kill player
		if(exp_my_damage*i_fightInfo[MY_attack_times]>=i_player.curHp)
			i_worth+=1000;
			
		//hurt player hp rate
		i_worth+=15*(clamp(exp_my_damage*i_fightInfo[MY_attack_times]/i_player.hp,0,100));



		//can kill self
		if(exp_rival_damage*i_fightInfo[RIVAL_attack_times]>=enemy.curHp)
			i_worth-=0;

		//hurt self hp rate
		i_worth-=5*(clamp(exp_rival_damage*i_fightInfo[RIVAL_attack_times]/enemy.hp,0,100));
	
		show_debug_message("attack "+i_player.name+" worth:"+string(i_worth));
		
		if(i_worth>mostWorth){
			mostWorthIndex=i;
			mostWorth=i_worth;
			show_debug_message("Is most worth");
		}
	
	}


	


if(ii+1<ds_list_size(global.frontEnemies)){
	ii++;
}
else{
	ii=0
}
enemy.MAX_MOVEMENT++;
	