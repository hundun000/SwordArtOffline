#macro CAN_MOVE 0
#macro CAN_ATTACK 1
#macro BLANK 2
#macro CAN_MOVE_LAYER "Instances_canMove"


var myX=argument0;
var myY=argument1;
var type=argument2;
var movement=argument3;
var attackRangeFrom=argument4;
var attackRangeTo=argument5;


if(movement>=0&&myX>0&&myX<room_width&&myY>0&&myY<room_height){
	//legal position
	//var canMove=true;
	//var canAttack=true;
	//var shouldBlank=true;
	
	var ins_pos=instance_position(myX,myY,obj_canMove);
	
	var testX=getTileIndex(myX);//for debug see
	var testY=getTileIndex(myY);//for debug see
	
	

	switch(type){
		case RoleType.walker:
		if(position_meeting(myX,myY,obj_tile_hill))
			return;
		default:
	}
	
	if(position_meeting(myX,myY,obj_role_enemy)){
		return;
	}
	
	

	
	

	if(ins_pos==noone){
			instance_create_layer(myX,myY,CAN_MOVE_LAYER,obj_canMove);
	}
	else{
		if(ins_pos.image_index==CAN_MOVE)
			return;
		ins_pos.image_index=CAN_MOVE;
	}
	
	buildCanAttackTile(myX,myY,attackRangeFrom,attackRangeTo,true);
	

	var dx;
	var dy;
	
	dx=1;
	dy=0;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1,attackRangeFrom,attackRangeTo);
	dx=-1;
	dy=0;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1,attackRangeFrom,attackRangeTo);
	dx=0;
	dy=1;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1,attackRangeFrom,attackRangeTo);
	dx=0;
	dy=-1;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1,attackRangeFrom,attackRangeTo);
	

	

}