/// @argument0 name_mover
/// @argument1 destinations_tile_x
///	@argument2 destinations_tile_y
///	@argument3 movementSpeed


var name=argument0
var des_x=argument1
var des_y=argument2
var spd=argument3



//var ins=instance_create_layer(0,0,"Layer_abstract",obj_textBox);



var textBoxManager=instance_find(obj_textBox_manager,0);
ds_queue_enqueue(textBoxManager.scenceElements,ScenceElement.movement);

ds_queue_enqueue(textBoxManager.moverNames,name);
ds_queue_enqueue(textBoxManager.destinations_tile_x,des_x);
ds_queue_enqueue(textBoxManager.destinations_tile_y,des_y);
ds_queue_enqueue(textBoxManager.movementSpeed,spd);
