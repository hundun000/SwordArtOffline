/// @description Insert description here
// You can write your code in this editor
var i;
var x_text=x;
var y_text=y;
var space=20;
var targetSign;
	
if(index==manager.selectedSlotIndex){
	draw_set_color(c_orange);
	if(manager.teamLayoutState=TeamLayoutState.selectingSlot)
		targetSign="<<";
	else
		targetSign=">>";
}
else{
	draw_set_color(c_black);
	targetSign="";
}



var role=ds_list_find_value(manager.teamLayoutSlots,index);
if(role!=noone){
	
		
	
	draw_text(x_text,y_text+0*(font_get_size(global.font_CN_teamRoom)+space),"名字:"+role.name+targetSign);
	draw_text(x_text,y_text+1*(font_get_size(global.font_CN_teamRoom)+space),"等级:"+string(role.lv));
}
else{
	draw_text(x_text,y_text+0*(font_get_size(global.font_CN_teamRoom)+space),"无");
}