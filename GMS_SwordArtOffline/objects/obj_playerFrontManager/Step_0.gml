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
			global.operatedRole=instance_position(global.cursor_pointer.x,global.cursor_pointer.y,obj_role_player);
			if(global.operatedRole!=noone){
			  //if(selectedRole.control==controlType.player)			
				if(global.operatedRole.roleState==RoleState.idle){	
					cursorState=CursorState.selectedRole;
					
					tempRoleX=global.operatedRole.x;
					tempRoleY=global.operatedRole.y;
					
					playerPath=path_add();
					buildPath(playerPath,global.cursor_pointer.x,global.cursor_pointer.y);		
							
					setRoleState(global.operatedRole,RoleState.selected);
				}
			}	
		}
		else if(isSP){	
			room_persistent=true;	
			room_goto(room_world);
		}
		break;
		
	case CursorState.selectedRole:
	
		if((input_dx!=0||input_dy!=0)){
			var ins=instance_position(global.cursor_pointer.x+input_dx*UNIT,global.cursor_pointer.y+input_dy*UNIT,obj_canMove);
			if(ins!=noone&&(ins.image_index==CAN_MOVE||ins.image_index==CAN_MOVE_ATTACK)){			
			global.cursor_pointer.x+=input_dx*UNIT;
			global.cursor_pointer.y+=input_dy*UNIT;
			global.operatedRole.x+=input_dx*UNIT;
			global.operatedRole.y+=input_dy*UNIT;
			buildPath(playerPath,global.cursor_pointer.x,global.cursor_pointer.y);
			}
		}
		
		else if(isA){
			//if tile have player role,operatRole can move at,but can stop to do more,so check this.
			var stop_at_hold_tile=false;
			with(global.operatedRole){
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
			
			instance_create_layer(center[0]+menuSide*center[2],center[1],"Layer_menuBoard",obj_doMoreMemu);		
		
			setRoleState(global.operatedRole,RoleState.doMore);
		}
		
		else if(isB){
			cursorState=CursorState.free;
			
			global.operatedRole.x=tempRoleX;
			global.operatedRole.y=tempRoleY;
				
			global.cursor_pointer.x=tempRoleX;
			global.cursor_pointer.y=tempRoleY;
					
			deletePath(playerPath);
			deleteCanMove();
		
			setRoleState(global.operatedRole,RoleState.idle);
		}
		
		break;
		
	case CursorState.roleDoMore:
	
		if(input_dy!=0){
			var doMoreMemu=instance_find(obj_doMoreMemu,0);
			doMoreMemu.doMoreSelectIndex=(NUM_DOMORE_OPTION+doMoreMemu.doMoreSelectIndex+input_dy)%(NUM_DOMORE_OPTION);
		}
		else if(isA){
			//do more menu option
			var doMoreMemu=instance_find(obj_doMoreMemu,0);
			switch(doMoreMemu.doMoreSelectIndex){
				case OPTION_FIGHT:
					target=noone;
					cursorState=CursorState.selectingEnemy;
					

					break;
				case OPTION_BAG:
					cursorState=CursorState.selectingBagItem;
				
					var center=getCameraCenter(view_camera[0]);
					var menuSide=sign(center[0]-global.cursor_pointer.x+1);
		
				//	show_debug_message(string(center[0]/64)+" "+string(center[1]/64)+" "+string(center[2]/64));
					
					itemMenu=instance_create_layer(center[0]+menuSide*center[2],center[1],"Layer_menuBoard",obj_itemMenu);
					global.itemSelectIndex=0;

					
					break;
				case OPTION_TALK:
					createSingleMessage("This function has not been implemented",global.operatedRole.name);
					return;
					
				case OPTION_END:
					cursorState=CursorState.nextPlayer;
				
					deleteCanMove();				
					instance_destroy(obj_doMoreMemu);
				
				default:
			
			}
			
			with(obj_doMoreMemu){
				visible=false;
			}
			
			
		}	
		else if(isB){
			cursorState=CursorState.free;
			//global.cursor_pointer.visible=true;
			
			global.operatedRole.x=tempRoleX;
			global.operatedRole.y=tempRoleY;
				
			global.cursor_pointer.x=tempRoleX;
			global.cursor_pointer.y=tempRoleY;
			
			
			deleteCanMove();
			
			instance_destroy(obj_doMoreMemu);
		
			setRoleState(global.operatedRole,RoleState.idle);
		}
		break;
		
	case CursorState.selectingBagItem:
	
		if(input_dy!=0&&global.operatedRole.num_curItem!=0){
			global.itemSelectIndex=(global.itemSelectIndex+input_dy+global.operatedRole.num_curItem)%global.operatedRole.num_curItem;
		}
		else if(isA){
			var itemName=ds_grid_get(global.operatedRole.items,global.itemSelectIndex,INDEX_ITEM_NAME);
			if(canUseItem(itemName,global.operatedRole)){
				cursorState=CursorState.nextPlayer;
				
				UseItem(global.operatedRole,global.itemSelectIndex);					
				
				deleteCanMove();		
					
				instance_destroy(obj_doMoreMemu);
	
				
				instance_destroy(obj_itemMenu);
			}
			else{	
				createSingleMessage("Cannot use this item.","system");
				
				cursorState=CursorState.roleDoMore;
			
				instance_destroy(obj_itemMenu);
			
				with(obj_doMoreMemu){
					visible=true;
				}

				
				
			}
			
		}
		else if(isB){
			cursorState=CursorState.roleDoMore;
			
			instance_destroy(obj_itemMenu);
			
			with(obj_doMoreMemu){
				visible=true;
			}

		
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
				fightForecastInfo=noone;
				global.cursor_pointer.x=target.x;
				global.cursor_pointer.y=target.y;
			}
			//global.cursor_pointer.visible=true;
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
			
			//if have,set cursor to there
			if(target!=noone){
				//fightForecastInfo need change targrt
				fightForecastInfo=noone;
				global.cursor_pointer.x=target.x;
				global.cursor_pointer.y=target.y;
			}

		}
		else if(isA){
		
		//into fight room , unfight role should be away!

		if(global.cursor_pointer.x!=global.operatedRole.x||global.cursor_pointer.y!=global.operatedRole.y){  //means truely target to a enemy ,not player role

			room_persistent=true;
			
			//temporary set persistent for use it in fight room
			//enemy's room start event will reset persistent
			target.persistent=true;
			
			//set front persistent role disvisible
			for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
					var frontRole=ds_list_find_value(global.playerFrontTeam, i);
					frontRole.visible=false;
			}
			
			global.fighter_L=target;
			global.fighter_R=global.operatedRole;			
			global.curAttackSide=FIGHT_R;
			global.fightBackRoom=room;
			//global.fight_found_side=FIGHT_R;
			
			deleteCanMove();
			
			room_goto(room_fight);
			
			room_enter_counter=0;
			cursorState=CursorState.nextPlayer;
		}
		
			
		
		}
		else if(isB){
			cursorState=CursorState.roleDoMore;
			//global.cursor_pointer.visible=false;
			

			//for have into selectingEnemy state,cursor will set to enemy,now reset to role
			global.cursor_pointer.x=global.operatedRole.x;
			global.cursor_pointer.y=global.operatedRole.y;
			
			with(obj_doMoreMemu){
				visible=true;
			}

		}
			


		break;
		
		case CursorState.nextPlayer:
		
			if(checkPlayerWin(room)){
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
				cursorState=CursorState.waitPlayerWinAnimation;
				instance_create_depth(view_x,view_y,1,obj_playerWin);
			}
			else{
				setRoleState(global.operatedRole,RoleState.gray);
			
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




	
	
	
