/// @description Insert description here
// You can write your code in this editor


#macro TEAM_FLAG_SPEED 8

if(global.inputReceiver!=InputReceiver.worldTeamFlag) return;

var isU=input_dy==-1;
var isD=input_dy==1;
var isL=input_dx=-1;
var isR=input_dx==1;

//fast return
//if(isU+isD+isL+isR==0&&toWorldPos==curWorldPos) return;

switch(curWorldPos){
	case 0:
	if(isU||isL)
		toWorldPos=1;
	break;
	case 1:
	if(isD||isR)
		toWorldPos=0;
	else if(isA){	
	
		addRoleToFront(global.asuna,room_map_0,0);
		addRoleToFront(global.kirito,room_map_0,1);
		addRoleToFront(global.silica,room_map_0,2);
		
		global.inputReceiver=InputReceiver.cursor;
		global.curMap=0;
		room_goto(room_map_0);		
	}
	break;

	default:
}


switch(toWorldPos){
	case 0:
		toWorldX=714;
		toWorldY=524;	
		break;	
	case 1:
		toWorldX=630;
		toWorldY=446;
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
