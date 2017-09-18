/// @description Insert description here
// You can write your code in this editor


var myX=(mouse_x div UNIT+0.5)*UNIT;
var myY=(mouse_y div UNIT+0.5)*UNIT;


if(mp_grid_path(gridMap,rolePath,x,y,myX,myY,false)){
	show_debug_message(path_get_number(rolePath));
	path_start(rolePath,4,path_action_stop,false);
}
