/// @description Insert description here
// You can write your code in this editor


var weaponName=getRoleCurWeaponName(manager.fighter[side]);
var draw_x=x;
var draw_y=y;

//***************draw name**********************
draw_set_font(global.font_CN_fightRoom);
draw_set_color(c_black);
draw_text(draw_x,draw_y,weaponName);