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
	case room_map_0:
		switch(posIndex){
			case 0:
				posX=4.5*UNIT;
				posY=2.5*UNIT;
				break;
			case 1:
				posX=3.5*UNIT;
				posY=3.5*UNIT;
				break;
			case 2:
				posX=2.5*UNIT;
				posY=2.5*UNIT;
				break;	
		}
		break;
	case room_battle_1_1:
		switch(posIndex){
			case 0:
				posX=1.5*UNIT;
				posY=6.5*UNIT;
				break;
				
		}	
		break;
	case room_battle_2_1:
		switch(posIndex){
			case 0:
				posX=5.5*UNIT;
				posY=9.5*UNIT;
				break;
			case 1:
				posX=4.5*UNIT;
				posY=9.5*UNIT;
				break;
				
		}	
		
}

role.x=posX;
role.y=posY;
role.visible=true;
role.isFront=true; //use flag to sign role is in TeamFront


ds_list_add(global.playerFrontTeam,role);


