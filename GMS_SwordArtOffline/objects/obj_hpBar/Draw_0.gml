/// @description Insert description here
// You can write your code in this editor
var num_remainHp=manager.num_remainHp[side];
var rate_remainHp=manager.rate_remainHp[side];
var color_HpBar;
var left_x=x;
var top_y=y;
var bottom_y=top_y+15;
var lengthFullHp =64

//***************draw Hp text and Hp bar**********************
draw_set_font(fightRoomFont_mid);
if(rate_remainHp>0.5)
	color_HpBar=c_green;
else if(rate_remainHp>0.25)
	color_HpBar=c_yellow;
else
	color_HpBar=c_red;
draw_set_color(color_HpBar);
if(rate_remainHp>0){//hp==0 maybe draw as 1,so skip 0's case
	draw_rectangle(left_x+20,top_y
					,left_x+rate_remainHp*lengthFullHp,bottom_y,false);			
}
draw_text(left_x,top_y,num_remainHp);