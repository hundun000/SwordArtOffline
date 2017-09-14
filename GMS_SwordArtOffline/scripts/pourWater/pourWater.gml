var myX=argument0;
var myY=argument1;
var type=argument2;
var movement=argument3;

//show_message("Try pour:");
//show_message(getTileIndex(myX));
//show_message(getTileIndex(myY));


if(movement>0&&myX>0&&myX<room_width&&myY>0&&myY<room_height&&!position_meeting(myX,myY,obj_canMove)){
	
	
	switch(type){
		case RoleType.walker:
		if(position_meeting(myX,myY,obj_tile_hill))
			return;
			
		default:
	}
	
	//instance_create(myX,myY,obj_canMove);
	instance_create_layer(myX,myY,"Instances_canMove",obj_canMove);
	
	var dx;
	var dy;
	
	dx=1;
	dy=0;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1);
	dx=-1;
	dy=0;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1);
	dx=0;
	dy=1;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1);
	dx=0;
	dy=-1;
	pourWater(myX+dx*UNIT,myY+dy*UNIT,type,movement-1);

}