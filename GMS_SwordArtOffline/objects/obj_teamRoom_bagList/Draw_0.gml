/// @description Insert description here
// You can write your code in this editor

var i;
var x_text=x;
var y_text=y;

var role=manager.selectedRole;
var size=ds_list_size(role.items);
for(i=0;i<size;i++){
	var item=ds_list_find_value(role.items,i);
	draw_set_color(c_black);
	
	if(item==manager.selectedBagItem){
		if(teamRoomState==TeamRoomState.selectingBagItem)
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+5),item.name+"<<");
		else
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+5),item.name+">>");
	}
	else
		draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+5),item.name);
}