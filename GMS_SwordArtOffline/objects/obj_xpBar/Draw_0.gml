/// @description Insert description here
// You can write your code in this editor



//********draw Xp image**********
var xp_bar_y=y;
var xp_left_x=x+20;
var xp_height=25;
var xp_full_width=445;

//bar
draw_self();
//xp
var xp_width=manager.fighter[FIGHT_R].xp/100*xp_full_width;
var xp_top_y=xp_bar_y+40;
draw_set_color(c_orange);
draw_rectangle(xp_left_x,xp_top_y,xp_left_x+xp_width,xp_top_y+xp_height,false);
//number
draw_set_font(global.font_CN_fightRoom);
draw_text(xp_left_x+xp_full_width+10,xp_bar_y+25,manager.fighter[FIGHT_R].xp);
//lv up
if(manager.flag_lv_up){
	draw_sprite(spr_xpBar,1,x,y);
}
