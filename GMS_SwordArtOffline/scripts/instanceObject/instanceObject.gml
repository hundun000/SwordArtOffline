///@argument0 object
///@argument1 list_instances

var object=argument0;
var list_instances=argument1;

var ins=instance_create_depth(0,0,0,object);
ds_list_add(list_instances,ins);

return ins;