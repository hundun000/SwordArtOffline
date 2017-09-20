/// @description Insert description here
// You can write your code in this editor

#macro THRESHOLD_DEX 4

enum FightState{
	preFight,
	startAttackAnimation,
	waitAttackAnimationEnd,
	startResultAnimation,
	fightEnd
}

enum AttackSideType{
	onlyLeft,
	onlyRight,
	both
}

//show_debug_message("judge step");

switch(global.fightState){
	case FightState.preFight:
		//show_debug_message("into preFight");
		//init turnTimes
		var dif=fighter[FIGHT_R].dex-fighter[FIGHT_L].dex;
		turnTimes[FIGHT_L]=1+(dif<=-THRESHOLD_DEX);
		turnTimes[FIGHT_R]=1+(dif>=THRESHOLD_DEX);
		
		//process if is one side attack
		switch(global.attackSideType){
			case AttackSideType.onlyLeft:
				turnTimes[FIGHT_R]=0;
				break;
			case AttackSideType.onlyRight:
				turnTimes[FIGHT_L]=0;
				break;
			default:	
		}
		
		//init animation
		attackAnimation[FIGHT_L].sprite_index=getAttackSpriteByRole(fighter[FIGHT_L]);
		attackAnimation[FIGHT_L].image_xscale=-1;
		attackAnimation[FIGHT_R].sprite_index=getAttackSpriteByRole(fighter[FIGHT_R]);
		attackAnimation[FIGHT_L].image_speed=0;
		attackAnimation[FIGHT_R].image_speed=0;
		
		//not break! countinue this step to next case!
		global.fightState=FightState.startAttackAnimation;
		
	case FightState.startAttackAnimation:
		//show_debug_message("into startAttackAnimation");
		if(turnTimes[global.curAttackSide]>0){
			turnTimes[global.curAttackSide]--;
			//process one turn,play animations,thus retrieve its speed
			attackAnimation[global.curAttackSide].image_speed=1;
			//switch attack side
			attackAnimation[global.curAttackSide].depth=DEPTH_FRONT;
			global.curAttackSide=!global.curAttackSide;
			attackAnimation[global.curAttackSide].depth=DEPTH_BACK;
			//wait animation
			global.fightState=FightState.waitAttackAnimationEnd;
		}
		else{
			//both side done
			global.fightState=FightState.startResultAnimation;
		}
		
		break;
	case FightState.waitAttackAnimationEnd:
		//show_debug_message("waitAttackAnimationEnd");
		//when animation finished,the content object will change the state
		break;
	default:
		show_debug_message("enter swtich default");
}