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
		}
}

role.x=posX;
role.y=posY;
role.visible=true;


