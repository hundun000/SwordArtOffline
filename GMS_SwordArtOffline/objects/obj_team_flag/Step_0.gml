/// @description Insert description here
// You can write your code in this editor
#macro TEAM_FLAG_SPEED 8


var isU=keyboard_check_pressed(BTN_U);
var isD=keyboard_check_pressed(BTN_D);
var isL=keyboard_check_pressed(BTN_L);
var isR=keyboard_check_pressed(BTN_R);
var isA=keyboard_check_pressed(BTN_A);
var isB=keyboard_check_pressed(BTN_B);

//fast return
//if(isU+isD+isL+isR==0&&toWorldPos==curWorldPos) return;

switch(curWorldPos){
	case 0:
	if(isD||isR)
		toWorldPos=1;

	break;
	case 1:
	if(isU||isL)
		toWorldPos=0;
	else if(isA){
		

		addRoleToFront(asuna,room_map_0,0);
		room_goto(room_map_0);
			
	}
	break;

	default:
}


switch(toWorldPos){
	case 0:
		toWorldX=159;
		toWorldY=205;	
		break;	
	case 1:
		toWorldX=544;
		toWorldY=414;
	break;

	default:
}


if(distance_to_point(toWorldX,toWorldY)<TEAM_FLAG_SPEED){
	x=toWorldX;
	y=toWorldY;
	speed=0;
	curWorldPos=toWorldPos;
}
else{
	move_towards_point(toWorldX,toWorldY,TEAM_FLAG_SPEED);
}
