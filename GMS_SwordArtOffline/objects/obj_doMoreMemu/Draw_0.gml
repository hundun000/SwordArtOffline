/// @description Insert description here
// You can write your code in this editor
draw_self();

for(var i=0;i<NUM_DOMORE_OPTION;i++){
	
	var blendColor;
	if(i==doMoreSelectIndex)
		blendColor=c_white;
	else
		blendColor=c_gray;
		
	draw_sprite_ext(spr_domoreOption,i,x,y+(i-NUM_DOMORE_OPTION *0.5-0.5)*(UNIT+5),1,1,0,blendColor,1);

}