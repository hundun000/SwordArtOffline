/// @description Insert description here
// You can write your code in this editor
var size=ds_list_size(global.playerWorldTeam);
var i;
var x_text=x;
var y_text=y;
for(i=0;i<size;i++){
	var role=ds_list_find_value(global.playerWorldTeam,i);
	draw_set_color(c_black);
	
	if(role==manager.selectedRole){
		if(manager.teamRoomState==TeamRoomState.selectingBagItem)
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+5),role.name+"<<");
		else
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+5),role.name+">>");
	}
	else
		draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+5),role.name);
}