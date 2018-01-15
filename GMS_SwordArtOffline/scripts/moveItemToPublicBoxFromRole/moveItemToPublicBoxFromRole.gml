/// @argument0 role
/// @argument1 item_index

var role=argument0;
var item_index=argument1;


if(global.curNumPublicBoxItem<NUM_BOX_ITEM){	
	var item_name=ds_grid_get(role.items,item_index,INDEX_ITEM_NAME);
	var quality=ds_grid_get(role.items,item_index,INDEX_ITEM_QUALITY);
	ds_grid_set(global.publicBox,global.curNumPublicBoxItem,INDEX_ITEM_NAME,item_name); 
	ds_grid_set(global.publicBox,global.curNumPublicBoxItem,INDEX_ITEM_QUALITY,quality);  
	global.curNumPublicBoxItem++;
	removeItemFromRole(role,item_index);
	return "把"+item_name+"x"+string(quality)+"从"+role.name+"行囊移至运输队。";
}
else
	return "运输队已满，无法移动道具。";

