/// @description Insert description here
// You can write your code in this editor

#macro THRESHOLD_DEX 4
#macro STEP_reduceHpAnimation 40
#macro LEN_FULL_HP 64
#macro XP_SPEED 1

enum FightState{
	preFight,
	waitStartDelay,
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

//show_debug_message(global.fightState);



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
		attackAnimation[FIGHT_R].sprite_index=getAttackSpriteByRole(fighter[FIGHT_R]);
		attackAnimation[FIGHT_L].image_xscale=-1;
		attackAnimation[FIGHT_L].image_speed=0;
		attackAnimation[FIGHT_R].image_speed=0;
		
		startDelay=STEP_reduceHpAnimation;
		reduceHpAnimationCountDown=-1; //distinguish countdown==0 and init==-1
		global.fightState=FightState.waitStartDelay;
		
		break;
		
	case FightState.waitStartDelay:
	
		if(startDelay>0){		
			startDelay--;
		}
		else{
			fightState=FightState.startAttackAnimation;
		}
		
		break;
		
	case FightState.startAttackAnimation:
	
	    //last turn's attack's damage's animation
		if(reduceHpAnimationCountDown>0){
			
			reduceHpAnimationCountDown--;
			
			//wait next step to countinue the animation
			return;
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
			
			//*******************process data***************
			//oprate the role Hp data will happen after Hp reduce animation finished
			
			//ramdom critical
			isCriticalHappen=(random(100)<criticalRate[global.curAttackSide]);
			
			if(isCriticalHappen){
				actulDamage=clamp(preDamage[global.curAttackSide]*3,0,fighter[!global.curAttackSide].curHp);	
				global.isHit=true;
			}
			else{
				//ramdom hit
				global.isHit=(random(100)<hitRate[global.curAttackSide]);
				if(global.isHit)
					actulDamage=clamp(preDamage[global.curAttackSide],0,fighter[!global.curAttackSide].curHp);		
				else
					actulDamage=0;
			}

			
			//*******************process animation****************
			//process one turn,play animations,thus retrieve its speed

			//current side animation can be normal or critical,while speed must set to 1
			if(isCriticalHappen){
				attackAnimation[global.curAttackSide].sprite_index=getCriticalSpriteByRole(fighter[global.curAttackSide]);
			}
			else{
				attackAnimation[global.curAttackSide].sprite_index=getAttackSpriteByRole(fighter[global.curAttackSide]);
			}
			attackAnimation[global.curAttackSide].image_speed=1;
			
			//default set to miss sprite,just image speed set depend on isHit
			attackAnimation[!global.curAttackSide].sprite_index=getMissSpriteByRole(fighter[!global.curAttackSide]);
			attackAnimation[!global.curAttackSide].image_speed=(!global.isHit);

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
		if(flag_enemy_die||flag_player_die){
			//*******************process die animation****************
			//must be other side die
			attackAnimation[!global.curAttackSide].sprite_index=getDieSpriteByRole(fighter[!global.curAttackSide]);
			attackAnimation[!global.curAttackSide].image_speed=1;
			//mean only need one animation finish
			isHit=1;
			global.fightState=FightState.waitResultAnimation;
		}
		break;
	case FightState.waitResultAnimation:
		//when animation finished,the content object will change the state
		break;
	case FightState.processXp:
		if(flag_player_die){
			//-----------say something
			
			global.fightState=FightState.fightEnd;
			return;
		}
		
		if(waitAddXp==-1){
		//if waitAddXp not init		
			if(flag_enemy_die){
				//died must be other side
				waitAddXp=clamp(fighter[!global.curAttackSide].xp
							*(5-(fighter[!global.curAttackSide].lv-fighter[global.curAttackSide].lv))
							,10,100);
			}
			else{
				waitAddXp=3;
			}	
			depth=DEPTH_FRONT;
			attackAnimation[0].depth=DEPTH_BACK;
			attackAnimation[1].depth=DEPTH_BACK;
		}


		if(waitAddXp>0){
			//********proces Xp data**********
			//must right side add xp
			if(waitAddXp>=XP_SPEED){	
				fighter[FIGHT_R].xp+=XP_SPEED;
				waitAddXp-=XP_SPEED;
			}
			else{
				fighter[FIGHT_R].xp+=waitAddXp;
				waitAddXp=0;
			}
				
				
			if(fighter[FIGHT_R].xp>=100){
				fighter[FIGHT_R].xp-=100;
				flag_lv_up=true;
				var lv_up_delay=120;
				lv_up_countDown=lv_up_delay;
										
				lv_isAdd[INDEX_HP]=random(100)>80;
				lv_isAdd[INDEX_ATK]=random(100)>50;
				lv_isAdd[INDEX_DEF]=random(100)>50;
				lv_isAdd[INDEX_DEX]=random(100)>30;										 
			}
		}
		else{
		//Xp add finish ,no long draw Xp ,maybe draw lv up 
		
			if(flag_lv_up){
				lv_up_countDown--;
				if(lv_up_countDown==0)
					flag_lv_up=false;
			}
			else{
				fightEnd_delay=-1;
				global.fightState=FightState.fightEnd;
			}
				
		}
	
		break;	
	
	case FightState.fightEnd:
		
		if(fightEnd_delay==-1){
			fightEnd_delay=120;
		}
		else if(fightEnd_delay>0){
			fightEnd_delay--;
		}
		else{
		
			if(flag_enemy_die){
				//destroy the died enemy
				instance_destroy(fighter[!global.curAttackSide]);
			}	
				//!!!!!!!!!!!!!!!! ignore player die
			for(var i=0;i<array_length_1d(global.playerFrontTeam);i++)
				global.playerFrontTeam[i].visible=true;		
				
			
			room_goto(room_map_0);
		}
		break;
		
	default:
		show_debug_message("enter swtich default");
}