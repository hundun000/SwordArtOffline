/// @description Insert description here
// You can write your code in this editor

if(global.inputReceiver!=InputReceiver.cursor)	return;


//for test fuction button
#macro BTN_SP ord("Q")
var isSP=keyboard_check_pressed(BTN_SP);




	
switch(cursorstate){

	case CursorState.free:
	
		if((input_dx!=0||input_dy!=0)
		&&x+input_dx*UNIT<room_width&&x+input_dx*UNIT>0
		&&y+input_dy*UNIT<room_height&&y+input_dy*UNIT>0){
			x+=input_dx*UNIT;
			y+=input_dy*UNIT;
		}
		else if(isA){
			global.operatedRole=instance_position(x,y,obj_role_player);
			if(global.operatedRole!=noone){
			  //if(selectedRole.control==controlType.player)			
				if(global.operatedRole.roleState==RoleState.idle){	
					cursorstate=CursorState.selectedRole;
					
					tempRoleX=global.operatedRole.x;
					tempRoleY=global.operatedRole.y;
					
					playerPath=path_add();
					buildPath(playerPath,x,y);		
							
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
			var ins=instance_position(x+input_dx*UNIT,y+input_dy*UNIT,obj_canMove);
			if(ins!=noone&&(ins.image_index==CAN_MOVE||ins.image_index==CAN_MOVE_ATTACK)){			
			x+=input_dx*UNIT;
			y+=input_dy*UNIT;
			global.operatedRole.x+=input_dx*UNIT;
			global.operatedRole.y+=input_dy*UNIT;
			buildPath(playerPath,x,y);
			}
		}
		
		else if(isA){
			cursorstate=CursorState.roleDoMore;
			visible=false;
			
			deletePath(playerPath);


			deleteCanMove();
			
			var center=getCameraCenter(view_camera[0]);
			var menuSide=sign(center[0]-x+1);
			
			show_debug_message(string(center[0]/64)+" "+string(center[1]/64)+" "+string(center[2]/64));
		
			doMoreMenu=instance_create_layer(center[0]+menuSide*center[2],center[1],"Layer_menuBoard",obj_doMoreMemu);
											
			global.doMoreSelectIndex=0;
			for(var i=0;i<NUM_DOMORE_OPTION;i++){
				with(instance_create_layer(doMoreMenu.x,
											doMoreMenu.y+(i-NUM_DOMORE_OPTION *0.5-0.5)*(UNIT+5)
											,"Layer_menuOption",obj_doMoreOption)){
					image_index=i;	
				}
		
			}
			
		
			setRoleState(global.operatedRole,RoleState.doMore);
		}
		
		else if(isB){
			cursorstate=CursorState.free;
			
			global.operatedRole.x=tempRoleX;
			global.operatedRole.y=tempRoleY;
				
			x=tempRoleX;
			y=tempRoleY;
					
			deletePath(playerPath);
			deleteCanMove();
		
			setRoleState(global.operatedRole,RoleState.idle);
		}
		
		break;
		
	case CursorState.roleDoMore:
	
		if(input_dy!=0){
			global.doMoreSelectIndex+=input_dy;
			if(global.doMoreSelectIndex>NUM_DOMORE_OPTION-1)
				global.doMoreSelectIndex=0;
			else if(global.doMoreSelectIndex<0)
				global.doMoreSelectIndex=NUM_DOMORE_OPTION-1;
		}
		else if(isA){
			//do more menu option
			switch(global.doMoreSelectIndex){
				case OPTION_FIGHT:
					target=noone;
					cursorstate=CursorState.selectingEnemy;
					

					break;
				case OPTION_BAG:
					cursorstate=CursorState.selectingBagItem;
				
					var center=getCameraCenter(view_camera[0]);
					var menuSide=sign(center[0]-x+1);
		
					show_debug_message(string(center[0]/64)+" "+string(center[1]/64)+" "+string(center[2]/64));
					
					itemMenu=instance_create_layer(center[0]+menuSide*center[2],center[1],"Layer_menuBoard",obj_itemMenu);
					global.itemSelectIndex=0;

					
					break;
				case OPTION_END:
					//diffrenet with other case,firstly set role cursorstate,for check if team done
					setRoleState(global.operatedRole,RoleState.gray);
					var done=isTeamDone();
					if(done){
						show_message("team done");
						cursorstate=CursorState.waitEnemy;
					}
					else{
						cursorstate=CursorState.free;
						visible=true;
					
						
					}
					
					deleteCanMove();
					
					instance_destroy(obj_doMoreMemu);
					instance_destroy(obj_doMoreOption);

					
					
				
				default:
			
			}
			
			with(obj_doMoreMemu){
				visible=false;
			}
			with(obj_doMoreOption){
				visible=false;
			}
			
			
		}	
		else if(isB){
			cursorstate=CursorState.free;
			visible=true;
			
			global.operatedRole.x=tempRoleX;
			global.operatedRole.y=tempRoleY;
				
			x=tempRoleX;
			y=tempRoleY;
					
			deleteCanMove();
			
			instance_destroy(obj_doMoreMemu);
			instance_destroy(obj_doMoreOption);
		
			setRoleState(global.operatedRole,RoleState.idle);
		}
		break;
		
	case CursorState.selectingBagItem:
	
		if(input_dy!=0){
				global.itemSelectIndex=clamp(global.itemSelectIndex+input_dy,0,NUM_ROLE_ITEM-1);
		}
		else if(isB){
			cursorstate=CursorState.roleDoMore;
			
			instance_destroy(obj_itemMenu);
			
			with(obj_doMoreMemu){
				visible=true;
			}
			with(obj_doMoreOption){
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
				x=target.x;
				y=target.y;
			}
			visible=true;
		}
		
		//switch target
		if((input_dx!=0||input_dy!=0)){
			var cursoX=x;
			var cursoY=y;
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
				x=target.x;
				y=target.y;
			}

		}
		else if(isA){
		
		//into fight room , unfight role should be away!

		if(x!=global.operatedRole.x||y!=global.operatedRole.y){  //means truely target to a enemy ,not player role
			cursorstate=CursorState.intoFightRoom;
			room_persistent=true;
			
			//temporary set persistent for use it in fight room
			target.persistent=true;
			
			//set front persistent role disvisible
			for(var i=0;i<array_length_1d(global.playerFrontTeam);i++)
				global.playerFrontTeam[i].visible=false;
			

			
			global.fighter_L=target;
			global.fighter_R=global.operatedRole;			
			global.curAttackSide=FIGHT_R;

			deleteCanMove();
			
			room_goto(room_fight);
		}
		
			
		
		}
		else if(isB){
			cursorstate=CursorState.roleDoMore;
			visible=false;
			
			//for have into selectingEnemy state,cursor will set to enemy,now reset to role
			x=tempRoleX;
			y=tempRoleY;
			
			with(obj_doMoreMemu){
				visible=true;
			}
			with(obj_doMoreOption){
				visible=true;
			}
		
		}
			


		break;
		
		case CursorState.intoFightRoom:
			setRoleState(global.operatedRole,RoleState.gray);
			var done=isTeamDone();
			if(done){
				show_message("team done");
				cursorstate=CursorState.waitEnemy;
			}
			else{
				cursorstate=CursorState.free;
				visible=true;
					
						
			}
			
		
	default:
}	




	
	
	
