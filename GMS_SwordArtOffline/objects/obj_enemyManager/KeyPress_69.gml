/// @description Insert description here
// You can write your code in this editor


deleteCanMove();


switch(enemyManagerState){
	case EnemyManagerState.initTarget:

		attackTarget=noone;
		moveTarget=noone;

		//****************** process one enemy ***************************
		enemy=ds_list_find_value(global.frontEnemies, ii);

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
	


		//--------------------- select most value role from list_canAttack -------------------\

		for(i=0;i<ds_list_size(enemy.list_canAttack);i++){
			var i_value=0;
			var i_player=ds_list_find_value(enemy.list_canAttack,i);
			var i_fightInfo=getFightInfo(enemy,i_player);
			var i_worth=1000;//base
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
		
			ds_list_add(enemy.list_worth,i_worth);
		}
		
		
		var mostWorthIndex=-1;
	
		while(mostWorthIndex==-1&&ds_list_size(enemy.list_worth)!=0){
		//first into loop,or last round's mostvalue is unvalid,and have list element to countinue;
				
			//get a new mostWorthIndex
			var mostWorth=-1;
			for(i=0;i<ds_list_size(enemy.list_worth);i++){
				if(ds_list_find_value(enemy.list_worth,i)>mostWorth){
					mostWorth=ds_list_find_value(enemy.list_worth,i);
					mostWorthIndex=i;
				}
			}
						
			show_debug_message("mostWorthIndex="+string(mostWorthIndex));
			
			//--------------set the most value role as target---------------
			//--------------then find all tile which can move to and can attack target ,add to list---------------		
			attackTarget=ds_list_find_value(enemy.list_canAttack,mostWorthIndex);
			show_debug_message("attackTarget "+attackTarget.name);
			ds_list_clear(enemy.list_tileForAttack);
				for(i=0;i<instance_number(obj_canMove);i++){
					var ins_canMove=instance_find(obj_canMove,i);
					if((ins_canMove.image_index==CAN_MOVE||ins_canMove.image_index==CAN_MOVE_ATTACK)
						&&!position_meeting(ins_canMove.x,ins_canMove.y,obj_role_enemy)){
					//first pick out can move part
						var dx=ins_canMove.x-attackTarget.x;
						var dy=ins_canMove.y-attackTarget.y;
						var Manhattan_distance=(abs(dx)+abs(dy)) div UNIT;
						if(Manhattan_distance>=enemy.roleAttackRangFrom&&Manhattan_distance<=enemy.roleAttackRangTo){
							ds_list_add(enemy.list_tileForAttack,ins_canMove);
							show_debug_message("list_tileForAttack add "+string(getTileIndex(ins_canMove.x))+" "+string(getTileIndex(ins_canMove.y)));
						}
					}
				}
						
						
			//test whether it's a can attack but todokanai tile			
			if(ds_list_size(enemy.list_tileForAttack)==0){
				ds_list_delete(enemy.list_canAttack,mostWorthIndex);
				ds_list_delete(enemy.list_worth,mostWorthIndex);
				mostWorthIndex=-1;
				show_debug_message("This mostWorthIndex unavalid,test next.");
			}			
		}
		
			
		if(mostWorthIndex!=-1){	
			//!!!!!!!!!!!!!!!!!!! for test ,always get index=0 !!!!!!!!!!!!!!
			moveTarget=ds_list_find_value(enemy.list_tileForAttack,0);//not check because once attack target exist,the move target exist.
			//show_debug_message("moveTarget "+string(getTileIndex(moveTarget.x))+" "+string(getTileIndex(moveTarget.y)));
			
			
			
			enemy.rolePath=path_add();
			var hcells=room_width div UNIT;
			var vcells=room_height div UNIT;
			enemy.gridMap=mp_grid_create(0,0,hcells,vcells,UNIT,UNIT);

			//mp_grid_add_instances(enemy.gridMap,obj_role_enemy,true);
			mp_grid_add_instances(enemy.gridMap,obj_role_player,true);
			mp_grid_add_instances(enemy.gridMap,obj_tile_hill,true);
		
			//mp_grid_clear_cell(enemy.gridMap,enemy.x div UNIT, enemy.y div UNIT);
		
			if(mp_grid_path(enemy.gridMap,enemy.rolePath,enemy.x,enemy.y,moveTarget.x,moveTarget.y,false)){
			}
				enemy.enemyState=EnemyState.pathReady;
				//path_start(enemy.rolePath,4,path_action_stop,false);		
			
		}
		else{
				enemy.enemyState=EnemyState.afterFight;
		}

		
		break;
		
	case EnemyManagerState.moved:

		if(!is_undefined(moveTarget)&&attackTarget!=noone){
			
			
			
			room_persistent=true;
			
			//temporary set persistent for use it in fight room
			enemy.persistent=true;
			enemy.enemyState=EnemyState.fighting;
			
			//set front persistent role disvisible
			for(var i=0;i<array_length_1d(global.playerFrontTeam);i++)
				global.playerFrontTeam[i].visible=false;
			


			global.fighter_L=enemy;
			global.fighter_R=attackTarget;			
			global.curAttackSide=FIGHT_L;

			deleteCanMove();
			
			room_goto(room_fight);
		
		}
		
		break;
	
	default:


}


		

	

/*
if(ii+1<ds_list_size(global.frontEnemies)){
	ii++;
}
else{
	ii=0
}
*/
//enemy.MAX_MOVEMENT++;
	