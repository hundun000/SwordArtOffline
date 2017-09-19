//#macro BLANK 0
#macro CAN_ATTACK 1
#macro CAN_MOVE 2
#macro CAN_MOVE_ATTACK 3




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
	


	//handle tile caused cann't move
	switch(type){
		case RoleType.walker:
		if(position_meeting(myX,myY,obj_tile_hill))
			return;
		default:
	}
	
	//handle rival caused cann't move
	if(position_meeting(myX,myY,obj_role_enemy)){
		return;
	}
	
	var ins_pos=instance_position(myX,myY,obj_canMove);	
	
	if(ins_pos==noone){
		//this case must can move
		var new=instance_create_layer(myX,myY,CAN_MOVE_LAYER,obj_canMove);
		new.image_index=CAN_MOVE;
	}
	else if(ins_pos.image_index==CAN_MOVE||ins_pos.image_index=CAN_MOVE_ATTACK)
			//mean this tile can move case had processed.
			return;
	else if(ins_pos.image_index==CAN_ATTACK)
			//renew
			ins_pos.image_index=CAN_MOVE_ATTACK;

	
	//just in this tile,sign the can attack tiles
	buildCanAttackTile(myX,myY,attackRangeFrom,attackRangeTo);
	

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