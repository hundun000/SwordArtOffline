/// @argument0 role
/// @argument1 item_index

var role=argument0;
var item_index=argument1;


if(role.curNumItem>item_index){
	var i;
	var item_name;
	var quality;
	for(i=item_index+1;i<role.curNumItem;i++){
		item_name=ds_grid_get(role.items,i,INDEX_ITEM_NAME);
		quality=ds_grid_get(role.items,i,INDEX_ITEM_QUALITY);
		ds_grid_set(role.items,i-1,INDEX_ITEM_NAME,item_name); 
		ds_grid_set(role.items,i-1,INDEX_ITEM_QUALITY,quality); 
	}
	item_name=ds_grid_get(role.items,item_index,INDEX_ITEM_NAME);
	quality=ds_grid_get(role.items,item_index,INDEX_ITEM_QUALITY);
	ds_grid_set(role.items,i-1,INDEX_ITEM_NAME,noone); 
	ds_grid_set(role.items,i-1,INDEX_ITEM_QUALITY,noone); 
	role.curNumItem--;
	return "把"+item_name+"x"+string(quality)+"从"+role.name+"身上移除了。";
}
