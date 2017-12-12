/// @description Insert description here
// You can write your code in this editor

var i;
var x_text=x;
var y_text=y;
var space=20;

var size=global.curNumPublicBoxItem;
for(i=0;i<size;i++){
	var itemName=ds_grid_get(global.publicBox,i,INDEX_ITEM_NAME);
	var itemQuality=ds_grid_get(global.publicBox,i,INDEX_ITEM_QUALITY);
	
	
	if(i==manager.selectedBoxItemIndex){
		draw_set_color(c_orange);
		if(manager.teamRoomState==TeamRoomState.selectingBoxItem){
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+space),itemName+"x"+string(itemQuality)+"<<");
		}
		else {
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+space),itemName+"x"+string(itemQuality)+">>");
		}
	}
	else{
		draw_set_color(c_black);
		draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+space),itemName+"x"+string(itemQuality));
	}
}