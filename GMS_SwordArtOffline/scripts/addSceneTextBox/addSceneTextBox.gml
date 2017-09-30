/// @argument0 name_speaker
///	@argument1 text
///	@argument2 rolePhtoSide

var name=argument0
var text=argument1
var side=argument2

//var ins=instance_create_layer(0,0,"Layer_abstract",obj_textBox);



var textBoxManager=instance_find(obj_textBox_manager,0);
ds_queue_enqueue(textBoxManager.scenceElements,ScenceElement.textBox);

ds_queue_enqueue(textBoxManager.texts,text);
ds_queue_enqueue(textBoxManager.names,name);
ds_queue_enqueue(textBoxManager.sides,side);
