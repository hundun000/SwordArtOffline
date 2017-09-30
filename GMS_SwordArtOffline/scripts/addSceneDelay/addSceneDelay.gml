/// @argument0 delay_time


var time=argument0


var textBoxManager=instance_find(obj_textBox_manager,0);
ds_queue_enqueue(textBoxManager.scenceElements,ScenceElement.delay);

ds_queue_enqueue(textBoxManager.delayTimes,time);
