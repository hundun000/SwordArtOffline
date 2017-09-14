

var dx=0;
var dy=0;
var isA=keyboard_check_pressed(BTN_A);
var isB=keyboard_check_pressed(BTN_B);


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
			if(selectedRole!=noone){				
				selectedRole.x+=dx*UNIT;
				selectedRole.y+=dy*UNIT;
			}
		}
		if(isA){
			selectedRole=instance_position(x,y,obj_role_player);
			if(selectedRole!=noone){
			  if(selectedRole.control==controlType.player)			
				if(selectedRole.roleState==RoleState.idle){	
					state=CursorState.selectedRole;									
					setRoleState(selectedRole,RoleState.gray);
				}
			}
			
			
			
		}
		break;
	default:
}	




	
	
	
