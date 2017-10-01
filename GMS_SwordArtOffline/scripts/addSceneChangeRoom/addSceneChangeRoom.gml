/// @argument0 room
/// @argument1 inputReceiver
/// @argument1 room_start_state

var var_room=argument0;
var re=argument1;


var textBoxManager=instance_find(obj_textBox_manager,0);
ds_queue_enqueue(textBoxManager.scenceElements,ScenceElement.changeRoom);

textBoxManager.backRoom=var_room;
textBoxManager.backInputReciever=re;

