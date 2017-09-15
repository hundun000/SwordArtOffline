

var dx=0;
var dy=0;
var isA=keyboard_check_pressed(BTN_A);
var isB=keyboard_check_pressed(BTN_B);

var tempRoleX;
var tempRoleY;



if(keyboard_check_pressed(BTN_U))
	dy=-1;
if(keyboard_check_pressed(BTN_D))
	dy=1;
if(keyboard_check_pressed(BTN_L))
	dx=-1;
if(keyboard_check_pressed(BTN_R))
	dx=1;
	
switch(state){
	case CursorState.free:
		if(dx!=0||dy!=0){
			x+=dx*UNIT;
			y+=dy*UNIT;
		}
		if(isA){
			selectedRole=instance_position(x,y,obj_role_player);
			if(selectedRole!=noone){
			  //if(selectedRole.control==controlType.player)			
				if(selectedRole.roleState==RoleState.idle){	
					state=CursorState.selectedRole;
					
					tempRoleX=selectedRole.x;
					tempRoleY=selectedRole.y;
					
					playerPath=path_add();
					buildPath(playerPath,x,y);		
							
					setRoleState(selectedRole,RoleState.selected);
				}
			}
			
			
			
		}
		break;
	case CursorState.selectedRole:
		if((dx!=0||dy!=0)){
			var ins=instance_position(x+dx*UNIT,y+dy*UNIT,obj_canMove);
			if(ins!=noone&&ins.image_index==CAN_MOVE){
			
			
			
			x+=dx*UNIT;
			y+=dy*UNIT;
			selectedRole.x+=dx*UNIT;
			selectedRole.y+=dy*UNIT;
			buildPath(playerPath,x,y);
			}
		}
		
		if(isA){
			state=CursorState.moved;
			

			while(path_get_number(playerPath)>0){
			//cut "short circuit" nodes
				instance_destroy(instance_position(path_get_point_x(playerPath,0),path_get_point_y(playerPath,0),obj_pathNode));
				path_delete_point(playerPath,0); 
			}

			path_delete(playerPath);

			while(instance_number(obj_canMove)>0){
				 instance_destroy(instance_find(obj_canMove,instance_number(obj_canMove)-1));
			 }
		
			setRoleState(selectedRole,RoleState.gray);
		}
		
		break;
	
	default:
}	




	
	
	
