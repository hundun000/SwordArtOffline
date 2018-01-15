/// @description Insert description here
// You can write your code in this editor


draw_self();

var i;
var x_text=x;
var y_text=y;
var space=20;


var size=manager.num_option;
for(i=0;i<size;i++){
	var option=ds_list_find_value(manager.menuOption,i);
	
	if(i==manager.selectedHomeOptionIndex){
		draw_set_color(c_orange);	
	}
	else{
		draw_set_color(c_black);
	}
	draw_text(x_text,y_text+i*(font_get_size(global.font_CN_homeMenu)+space),ds_list_find_value(manager.menuOption,i));
		


}