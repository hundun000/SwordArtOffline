/// @argument0 role
/// @argument1 item_index

var role=argument0;
var item_index=argument1;


if(role.curNumItem<NUM_ROLE_ITEM){	
	var item_name=ds_grid_get(global.publicBox,item_index,INDEX_ITEM_NAME);
	var quality=ds_grid_get(global.publicBox,item_index,INDEX_ITEM_QUALITY);
	ds_grid_set(role.items,role.curNumItem,INDEX_ITEM_NAME,item_name); 
	ds_grid_set(role.items,role.curNumItem,INDEX_ITEM_QUALITY,quality);  
	role.curNumItem++;
	removeItemFromPublicBox(item_index);
	return "把"+item_name+"x"+string(quality)+"从运输队移至"+role.name+"行囊。";
}
else
	return "行囊已满，无法移动道具。";

