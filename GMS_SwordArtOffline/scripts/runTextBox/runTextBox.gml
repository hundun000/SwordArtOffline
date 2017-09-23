/// @argument0 name_speaker
///	@argument1 text
///	@argument2 rolePhtoSide

var name=argument0
var text=argument1
var side=argument2

var ins=instance_create_layer(0,0,"Layer_abstract",obj_textBox);

ins.text=text;
ins.subImageIndex=getPhotoIndexByName(name);
ins.rolePhotoSide=side;


