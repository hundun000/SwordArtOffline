/// @description Insert description here
// You can write your code in this editor

var message_left_x=x;
var message_top_y=y;
var hitRate=manager.hitRate[side];
var preDamage=manager.preDamage[side];
var criticalRate=manager.criticalRate[side];
//***************draw fight message**********************
draw_set_font(global.font_CN_fightRoom);
draw_set_color(c_black);
draw_text(message_left_x,message_top_y,hitRate);
draw_text(message_left_x,message_top_y+font_get_size(global.font_CN_fightRoom)+5,preDamage);
draw_text(message_left_x,message_top_y+(font_get_size(global.font_CN_fightRoom)+5)*2,criticalRate);