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
	if(isA){	
		global.curMap=0;
		room_goto(room_fake_1_0);		
	}
	break;
	case 1:
	if(isD||isR)
		toWorldPos=0;
	
	break;

	default:
}


switch(toWorldPos){
	case 0:
		toWorldX=660;
		toWorldY=579;	
		break;	
	case 1:
		toWorldX=539;
		toWorldY=496;
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
