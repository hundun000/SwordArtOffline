var myX=argument0;
var myY=argument1;
var attackRangeFrom=argument2;
var attackRangeTo=argument3;
var isBuildMe=argument4;

var r;
	var ddx;
	var ddy;
	for(r=attackRangeFrom;r<=attackRangeTo;r++){
		for(ddx=-r;ddx<=r;ddx++){
			ddy=r-abs(ddx);
			if(instance_position(myX+ddx*UNIT,myY+ddy*UNIT,obj_canMove)==noone){
				with(instance_create_layer(myX+ddx*UNIT,myY+ddy*UNIT,CAN_MOVE_LAYER,obj_canMove)){
					image_index=CAN_ATTACK;
				}
			}
			ddy=abs(ddx)-r;
			if(instance_position(myX+ddx*UNIT,myY+ddy*UNIT,obj_canMove)==noone){
				with(instance_create_layer(myX+ddx*UNIT,myY+ddy*UNIT,CAN_MOVE_LAYER,obj_canMove)){
					image_index=CAN_ATTACK;
				}
			}
		}
	}