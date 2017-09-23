var myX=argument0;
var myY=argument1;
var attackRangeFrom=argument2;
var attackRangeTo=argument3;
var tileVisible=argument4;

var r;
	var ddx;
	var ddy;
	var ssign;
	for(r=attackRangeFrom;r<=attackRangeTo;r++)
		for(ddx=-r;ddx<=r;ddx++)
			for(ssign=-1;ssign<=1;ssign+=2){
				ddy=ssign*(r-abs(ddx));
				var here=instance_position(myX+ddx*UNIT,myY+ddy*UNIT,obj_canMove);
				if(here==noone){
					//in here==noone case,new a can attack
					here=instance_create_layer(myX+ddx*UNIT,myY+ddy*UNIT,CAN_MOVE_LAYER,obj_canMove);
				
						here.visible=tileVisible;
						
						here.image_index=CAN_ATTACK;
				}
				else if(here.image_index==CAN_MOVE){
					//in here==CAN_ATTACK case,renew to can_move_attack
					here.image_index=CAN_MOVE_ATTACK;
				}
			}