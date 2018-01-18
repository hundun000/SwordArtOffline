/// @description Insert description here
// You can write your code in this editor

var message_left_x=x;
var message_top_y=y;
var hitRate=manager.hitRate[side];
var preDamage=manager.preDamage[side];
var criticalRate=manager.criticalRate[side];
//***************draw fight message**********************
draw_set_font(fightRoomFont_small);
draw_set_color(c_black);
draw_text(message_left_x,message_top_y,hitRate);
draw_text(message_left_x,message_top_y+font_get_size(fightRoomFont_small)+1,preDamage);
draw_text(message_left_x,message_top_y+font_get_size(fightRoomFont_small)*2+2,criticalRate);