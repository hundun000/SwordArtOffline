/// @description Insert description here
// You can write your code in this editor



	if(image_index>image_number-1){
	
	
		image_speed=0;
		manager.isHit++; //use the semaphore
		
	
		//if ishit,need wait once aniamtion end;if !ishit,need wait twice aniamtion end
		if(manager.isHit==2){
			if(manager.fightState==FightState.waitAttackAnimationEnd){
				image_index=0;		
				manager.fightState=FightState.startAttackAnimation;
			}
			else if(manager.fightState==FightState.waitResultAnimation){
				image_index--;//need a nothing image,so can;t set 0 but set --
				manager.fightState=FightState.processXp;
			}
			//show_message(manager.fightState);
		}
		else if(manager.isHit==1){
			image_index=0;
			show_debug_message("miss animation end");
		}	

	
	}	
