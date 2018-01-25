/// @description Insert description here
// You can write your code in this editor



if(global.inputReceiver!=InputReceiver.cursor)	return;


//for test fuction button
#macro BTN_SP ord("Q")
var isSP=keyboard_check_pressed(BTN_SP);




	
switch(cursorState){
	case CursorState.turnStart:
		show_debug_message("cursor turn start");
		
		
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
		else if(isSP){	
			room_persistent=true;	
			room_goto(room_world);
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
			var stop_at_hold_tile=false;
			with(operatedRole){
				if(collision_point(x,y,obj_role_player,false,true))
					stop_at_hold_tile=true;
			}
			if(stop_at_hold_tile)
				return;
				
			cursorState=CursorState.roleDoMore;
		
			deletePath(playerPath);
			deleteCanMove();
			
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
			deleteCanMove();
		
			setRoleState(operatedRole,RoleState.idle);
		}
		
		break;
		
	case CursorState.roleDoMore:
	
		if(input_dy!=0){
			ins_doMoreMemu.doMoreSelectIndex=(NUM_DOMORE_OPTION+ins_doMoreMemu.doMoreSelectIndex+input_dy)%(NUM_DOMORE_OPTION);
		}
		else if(isA){
			//do more menu option
			var doMoreMemu=instance_find(obj_doMoreMemu,0);
			switch(doMoreMemu.doMoreSelectIndex){
				case OPTION_FIGHT:
					target=noone;
					cursorState=CursorState.selectingEnemy;
					ins_doMoreMemu.visible=false;
					break;
				case OPTION_BAG:
					cursorState=CursorState.selectingBagItem;
				
					var center=getCameraCenter(view_camera[0]);
					var menuSide=sign(center[0]-global.cursor_pointer.x+1);
					
					ins_itemMenu=instance_create_layer(center[0]+menuSide*center[2],center[1],"Layer_menuBoard",obj_itemMenu);
					itemSelectIndex=0;

					ins_doMoreMemu.visible=false;
					break;
				case OPTION_TALK:
					createSingleMessage("This function has not been implemented",operatedRole.name);
					isA=false;
					ins_doMoreMemu.visible=false;
					return;
					
				case OPTION_END:
					cursorState=CursorState.nextPlayer;
				
					deleteCanMove();				
					instance_destroy(ins_doMoreMemu);
				
				default:
			
			}
			

			
			
		}	
		else if(isB){
			cursorState=CursorState.free;
			//global.cursor_pointer.visible=true;
			
			operatedRole.x=tempRoleX;
			operatedRole.y=tempRoleY;
				
			global.cursor_pointer.x=tempRoleX;
			global.cursor_pointer.y=tempRoleY;
			
			
			deleteCanMove();
			
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
				curWeaponIndex=itemSelectIndex;
				
				createSingleMessage("已切换至该武器。","system");				
				cursorState=CursorState.roleDoMore;			
				instance_destroy(ins_itemMenu);			
				ins_doMoreMemu.visible=true;
			}
			else{
				var usable=canUseItem(itemName,operatedRole);
				if(usable==true){
					cursorState=CursorState.nextPlayer;				
					useItemAtFront(operatedRole,itemSelectIndex);								
					deleteCanMove();							
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
	case CursorState.selectingEnemy:
			
		//if not target a enmey,try to auto target
		if(target==noone){	
			//target the canAttackTile with a enemy
			var temp_for_with=noone;
			with(obj_canMove){//this state only can attack tile,so no need to check
				var pos_ins=instance_position(x,y,obj_role_enemy);
				if(pos_ins!=noone){
					temp_for_with=pos_ins;
				}	
			}
			target=temp_for_with;
			//if have,set cursor to there
			if(target!=noone){		
				
				global.cursor_pointer.x=target.x;
				global.cursor_pointer.y=target.y;
				
				var center=getCameraCenter(view_camera[0]);
				var menuSide=sign(center[0]-global.cursor_pointer.x+1);
				var board_top=center[1];
				var board_left=center[0]+menuSide*center[2];
				var board_x=center[0]+menuSide*center[2];
				var board_y=center[1];
				
				ins_fightForecast=instance_create_depth(board_x,board_y,DEPTH_FIGHT_FORECAST,obj_fightForecast);
				ins_fightForecast.enemyRole=target;
				ins_fightForecast.playerRole=operatedRole;
				ins_fightForecast.fightForecastInfo=getFightInfo(ins_fightForecast.playerRole,ins_fightForecast.enemyRole,false);
				

			}
		}
		
		//switch target
		if((input_dx!=0||input_dy!=0)){
			var cursoX=global.cursor_pointer.x;
			var cursoY=global.cursor_pointer.y;
			var intoWith_input_dx=input_dx;
			var intoWith_input_dy=input_dy;
			//search at inputted direction
			var temp_for_with=noone;
			with(obj_canMove){//this state only can attack tile,so no need to check
				var pos_ins=instance_position(x,y,obj_role_enemy);
				if(!(x==cursoX&&y==cursoY) //no current
					&&(sign(intoWith_input_dx)==sign(x-cursoX)||sign(intoWith_input_dy)==sign(y-cursoY)) //inputted direction
					&&pos_ins!=noone){
					temp_for_with=pos_ins;
				}	
			}
			if(temp_for_with!=noone)
				target=temp_for_with;
			/*
			//not found at inputted direction,search at all direction
			if(target==noone){
				with(obj_canMove){
					if(!(x==cursoX&&y==cursoY) //no current
					&&position_meeting(x,y,obj_role_enemy)){
						target=id;
					}
				}	
			}
			*/
			
			//if have another,change cursor to there
			if(target!=noone){
				global.cursor_pointer.x=target.x;
				global.cursor_pointer.y=target.y;
				
				//fightForecastInfo need change targrt
				ins_fightForecast.enemyRole=target;
				ins_fightForecast.playerRole=operatedRole;
				ins_fightForecast.fightForecastInfo=getFightInfo(ins_fightForecast.playerRole,ins_fightForecast.enemyRole,false);		
			}

		}
		else if(isA){
		
		//into fight room , unfight role should be away!

			if(global.cursor_pointer.x!=operatedRole.x||global.cursor_pointer.y!=operatedRole.y){  //means truely target to a enemy ,not player role

				room_persistent=true;
			
				//temporary set persistent for use it in fight room
				//enemy's room start event will reset persistent
				target.persistent=true;
			
				//set front persistent role disvisible
				for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
					var frontRole=ds_list_find_value(global.playerFrontTeam, i);
					frontRole.visible=false;
				}		
				
				var fightManager=global.thisGame.fightManager;
				fightManager.fighter[FIGHT_L]=target;
				fightManager.fighter[FIGHT_R]=operatedRole;			
				fightManager.curAttackSide=FIGHT_R;
				fightManager.fightBackRoom=room;
			
				deleteCanMove();
			
				room_goto(room_fight);
			
				room_enter_counter=0;
				cursorState=CursorState.nextPlayer;
				
				instance_destroy(ins_fightForecast);
			}
		}
		else if(isB){
			cursorState=CursorState.roleDoMore;
			//global.cursor_pointer.visible=false;
			

			//for have into selectingEnemy state,cursor will set to enemy,now reset to role
			global.cursor_pointer.x=operatedRole.x;
			global.cursor_pointer.y=operatedRole.y;
			
			ins_doMoreMemu.visible=true;
			
			instance_destroy(ins_fightForecast);

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
		with(obj_enemyManager){
			enemyManagerState=EnemyManagerState.turnStart;
		}
		break;
	case  CursorState.waitPlayerWinAnimation:
		if(!instance_exists(obj_playerWin)){
			cursorState=CursorState.notInBattle;
			processPlayerWin(room);
		}
		break;
	default:
}	




	
	
	
