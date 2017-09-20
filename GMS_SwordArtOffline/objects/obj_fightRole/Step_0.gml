/// @description Insert description here
// You can write your code in this editor

show_debug_message(image_index);

if(image_index>=image_number-1){
	//set to next turn
	global.fightState=FightState.startAttackAnimation;
	image_index=0;
	image_speed=0;
	show_debug_message("animation end");
}	