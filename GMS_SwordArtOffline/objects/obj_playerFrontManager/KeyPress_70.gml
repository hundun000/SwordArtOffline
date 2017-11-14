/// @description Insert description here
// You can write your code in this editor
show_debug_message("Front Team:");
for(var i=0;i<ds_list_size(global.playerFrontTeam);i++)
	show_debug_message(ds_list_find_value(global.playerFrontTeam,i).name);