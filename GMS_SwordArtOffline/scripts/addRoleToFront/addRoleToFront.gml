/// @function addRoleToFront
/// @description add Role To Front
/// @argument0 Role 
/// @argument1 mapIndex
/// @argument1 posIndex

var role=argument0;
var targetRoom=argument1;
var posIndex=argument2;

var posX;
var posY;

switch(targetRoom){
	case room_battle_1_1:
		switch(posIndex){
			case 0:
				posX=1*UNIT;
				posY=6*UNIT;
				break;
				
		}	
		break;
	case room_battle_2_1:
		switch(posIndex){
			case 0:
				posX=5*UNIT;
				posY=9*UNIT;
				break;
			case 1:
				posX=4*UNIT;
				posY=9*UNIT;
				break;
				
		}	
		break;
	case room_battle_3_1:
		switch(posIndex){
			case 0:
				posX=14*UNIT;
				posY=9*UNIT;
				break;
			case 1:
				posX=8*UNIT;
				posY=2*UNIT;
				break;
				
		}
		break;
		
}
posX+=0.5*UNIT;
posY+=0.5*UNIT;

role.x=posX;
role.y=posY;
role.visible=true;
role.isFront=true; //use flag to sign role is in TeamFront


ds_list_add(global.playerFrontTeam,role);
role.isFront=true;

