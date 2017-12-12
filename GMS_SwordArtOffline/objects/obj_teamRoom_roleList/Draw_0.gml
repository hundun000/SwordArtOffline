/// @description Insert description here
// You can write your code in this editor

var i;
var x_text=x;
var y_text=y;
var space=20;

var size=ds_list_size(global.playerWorldTeam);
for(i=0;i<size;i++){
	var role=ds_list_find_value(global.playerWorldTeam,i);
	
	
	if(role==manager.selectedTeamRole){
		draw_set_color(c_orange);
		if(manager.teamRoomState==TeamRoomState.selectingRole)
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+space),role.name+"<<");
		else
			draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+space),role.name+">>");
	}
	else{
		draw_set_color(c_black);
		draw_text(x_text,y_text+i*(font_get_size(font_teamRoom)+space),role.name);
	}
}