///@argument0 input_dx
///@argument1 input_dy
///@argument2 targetTileObj
///@argument3 targetTypeObj
var input_dx=argument0;
var input_dy=argument1;
var targetTileObj=argument2;
var targetTypeObj=argument3;
var targetAns=noone;

//switch target

var cursoX=global.cursor_pointer.x;
var cursoY=global.cursor_pointer.y;
var intoWith_input_dx=input_dx;
var intoWith_input_dy=input_dy;
//search at inputted direction
with(targetTileObj){//this state only can attack tile,so no need to check
	var pos_ins=instance_position(x,y,targetTypeObj);
	if(!(x==cursoX&&y==cursoY) //no current
	  &&(sign(intoWith_input_dx)==sign(x-cursoX)||sign(intoWith_input_dy)==sign(y-cursoY)) //inputted direction
	  &&pos_ins!=noone){
		targetAns=pos_ins;
		break;
	}	
}

//if have another,change cursor to there
if(targetAns!=noone){	
	global.cursor_pointer.x=targetAns.x;
	global.cursor_pointer.y=targetAns.y;
}

return targetAns;