/// @description Insert description here
// You can write your code in this editor



if(global.inputReceiver!=InputReceiver.CURSOR)	return;

	
switch(cursorState){
	case CursorState.turnStart:
				
		for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
			
			setRoleState(ds_list_find_value(global.playerFrontTeam,i),RoleState.idle);
		}

		
		
		//turn start animation
		var view_x=camera_get_view_x(view_camera[0]);
		var view_y=camera_get_view_y(view_camera[0]);
		cursorState=CursorState.waitTurnStartAnimation;
		instance_create_depth(view_x,view_y,1,obj_playerTurnStart);
		break;
		
	case CursorState.waitTurnStartAnimation:
		//wait animation obj destroy itself
		if(!instance_exists(obj_playerTurnStart)){
			cursorState=CursorState.free;
		}
		break;
		
	case CursorState.free:
	
		if((input_dx!=0||input_dy!=0)
		&&global.cursor_pointer.x+input_dx*UNIT<room_width&&global.cursor_pointer.x+input_dx*UNIT>0
		&&global.cursor_pointer.y+input_dy*UNIT<room_height&&global.cursor_pointer.y+input_dy*UNIT>0){
			global.cursor_pointer.x+=input_dx*UNIT;
			global.cursor_pointer.y+=input_dy*UNIT;
		}
		else if(isA){
			operatedRole=instance_position(global.cursor_pointer.x,global.cursor_pointer.y,obj_role_player);
			if(operatedRole!=noone&&operatedRole.isFront){
			  //if(selectedRole.control==controlType.player)			
				if(operatedRole.roleState==RoleState.idle){	
					cursorState=CursorState.selectedRole;
					
					tempRoleX=operatedRole.x;
					tempRoleY=operatedRole.y;
					
					playerPath=path_add();
					buildPath(playerPath,global.cursor_pointer.x,global.cursor_pointer.y);		
							
					setRoleState(operatedRole,RoleState.selected);
				}
			}	
		}
		break;
		
	case CursorState.selectedRole:
	
		if((input_dx!=0&&input_dy==0)||(input_dx==0&&input_dy!=0)){
			var ins=instance_position(global.cursor_pointer.x+input_dx*UNIT,global.cursor_pointer.y+input_dy*UNIT,obj_canMove);
			if(ins!=noone&&(ins.image_index==CAN_MOVE||ins.image_index==CAN_MOVE_ATTACK)){			
			global.cursor_pointer.x+=input_dx*UNIT;
			global.cursor_pointer.y+=input_dy*UNIT;
			operatedRole.x+=input_dx*UNIT;
			operatedRole.y+=input_dy*UNIT;
			buildPath(playerPath,global.cursor_pointer.x,global.cursor_pointer.y);
			}
		}
		
		else if(isA){
			//if tile have player role,operatRole can move at,but can stop to do more,so check this.
			var isTileCannotMoveTo=false;
			with(operatedRole){
				if(collision_point(x,y,obj_role_player,false,true))
					isTileCannotMoveTo=true;
			}
			if(isTileCannotMoveTo)
				return;
				
			cursorState=CursorState.roleDoMore;
		
			deletePath(playerPath);
			if(instance_exists(obj_canMove)) instance_destroy(obj_canMove);
			
			var center=getCameraCenter(view_camera[0]);
			var menuSide=sign(center[0]-global.cursor_pointer.x+1);
			var menu_x=center[0]+menuSide*center[2];
			var menu_y=center[1];
			
			ins_doMoreMemu=instance_create_layer(menu_x,menu_y,"Layer_menuBoard",obj_doMoreMemu);		
		
			setRoleState(operatedRole,RoleState.doMore);
		}
		
		else if(isB){
			cursorState=CursorState.free;
			
			operatedRole.x=tempRoleX;
			operatedRole.y=tempRoleY;
				
			global.cursor_pointer.x=tempRoleX;
			global.cursor_pointer.y=tempRoleY;
					
			deletePath(playerPath);
			if(instance_exists(obj_canMove)) instance_destroy(obj_canMove);
		
			setRoleState(operatedRole,RoleState.idle);
		}
		
		break;
		
	case CursorState.roleDoMore:
	
		if(input_dy!=0){
			ins_doMoreMemu.doMoreSelectIndex=(NUM_DOMORE_OPTION+ins_doMoreMemu.doMoreSelectIndex+input_dy)%(NUM_DOMORE_OPTION);
						
			if(ins_doMoreMemu.doMoreSelectIndex==OPTION_SKILL){
				if(!instance_exists(obj_canSkill)){
					createCanSkillTile(operatedRole)
				}
			}
			else
			{
				if(instance_exists(obj_canSkill))
					instance_destroy(obj_canSkill);
			}
			
		}
		else if(isA){
			//do more menu option
			switch(ins_doMoreMemu.doMoreSelectIndex){
				case OPTION_FIGHT:	
					targetTypeObj=obj_role_enemy;
					targetTileObj=obj_canMove;
					
					targetIns=initCursorTarget(targetTileObj,targetTypeObj);
					if(targetIns!=noone){
						var center=getCameraCenter(view_camera[0]);
						var menuSide=sign(center[0]-global.cursor_pointer.x+1);
						var board_top=center[1];
						var board_left=center[0]+menuSide*center[2];
						var board_x=center[0]+menuSide*center[2];
						var board_y=center[1];
				
						ins_forecast=instance_create_depth(board_x,board_y,DEPTH_FIGHT_FORECAST,obj_fightForecast);
						ins_forecast.enemyRole=targetIns;
						ins_forecast.playerRole=operatedRole;
						ins_forecast.fightForecastInfo=getFightInfo(ins_forecast.playerRole,ins_forecast.enemyRole,false);
					}
					else
						ins_forecast=noone;
					
					cursorState=CursorState.selectingEnemy;
					ins_doMoreMemu.visible=false;
					break;

				case OPTION_SKILL:
					if(operatedRole.skillName!=noone){
						targetTypeObj=obj_role_player;
						targetTileObj=obj_canSkill;
					
						targetIns=initCursorTarget(targetTileObj,targetTypeObj);
						if(targetIns!=noone){
							var center=getCameraCenter(view_camera[0]);
							var menuSide=sign(center[0]-global.cursor_pointer.x+1);
							var board_top=center[1];
							var board_left=center[0]+menuSide*center[2];
							var board_x=center[0]+menuSide*center[2];
							var board_y=center[1];
				
							ins_forecast=instance_create_depth(board_x,board_y,DEPTH_FIGHT_FORECAST,obj_strengthenForecast);
							ins_forecast.targetRole=targetIns;
							ins_forecast.skillRole=operatedRole;
							ins_forecast.strengthenForecastInfo=getStrengthenInfo(ins_forecast.skillRole);
						}
						else
							ins_forecast=noone;
					
						cursorState=CursorState.selectingSkillTarget;
						ins_doMoreMemu.visible=false;
					}
					break;
			case OPTION_BAG:
					cursorState=CursorState.selectingBagItem;
				
					var center=getCameraCenter(view_camera[0]);
					var menuSide=sign(center[0]-global.cursor_pointer.x+1);
					
					ins_itemMenu=instance_create_layer(center[0]+menuSide*center[2],center[1],"Layer_menuBoard",obj_boxMenu);
					itemSelectIndex=0;

					ins_doMoreMemu.visible=false;
					break;	
				case OPTION_END:
					cursorState=CursorState.nextPlayer;
				
					if(instance_exists(obj_canMove)) instance_destroy(obj_canMove);				
					instance_destroy(ins_doMoreMemu);
					break;

			}			
		}	
		else if(isB){
			cursorState=CursorState.free;
			//global.cursor_pointer.visible=true;
			
			operatedRole.x=tempRoleX;
			operatedRole.y=tempRoleY;
				
			global.cursor_pointer.x=tempRoleX;
			global.cursor_pointer.y=tempRoleY;
			
			
			if(instance_exists(obj_canMove)) instance_destroy(obj_canMove);
			if(instance_exists(obj_canSkill))
					instance_destroy(obj_canSkill);
					
			instance_destroy(ins_doMoreMemu);
		
			setRoleState(operatedRole,RoleState.idle);
		}
		break;
		
	case CursorState.selectingBagItem:
	
		if(input_dy!=0&&operatedRole.curNumItem!=0){
			itemSelectIndex=clamp(itemSelectIndex+input_dy,0,operatedRole.curNumItem-1);
		}
		else if(isA){
			var itemName=ds_grid_get(operatedRole.items,itemSelectIndex,INDEX_ITEM_NAME);
			
			if(isWeapon(itemName)){
				var isSuccess=switchCurWeapon(operatedRole,itemSelectIndex);
				if(isSuccess){
					createSingleMessage("已切换至该武器。","system");				
				}
				else{
					createSingleMessage("该角色无法使用该武器。","system");
				}
				cursorState=CursorState.roleDoMore;			
				instance_destroy(ins_itemMenu);			
				ins_doMoreMemu.visible=true;
			}
			else{
				var usable=canUseItem(itemName,operatedRole);
				if(usable==true){
					cursorState=CursorState.nextPlayer;				
					useItemAtFront(operatedRole,itemSelectIndex);								
					if(instance_exists(obj_canMove)) instance_destroy(obj_canMove);							
					instance_destroy(ins_doMoreMemu);				
					instance_destroy(ins_itemMenu);
				}
				else{	
					createSingleMessage(usable,"system");				
					cursorState=CursorState.roleDoMore;			
					instance_destroy(ins_itemMenu);			
					ins_doMoreMemu.visible=true;				
				}
			}									
		}
		else if(isB){
			cursorState=CursorState.roleDoMore;
			
			instance_destroy(ins_itemMenu);
			
			ins_doMoreMemu.visible=true;
		}
		break;	
	
	case CursorState.selectingSkillTarget:
	
		if((input_dx!=0||input_dy!=0)){
			if(targetIns!=noone){
				var switchTo=switchCursorTarget(input_dx,input_dy,targetTileObj,targetTypeObj);
				if(switchTo!=noone){
					targetIns=switchTo;
				
					ins_forecast.targetRole=targetIns;
				}
			}
		}
		else if(isA){
			
			if(targetIns!=noone){ 	
				
				room_persistent=true;
				
				//set front persistent role disvisible
				for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
					var frontRole=ds_list_find_value(global.playerFrontTeam, i);
					frontRole.visible=false;
				}		
				
				var fightManager=global.thisGame.fightManager;
				fightManager.fighter[FIGHT_L]=targetIns;
				fightManager.fighter[FIGHT_R]=operatedRole;			
				fightManager.curAttackSide=FIGHT_R;
				fightManager.fightBackRoom=room;
		
				global.thisGame.fightManager.fightType=FightType.SKILL;
				room_goto(room_fight);
			
				//reset cursor to role
				global.cursor_pointer.x=operatedRole.x;
				global.cursor_pointer.y=operatedRole.y;
				
				cursorState=CursorState.nextPlayer;
				if(instance_exists(obj_canMove)) instance_destroy(obj_canMove);
				instance_destroy(obj_canSkill);
				instance_destroy(ins_forecast);
			}
		}
		else if(isB){
			cursorState=CursorState.roleDoMore;			
			
			//reset cursor to role
			global.cursor_pointer.x=operatedRole.x;
			global.cursor_pointer.y=operatedRole.y;
			
			ins_doMoreMemu.visible=true;
			instance_destroy(ins_forecast);
		}
		
		break;
		
	case CursorState.selectingEnemy:
		
		if((input_dx!=0||input_dy!=0)){
			if(targetIns!=noone){
				var switchTo=switchCursorTarget(input_dx,input_dy,targetTileObj,targetTypeObj);
				if(switchTo!=noone){
					targetIns=switchTo;
			
					//fightForecastInfo need change targrt
					ins_forecast.enemyRole=targetIns;
					ins_forecast.fightForecastInfo=getFightInfo(ins_forecast.playerRole,ins_forecast.enemyRole,false);		
				}
			}
		}
		else if(isA){
		
		//into fight room , unfight role should be away!

			if(targetIns!=noone){ 
			
				room_persistent=true;
				
				//temporary set persistent for use it in fight room
				//enemy's room start event will reset persistent
				targetIns.persistent=true;
			
				//set front persistent role disvisible
				for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
					var frontRole=ds_list_find_value(global.playerFrontTeam, i);
					frontRole.visible=false;
				}		
				
				var fightManager=global.thisGame.fightManager;
				fightManager.fighter[FIGHT_L]=targetIns;
				fightManager.fighter[FIGHT_R]=operatedRole;			
				fightManager.curAttackSide=FIGHT_R;
				fightManager.fightBackRoom=room;
			
				global.thisGame.fightManager.fightType=FightType.ATTACK;
				room_goto(room_fight);
			
				//reset cursor to role
				global.cursor_pointer.x=operatedRole.x;
				global.cursor_pointer.y=operatedRole.y;
				
				cursorState=CursorState.nextPlayer;
				if(instance_exists(obj_canMove)) instance_destroy(obj_canMove);
				instance_destroy(ins_forecast);
			}
		}
		else if(isB){
			cursorState=CursorState.roleDoMore;		

			//reset cursor to role
			global.cursor_pointer.x=operatedRole.x;
			global.cursor_pointer.y=operatedRole.y;
			
			ins_doMoreMemu.visible=true;
			
			instance_destroy(ins_forecast);
		}
			


		break;
		
	case CursorState.nextPlayer:
		
		if(checkPlayerWin(room)){
			//set cursor to leader
			global.cursor_pointer.x=global.instanceManager.ins_kirito.x;
			global.cursor_pointer.y=global.instanceManager.ins_kirito.y;

			var view_x=global.cursor_pointer.x
			var view_y=global.cursor_pointer.y
			cursorState=CursorState.waitPlayerWinAnimation;
			instance_create_depth(view_x,view_y,1,obj_playerWin);
		}
		else{
			setRoleState(operatedRole,RoleState.gray);
			
			var done=isTeamDone();
			if(done){
				cursorState=CursorState.playerSideEnd;
				//global.playerTeamDone=true;
			}
			else{
				cursorState=CursorState.free;
				//global.cursor_pointer.visible=true;	
			}
		}
		break;
			
	case CursorState.playerSideEnd:	
		show_debug_message("player team done");
		cursorState=CursorState.waitEnemy;
		global.thisGame.enemyFrontManager.enemyManagerState=EnemyManagerState.turnStart;
		break;
	case  CursorState.waitPlayerWinAnimation:
		if(!instance_exists(obj_playerWin)){
			cursorState=CursorState.notInBattle;
			processPlayerWin(room);
		}
		break;

}	




	
	
	
