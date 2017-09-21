/// @description Insert description here
// You can write your code in this editor


if(image_index>=image_number-1){
	
	
	image_speed=0;
		
	if(global.fightState=FightState.waitAttackAnimationEnd){
		
		image_index=0;//set to normal image
		global.fightState=FightState.startAttackAnimation;

	}
	else if(global.fightState=FightState.waitResultAnimation){
	
		global.fightState=FightState.processXp;
	
	}

	show_debug_message("animation end");
}	