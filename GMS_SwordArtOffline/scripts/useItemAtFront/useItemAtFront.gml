///@argument0 role
///@argument1 itemIndex

var arg=useItemGeneral(argument0,argument1);
var role=argument0;

var spriteWorkItem=arg[0];
var messageText=arg[1];
var spriteWorkItem;

var instance=instance_create_depth(role.x,role.y,role.depth-1,obj_workItem);
instance.sprite_index=spriteWorkItem;
instance.messageText=messageText;




