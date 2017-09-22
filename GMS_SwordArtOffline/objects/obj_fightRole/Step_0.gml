/// @description Insert description here
// You can write your code in this editor



	if(image_index>image_number-1){
	
	
		image_speed=0;
		global.isHit++; //use the semaphore
		
	
		//if ishit,need wait once aniamtion end;if !ishit,need wait twice aniamtion end
		if(global.isHit==2){
			if(global.fightState==FightState.waitAttackAnimationEnd){
				image_index=0;		
				global.fightState=FightState.startAttackAnimation;
			}
			else if(global.fightState==FightState.waitResultAnimation){
				image_index--;//need a nothing image,so can;t set 0 but set --
				global.fightState=FightState.processXp;
			}
			//show_message(global.fightState);
		}
		else if(global.isHit==1){
			image_index=0;
			show_debug_message("miss animation end");
		}	

	
	}	
