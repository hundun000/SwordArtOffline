/// @argument0 item_index

var item_index=argument0;


if(global.curNumPublicBoxItem>item_index){
	var i;
	var item_name;
	var quality;
	for(i=item_index+1;i<global.curNumPublicBoxItem;i++){
		item_name=ds_grid_get(global.publicBox,i,INDEX_ITEM_NAME);
		quality=ds_grid_get(global.publicBox,i,INDEX_ITEM_QUALITY);
		ds_grid_set(global.publicBox,i-1,INDEX_ITEM_NAME,item_name); 
		ds_grid_set(global.publicBox,i-1,INDEX_ITEM_QUALITY,quality); 
	}
	item_name=ds_grid_get(global.publicBox,item_index,INDEX_ITEM_NAME);
	quality=ds_grid_get(global.publicBox,item_index,INDEX_ITEM_QUALITY);
	ds_grid_set(global.publicBox,i-1,INDEX_ITEM_NAME,noone); 
	ds_grid_set(global.publicBox,i-1,INDEX_ITEM_QUALITY,noone); 
	global.curNumPublicBoxItem--;
	return "remove "+item_name+"x"+string(quality)+" from box";
}
