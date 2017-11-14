/// @description Insert description here
// You can write your code in this editor
draw_self();

if(worldMapState==WorldMapState.worldDoMoreSelect){
	
	draw_set_color(c_white);
	draw_rectangle(0,0,150,300,false);
	

	
	draw_set_font(fightRoomFont_big);
	var fontSize=font_get_size(fightRoomFont_big);
	for(var i=0;i<num_option;i++){
			
		if(i==worldDoMoreSelectedIndex)
			draw_set_color(c_orange);
		else
			draw_set_color(c_black);
			
		draw_text(0,i*(5+fontSize),option[i]);	
	}
	

}