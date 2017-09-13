/// @description Insert description here
// You can write your code in this editor
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(mainMenuFront);
draw_set_color(c_white);

var i;
for(i=0;i<array_length_1d(option);i++){
	draw_text(x+space,y+i*space,string(option[i]));
}

draw_sprite(spr_mainMenuOption,0,x+16,y+curOption*space);