/// @argument0 item_name
/// @argument1 item_quality

var item_name=argument0;
var quality=argument1;

if(global.curNumPublicBoxItem<NUM_BOX_ITEM){
	ds_grid_set(global.publicBox,global.curNumPublicBoxItem,INDEX_ITEM_NAME,item_name); 
	ds_grid_set(global.publicBox,global.curNumPublicBoxItem,INDEX_ITEM_QUALITY,quality); 
	global.curNumPublicBoxItem++;
}
