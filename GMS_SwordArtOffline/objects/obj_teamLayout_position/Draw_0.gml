/// @description Insert description here
// You can write your code in this editor

var roleAtPos=ds_list_find_value(manager.teamLayoutSlots,index);

if(roleAtPos==noone){
	sprite_index=spr_teamPosition
	image_index=index;
}
else{
	sprite_index=roleAtPos.sprite_index;
	image_index=manager.positonSimultaneousFrame;
}

draw_self();