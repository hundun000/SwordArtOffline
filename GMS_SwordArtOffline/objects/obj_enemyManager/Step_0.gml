/// @description Insert description here
// You can write your code in this editor
switch(enemyManagerState){
	case EnemyManagerState.turnStart:
		ii=0;
		//turn start animation
		var view_x=camera_get_view_x(view_camera[0]);
		var view_y=camera_get_view_y(view_camera[0]);
		enemyManagerState=EnemyManagerState.waitTurnStartAnimation;
		instance_create_depth(view_x,view_y,1,obj_enemyTurnStart);
		break;
		
	case EnemyManagerState.waitTurnStartAnimation:
		//wait animation obj destroy itself
		if(!instance_exists(obj_enemyTurnStart)){
			enemyManagerState=EnemyManagerState.initTarget;
		}
		break;

	case EnemyManagerState.initTarget:

		show_debug_message("initTarget for ii="+string(ii));
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
		ds_list_clear(enemy.list_worth);
		for(i=0;i<ds_list_size(enemy.list_canAttack);i++){
			var i_value=0;
			var i_player=ds_list_find_value(enemy.list_canAttack,i);
			var i_worth=1000;//base
			// attention!!!By argument as this,in follow code,my<=>enemy(fight founder),rival<=>player
			var i_fightInfo=getFightInfo(enemy,i_player,true);
			
			
			show_debug_message("start print worth detail of"+i_player.name);
			//calculate math expectation
			var exp_rival_damage=i_fightInfo[RIVAL_pre_damage]*i_fightInfo[RIVAL_hit_rate]*0.01
								*(1+i_fightInfo[RIVAL_critical_rate]*0.01*2);
			var exp_my_damage=i_fightInfo[MY_pre_damage]*i_fightInfo[MY_hit_rate]*0.01
							*(1+i_fightInfo[MY_critical_rate]*0.01*2);
						
			//can kill player
			if(exp_my_damage*i_fightInfo[MY_attack_times]>=i_player.curHp){
				show_debug_message("kill player bonus");
				i_worth+=2000;
			}
			//hurt player hp rate
			i_worth+=15*(clamp(exp_my_damage*i_fightInfo[MY_attack_times]/i_player.hp,0,100));
			show_debug_message("hurt player bonus="+string(15*(clamp(exp_my_damage*i_fightInfo[MY_attack_times]/i_player.hp,0,100))));


			//can kill self
			if(exp_rival_damage*i_fightInfo[RIVAL_attack_times]>=enemy.curHp){
				i_worth-=100;
				show_debug_message("kill self bonus");
			}

			//hurt self hp rate
			i_worth-=5*(clamp(exp_rival_damage*i_fightInfo[RIVAL_attack_times]/enemy.hp,0,100));
			show_debug_message("hurt selt bonus="+string(5*(clamp(exp_rival_damage*i_fightInfo[RIVAL_attack_times]/enemy.hp,0,100))));

	
			show_debug_message("attack "+i_player.name+" worth:"+string(i_worth));
		
		
			ds_list_add(enemy.list_worth,i_worth);
		}
		
		
		var mostWorthIndex=-1;
		attackTarget=noone;
		
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
			//in here,at least mostWorthIndex=0			
			show_debug_message("mostWorthIndex="+string(mostWorthIndex));
			
			//--------------set the most value role as target---------------
			//--------------then find all tile which can move to and can attack target ,add to list---------------		
			attackTarget=ds_list_find_value(enemy.list_canAttack,mostWorthIndex);
			//in here,at least mostWorthIndex=0	,attackTarget must exist
			show_debug_message("attackTarget "+attackTarget.name);
			ds_list_clear(enemy.list_tileForAttack);
				for(i=0;i<instance_number(obj_canMove);i++){
					var ins_canMove=instance_find(obj_canMove,i);
					if(
						(ins_canMove.image_index==CAN_MOVE||ins_canMove.image_index==CAN_MOVE_ATTACK)
						&&(//not other enemy
							!position_meeting(ins_canMove.x,ins_canMove.y,obj_role_enemy)
							||(ins_canMove.x==enemy.x&&ins_canMove.y==enemy.y)
						  )
					  ){
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
				//no consider the tile any more
				ds_list_delete(enemy.list_canAttack,mostWorthIndex);
				ds_list_delete(enemy.list_worth,mostWorthIndex);
				mostWorthIndex=-1;
				attackTarget=noone;
				show_debug_message("This mostWorthIndex unavalid,test next.");
			}			
		}
		
		moveTarget=noone;
		//mostWorthIndex==-1 mean it should move tile all be hold by other enemy
		if(mostWorthIndex!=-1){	
			//!!!!!!!!!!!!!!!!!!! for test ,always get index=0 !!!!!!!!!!!!!!
			moveTarget=ds_list_find_value(enemy.list_tileForAttack,0);//not check because once attack target exist,the move target exist.
			show_debug_message("moveTarget "+string(getTileIndex(moveTarget.x))+" "+string(getTileIndex(moveTarget.y)));
			
			
			
			enemy.rolePath=path_add();
			var hcells=room_width div UNIT;
			var vcells=room_height div UNIT;
			enemy.gridMap=mp_grid_create(0,0,hcells,vcells,UNIT,UNIT);

			//mp_grid_add_instances(enemy.gridMap,obj_role_enemy,true);
			mp_grid_add_instances(enemy.gridMap,obj_role_player,true);
			mp_grid_add_instances(enemy.gridMap,obj_tile_hill,true);
		
			//mp_grid_clear_cell(enemy.gridMap,enemy.x div UNIT, enemy.y div UNIT);
		
			mp_grid_path(enemy.gridMap,enemy.rolePath,enemy.x,enemy.y,moveTarget.x,moveTarget.y,false);
			
			//enemy.enemyState=EnemyState.pathReady;
			//path_start(enemy.rolePath,4,path_action_stop,false);		
			
		}
		else{
				

			//enemyManagerState=EnemyManagerState.moved;
		}
		enemy.enemyState=EnemyState.pathReady;
		enemyManagerState=EnemyManagerState.moving;
		break;
	case EnemyManagerState.moving:
		//blank for waiting enemy call to change state	
		break;
	case EnemyManagerState.moved:

		deleteCanMove();
		//a can't one step attack enemy will not move ,and into EnemyManagerState.moved with attackTarget==noone
		if(attackTarget!=noone){
		
			room_persistent=true;
			
			//temporary set persistent for use it in fight room
			enemy.persistent=true;
			
			
			//set front persistent role disvisible
			for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
					var frontRole=ds_list_find_value(global.playerFrontTeam, i);
					frontRole.visible=false;
			}
			

			var fightManager=global.thisGame.fightManager;
			fightManager.fighter[FIGHT_L]=enemy;
			fightManager.fighter[FIGHT_R]=attackTarget;			
			fightManager.curAttackSide=FIGHT_L;
			fightManager.fightBackRoom=room;
			//global.fight_found_side=FIGHT_L;
			
			deleteCanMove();
			
			room_goto(room_fight);
			
			room_enter_counter=0;
			enemy.enemyState=EnemyState.fighting;
			enemyManagerState=EnemyManagerState.fighting;
		}
		else{
			enemy.enemyState=EnemyState.afterFight;
			enemyManagerState=EnemyManagerState.nextEnemy;
		}
		break;
	case EnemyManagerState.fighting:
		//blank wait fight room back,and room start event change state
		break;
	case EnemyManagerState.nextEnemy:
		
		if(checkPlayerWin(room)){
			//------------player win animation
			//set cursor to leader
			global.cursor_pointer.x=global.kirito.x;
			global.cursor_pointer.y=global.kirito.y;
			//view camera should move immidiately
			with(obj_camera){
					x=clamp(x,follower.x-h_border,follower.x+h_border);
					y=clamp(y,follower.y-v_border,follower.y+v_border);
			}
			var view_x=camera_get_view_x(view_camera[0]);
			var view_y=camera_get_view_y(view_camera[0]);
			instance_create_depth(view_x,view_y,1,obj_playerWin);
			enemyManagerState=EnemyManagerState.waitPlayerWinAnimation;

		}
		else{		
			if(ii+1<ds_list_size(global.frontEnemies)){	
				enemyManagerState=EnemyManagerState.initTarget;
				ii++;
			}
			else{
				//show_message("enemy done");
				enemyManagerState=EnemyManagerState.enemySideEnd;
			}
		}
		
		break;
	case EnemyManagerState.enemySideEnd:
			show_debug_message("enemy team done");
			enemyManagerState=EnemyManagerState.waitPlayer;
			with(obj_playerFrontManager){
				cursorState=CursorState.turnStart;
			}
			//set cursor to leader
			global.cursor_point_to.x=global.kirito.x;
			global.cursor_point_to.y=global.kirito.y;
			//view camera should move immidiately
			with(obj_camera){
					x=clamp(x,follower.x-h_border,follower.x+h_border);
					y=clamp(y,follower.y-v_border,follower.y+v_border);
			}
			global.inputReceiver=InputReceiver.cursor;
			break;
	case  EnemyManagerState.waitPlayerWinAnimation:
		if(!instance_exists(obj_playerWin)){
			enemyManagerState=EnemyManagerState.notInBattle;
			processPlayerWin(room);
		}
		break;
	default:
		break;

}