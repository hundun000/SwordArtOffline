/// @description Insert description here
// You can write your code in this editor
draw_self();

var x_menu=50;
var y_menu=50;


if(worldMapState==worldDoMoreSelect){
	

	draw_sprite(spr_worldMenu,0,x_menu,y_menu);

	

	var size=sprite_get_height(spr_worldOption);
	for(var i=0;i<num_option;i++){
			
		var blendColor;
		if(i==worldDoMoreSelectedIndex)
			blendColor=c_orange;
		else
			blendColor=c_white;
		
		for(var j=0;j<num_optionModel;j++){
			if(option[i]==option_model[j])
				draw_sprite_ext(spr_worldOption,j,x_menu,y_menu+i*(5+size),1,1,0,blendColor,1);
		}
		
		
		
		
	}
	

}