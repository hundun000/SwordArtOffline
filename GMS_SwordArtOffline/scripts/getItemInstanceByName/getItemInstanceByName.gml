var name=argument0;

var size=ds_list_size(global.instanceManager.list_instances);
for(var i=0;i<size;i++){
	var ins=ds_list_find_value(global.instanceManager.list_instances,i);
	if(ins.name==name)
		return ins;
}
return noone;