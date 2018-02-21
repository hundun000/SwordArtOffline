///@argument0 targetTileObj
///@argument1 targetTypeObj
var targetTileObj=argument0;
var targetTypeObj=argument1;
var targetAns;

//target the canAttackTile with a enemy
var temp_for_with=noone;
with(targetTileObj){//this state only can attack tile,so no need to check
	var pos_ins=instance_position(x,y,targetTypeObj);
	if(pos_ins!=noone){
		temp_for_with=pos_ins;
		break;
	}	
}
targetAns=temp_for_with;
	
//if have,set cursor to there
if(targetAns!=noone){					
	global.cursor_pointer.x=targetAns.x;
	global.cursor_pointer.y=targetAns.y;
}

return targetAns;
	
