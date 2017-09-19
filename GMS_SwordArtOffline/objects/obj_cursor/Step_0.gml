/// @description Insert description here
// You can write your code in this editor
#macro BTN_A ord("Z")
#macro BTN_B ord("X")
#macro BTN_U vk_up
#macro BTN_D vk_down
#macro BTN_L vk_left
#macro BTN_R vk_right

//for test fuction button
#macro BTN_SP ord("Q")


var isA=keyboard_check_pressed(BTN_A);
var isB=keyboard_check_pressed(BTN_B);
var isSP=keyboard_check_pressed(BTN_SP);
var dx=keyboard_check_pressed(BTN_R)-keyboard_check_pressed(BTN_L);
var dy=keyboard_check_pressed(BTN_D)-keyboard_check_pressed(BTN_U);
//var tempRoleX;
//var tempRoleY;

	
switch(state){

	case CursorState.free:
	
		if((dx!=0||dy!=0)
		&&x+dx*UNIT<room_width&&x+dx*UNIT>0
		&&y+dy*UNIT<room_height&&y+dy*UNIT>0){
			x+=dx*UNIT;
			y+=dy*UNIT;
		}
		else if(isA){
			global.operatedRole=instance_position(x,y,obj_role_player);
			if(global.operatedRole!=noone){
			  //if(selectedRole.control==controlType.player)			
				if(global.operatedRole.roleState==RoleState.idle){	
					state=CursorState.selectedRole;
					
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
	
		if((dx!=0||dy!=0)){
			var ins=instance_position(x+dx*UNIT,y+dy*UNIT,obj_canMove);
			if(ins!=noone&&(ins.image_index==CAN_MOVE||ins.image_index==CAN_MOVE_ATTACK)){			
			x+=dx*UNIT;
			y+=dy*UNIT;
			global.operatedRole.x+=dx*UNIT;
			global.operatedRole.y+=dy*UNIT;
			buildPath(playerPath,x,y);
			}
		}
		
		else if(isA){
			state=CursorState.roleDoMore;
			visible=false;
			
			deletePath(playerPath);


			deleteCanMove();
			
			
			var menuSide=sign((VIEW_WIDTH div 2)-x);
		
			doMoreMenu=instance_create_layer((VIEW_WIDTH div 2)+menuSide*(VIEW_WIDTH div 4)
											,VIEW_HEIGHT div 2,"Layer_menuBoard",obj_doMoreMemu);
											
			global.doMoreSelectIndex=0;
			for(var i=0;i<NUM_DOMORE_OPTION;i++){
				with(instance_create_layer(doMoreMenu.x,
											doMoreMenu.y+(i-NUM_DOMORE_OPTION div 2-0.5)*(UNIT+5)
											,"Layer_menuOption",obj_doMoreOption)){
					image_index=i;	
				}
		
			}
			
		
			setRoleState(global.operatedRole,RoleState.doMore);
		}
		
		else if(isB){
			state=CursorState.free;
			
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
	
		if(dy!=0){
			global.doMoreSelectIndex+=dy;
			if(global.doMoreSelectIndex>NUM_DOMORE_OPTION-1)
				global.doMoreSelectIndex=0;
			else if(global.doMoreSelectIndex<0)
				global.doMoreSelectIndex=NUM_DOMORE_OPTION-1;
		}
		else if(isA){
			//do more menu option
			switch(global.doMoreSelectIndex){
				case OPTION_FIGHT:
					state=CursorState.selectingEnemy;
					

					break;
				case OPTION_BAG:
					state=CursorState.selectingBagItem;
				
					var menuSide1=sign((VIEW_WIDTH div 2)-x);
		
					itemMenu=instance_create_layer((VIEW_WIDTH div 2)+menuSide1*(VIEW_WIDTH div 4)
					
													,VIEW_HEIGHT div 2,"Layer_menuBoard",obj_itemMenu);
					global.itemSelectIndex=0;

					
					break;
				case OPTION_END:
					//diffrenet with other case,firstly set role state,for check if team done
					setRoleState(global.operatedRole,RoleState.gray);
					var done=isTeamDone();
					if(done){
						show_message("team done");
						state=CursorState.waitEnemy;
					}
					else{
						state=CursorState.free;
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
			state=CursorState.free;
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
	
		if(dy!=0){
				global.itemSelectIndex=clamp(global.itemSelectIndex+dy,0,NUM_ROLE_ITEM-1);
		}
		else if(isB){
			state=CursorState.roleDoMore;
			
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
		if(!position_meeting(x,y,obj_role_enemy)){	
			var target=noone;
			//target the canAttackTile with a enemy
			with(obj_canMove){
				if(position_meeting(x,y,obj_role_enemy)){
					target=id;
				}	
			}
			//if have,set cursor to there
			if(target!=noone){
				x=target.x;
				y=target.y;
			}
			visible=true;
		}
		
		//switch target
		if((dx!=0||dy!=0)){
			var cursoX=x;
			var cursoY=y;
			var target=noone;
			//search at inputted direction
			with(obj_canMove){
				if(!(x==cursoX&&y==cursoY) //no current
					&&(sign(dx)==sign(x-cursoX)||sign(dy)==sign(y-cursoY)) //inputted direction
					&&position_meeting(x,y,obj_role_enemy)){
					target=id;
				}	
			}
			
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
			state=CursorState.intoFightRoom;
			room_persistent=true;
			
			var enemy=instance_position(x,y,obj_role_enemy);
			enemy.persistent=true;
			
			with(obj_role_player) visible=false;
			
			global.fighter_L=enemy;
			global.fighter_R=global.operatedRole;			

			deleteCanMove();
			
			room_goto(room_fight);
		}
		
			
		
		}
		else if(isB){
			state=CursorState.roleDoMore;
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
				state=CursorState.waitEnemy;
			}
			else{
				state=CursorState.free;
				visible=true;
					
						
			}
			
		
	default:
}	




	
	
	
