/// @description Insert description here
// You can write your code in this editor

var fighterName=manager.fighter[side].name;
var name_left_x=x;
var name_top_y=y;

//***************draw name**********************
draw_set_font(fightRoomFont_mid);
draw_set_color(c_black);
draw_text(name_left_x,name_top_y,fighterName);