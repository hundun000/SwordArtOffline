/// @description Insert description here
// You can write your code in this editor

#macro THRESHOLD_DEX 4
#macro STEP_reduceHpAnimation 20
#macro LEN_FULL_HP 64

enum FightState{
	preFight,
	startAttackAnimation,
	waitAttackAnimationEnd,
	startResultAnimation,
	waitResultAnimation,
	processXp,
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
		reduceHpAnimationCountDown=-1; //distinguish countdown==0 and init==-1
		global.fightState=FightState.startAttackAnimation;
		
	case FightState.startAttackAnimation:
	
	    //last turn's attack's damage's animation
		if(reduceHpAnimationCountDown>0){
			
			reduceHpAnimationCountDown--;
			

			//wait next step to countinue the animation
			break;
		}
		else if(reduceHpAnimationCountDown==0){//distinguish countdown==0 and init==-1
			
			//the Hp reduction actully happen here
			fighter[!global.curAttackSide].curHp-=actulDamage;
			
			if(fighter[!global.curAttackSide].curHp==0){
			//rival die,fight state to result	
				
				//simply check who die
				if(global.curAttackSide==FIGHT_R){
					flag_enemy_die=true;
					
				}
				else{
					flag_player_die=true;

				}
				
				//set reduce animation as normal hp bar
				reduceHpAnimationCountDown=-1;
				
				global.fightState=FightState.startResultAnimation;
				return;
			}
			else{
			//countinue to next turn
			
				//switch attack side
				global.curAttackSide=!global.curAttackSide;
			}
			
			
			
		}
	
		if(turnTimes[global.curAttackSide]>0){
			turnTimes[global.curAttackSide]--;
			
			//*******************process data****************

			//ramdom critical
			var criticalRate=clamp(fighter[global.curAttackSide].dex-fighter[!global.curAttackSide].dex,0,50);    //range in (0,50)% ,线性增加
			var isCritical=(random(100)<criticalRate);
			//!!!!!!!!! current ignore critical attack !!!!!!!!!!!!
			
			//culculate damage
			var preDamage=fighter[global.curAttackSide].atk-fighter[!global.curAttackSide].def;
			actulDamage=clamp(preDamage,0,fighter[!global.curAttackSide].curHp);		
			//oprate the role Hp data will happen after Hp reduce animation finished
			
			
			//*******************process animation****************
			//process one turn,play animations,thus retrieve its speed
			attackAnimation[global.curAttackSide].image_speed=1;
			attackAnimation[global.curAttackSide].depth=DEPTH_FRONT;
			attackAnimation[!global.curAttackSide].depth=DEPTH_BACK;
			
			
			//*******************process state change****************
			//wait attack animation,and reuce HP animation
			reduceHpAnimationCountDown=STEP_reduceHpAnimation;
			global.fightState=FightState.waitAttackAnimationEnd;
		}
		else{
		//both side done
			//As checked before,no die happen 
			
			//set reduce animation as normal hp bar
			reduceHpAnimationCountDown=-1;
			
			global.fightState=FightState.processXp;
		}
		
		
		break;
	case FightState.waitAttackAnimationEnd:
		//when animation finished,the content object will change the state
		break;
	case FightState.startResultAnimation:
		if(flag_enemy_die||flag_enemy_die){
			//*******************process die animation****************
			//must be other side die
			attackAnimation[!global.curAttackSide].sprite_index=getDieSpriteByRole(fighter[!global.curAttackSide]);
			attackAnimation[!global.curAttackSide].image_speed=1;
			
			global.fightState=FightState.waitResultAnimation;
		}
		break;
	case FightState.waitResultAnimation:
		break;
	default:
		show_debug_message("enter swtich default");
}